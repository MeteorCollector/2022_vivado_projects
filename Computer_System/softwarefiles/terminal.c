#include "sys.h"

#define MAXBUF 128
#define MAXFIB 50
uint32_t time_elapsed;
int fib[MAXFIB];
static char __backup_screen[VGA_MAXLINE][VGA_MAXCOL] = { 0 };
static int __vga_line = 0;
static int __vga_ch = 0;

void __bufputch(char ch)
{
    char* __vga_start = (char*) VGA_START;
    __vga_start[(__vga_line << 7) + __vga_ch] = ch;
    backup_screen[__vga_line][__vga_ch] = ch;
    __vga_ch++;
    if(__vga_ch >= VGA_MAXCOL) { 
      __vga_ch--; 
      __vga_line = (__vga_line >= VGA_MAXLINE - 1) ? VGA_MAXLINE - 1 : __vga_line + 1;
      __vga_ch = 0;
    }
    return;
}

static void __refresh_screen()
{
    __vga_line = 0;
    __vga_ch = 0;
    for (int i = 0; i < VGA_MAXLINE; i++)
        for (int j = 0; j < VGA_MAXCOL; j++)
            __bufputch(__backup_screen[i][j]);
    __vga_line = 0;
    __vga_ch = 0;
}

//-------------------------------------------------- logo part -------------------------
#define logo_width 49
#define logo_height 11
static int logo_x = 0;
static int logo_y = 0;
static int logo_xdir = 1;
static int logo_ydir = 1;
char logo[logo_height][logo_width] =
{
    "888b    888888888888     888 .d8888b.  .d8888b. ",
    "8888b   888  \"88b888     888d88P  Y88bd88P  Y88b",
    "88888b  888   888888     888888    888Y88b.     ",
    "888Y88b 888   888888     888888        \"Y888b.  ",
    "888 Y88b888   888888     888888           \"Y88b.",
    "888  Y88888   888888     888888    888      \"888",
    "888   Y8888   88PY88b. .d88PY88b  d88PY88b  d88P",
    "888    Y888   888 \"Y88888P\"  \"Y8888P\"  \"Y8888P\" ",
    "            .d88P                               ",
    "Welcome to.d88P\"  Computer System created by syq",
    "   the   888P\"    A Digital Design project, 2022"
};

void logo_step()
{
    if (logo_x <= 0) logo_xdir = 1;
    if (logo_x + logo_width >= VGA_MAXCOL - 1) logo_xdir = -1;
    if (logo_y <= 0) logo_ydir = 1;
    if (logo_y + logo_height >= VGA_MAXLINE - 1) logo_ydir = -1;
    logo_x += logo_xdir;
    logo_y += logo_ydir;
    for (int i = 0; i < VGA_MAXLINE; i++)
        for (int j = 0; j < VGA_MAXCOL; j++)
            __backup_screen[i][j] = ' ';
    for (int i = 0; i < logo_height; i++)
        for (int j = 0; j < logo_width; j++)
            __backup_screen[i + logo_y][j + logo_x] = logo[i][j];
    __refresh_screen();
}

static int cmd_sleep(char* args)
{
    char input = 0;
    uint32_t tick = 0;
    while (1)
    {
        if (get_keyboard())
        {
            vga_init();
            return 0;
        }
        if (*(uint32_t*)TIMER_START / (uint32_t)40 > tick)
        {
            tick = *(uint32_t*)TIMER_START / (uint32_t)40;
            logo_step();
        }
    }
    return 0;
}

//-----------------------------------------------------------------------------------------------------------------

static uint32_t difficulty[5] = { 1000, 500, 150, 125, 50 };
static int snake_dir, snake_x, snake_y, snake_len;
#define map_h 28
#define map_w 40
static int food_x, food_y;
static int map[map_h][map_w];
// up, down, left, right
static int dx[4] = { 0, 0, -1, 1 };
static int dy[4] = { -1, 1, 0, 0 };
static bool ignore_next = false;

static void draw_graphic()
{
    int map_x = (VGA_MAXCOL - map_w) >> 1;
    int map_y = (VGA_MAXLINE - map_h) >> 1;
    for (int i = 0; i < VGA_MAXLINE; i++)
        for (int j = 0; j < VGA_MAXCOL; j++)
            __backup_screen[i][j] = '.';
    for (int i = 0; i < map_h; i++)
        for (int j = 0; j < map_w; j++)
            __backup_screen[i + map_y][j + map_x] = map[i][j] < 0 ? '#' : map[i][j] > 0 ? '0' : ' ';
    __backup_screen[food_y + map_y][food_x + map_x] = '*';
    __refresh_screen();
}

static void new_food()
{
    food_x = 0;
    food_y = 0;
    while (map[food_y][food_x] != 0)
    {
        food_x = (uint32_t)rand() % (uint32_t)(map_w - 2) + 1;
        food_y = (uint32_t)rand() % (uint32_t)(map_h - 2) + 1;
    }
}

static void init_game()
{
    for (int i = 0; i < map_h; i++)
        for (int j = 0; j < map_w; j++)
            map[i][j] = (i == 0 || i == map_h - 1 || j == 0 || j == map_w - 1) ? -1 : 0;
    snake_x = map_w >> 1;
    snake_y = map_h >> 1;
    snake_len = 3;
    snake_dir = 3;
    ignore_next = false;
    map[snake_y][snake_x] = snake_len;
    map[snake_y][snake_x - 1] = snake_len - 1;
    new_food();
}

static int game_step()
{
    if (!ignore_next) {
        for (int i = 0; i < map_h; i++)
            for (int j = 0; j < map_w; j++)
                if (map[i][j] > 0) { map[i][j]--; }
    }
    else { ignore_next = false; }
    snake_x += dx[snake_dir];
    snake_y += dy[snake_dir];
    if (map[snake_y][snake_x] != 0) { return -1; }
    map[snake_y][snake_x] = snake_len;
    if (snake_x == food_x && snake_y == food_y) {
        snake_len++;
        new_food();
        ignore_next = true;
    }
    draw_graphic();
    return 0;
}

static int cmd_game(char* args)
{
    putstr("Welcome by GLUTTONOUS SNAKES by syq.\nPlease select a difficulty to start: Easy [1] [2] [3] [4] [5] Difficult\nEnter \'q\' to quit.\n");
    char input = 0;
    char buf[32];
    int level = 1;
    int len = 0;
    bool selected = false;
    uint32_t tick = 0;
    while (!selected)
    {
        input = wait_keyboard();
        switch (input)
        {
            case 'q': return 0;
            case '1': level = 0; selected = true; break;
            case '2': level = 1; selected = true; break;
            case '3': level = 2; selected = true; break;
            case '4': level = 3; selected = true; break;
            case '5': level = 4; selected = true; break;
            default: break;
        }
    }
    init_game();
    while (1)
    {
        input = get_keyboard();
        switch (input)
        {
        case 'q': 
            roll_up();
            len = itoa(snake_len, buf, 10);
            putstr("Game Over!\nYour final length = ");
            putstr(buf);
            putstr(".\n");
        return 0;
        case 'w': snake_dir = 0; break;
        case 's': snake_dir = 1; break;
        case 'a': snake_dir = 2; break;
        case 'd': snake_dir = 3; break;
        case 'W': snake_dir = 0; break;
        case 'S': snake_dir = 1; break;
        case 'A': snake_dir = 2; break;
        case 'D': snake_dir = 3; break;
        default: break;
        }
        uint32_t current_tick = *(uint32_t*)TIMER_START / difficulty[level];
        if (current_tick > tick)
        {
            tick = current_tick;
            if (game_step() < 0) { 
                roll_up();
                len = itoa(snake_len, buf, 10);
                putstr("Game Over!\nYour final length = ");
                putstr(buf);
                putstr(".\n"); 
                return 0;  
            }
        }
    }
    return 0;
}

//-----------------------------------------------------------------------------------------------------------------
static int cmd_timer(char* args)
{
    uint32_t frame = 20;
    char input = 0;
    uint32_t tick = 0;
    char buf[32];
    int len = 0;
    while (1)
    {
        input = get_keyboard();
        if (input == 'q') { return 0; }
        uint32_t current_tick = *(uint32_t*)TIMER_START / frame;
        if (current_tick > tick)
        {
            tick = current_tick;
            uint32_t second = *(uint32_t*)TIMER_START / (uint32_t)1000;
            vga_init();
            putstr("[timer] ");
            len = itoa(second / (uint32_t)3600, buf, 10);
            putstr(buf);
            putstr("h ");
            len = itoa((second / (uint32_t)60) % (uint32_t)60, buf, 10);
            putstr(buf);
            putstr("m ");
            len = itoa(second % (uint32_t)60, buf, 10);
            putstr(buf);
            putstr("s ");
            len = itoa(*(uint32_t*)TIMER_START % (uint32_t)1000, buf, 10);
            putstr(buf);
            putstr(" since booted.\nEnter \'q\' to quit timer.\n");
        }
    }
    return 0;
}

void extract_token(char* cmd, char* arg, char* src)
{
    char* srcptr = src; char* cmdptr = cmd; char* argptr = arg;
    *cmdptr = 0; *argptr = 0;
    while (*srcptr && (*srcptr != ' ')) { *cmdptr = *srcptr; cmdptr++; srcptr++; }
    *cmdptr = 0;
    if (*srcptr == 0) { return; }
    //assert(*srcptr == ' ');
    srcptr++;
    while (*srcptr) { *argptr = *srcptr; argptr++; srcptr++; }
    *argptr = 0;
    return;
}

static char line_read[MAXBUF];

static char* rl_gets() {
    
    if (line_read) {
        line_read[0] = 0;
    }

    putstr("user@syqterminal: ");
    wait_line(line_read);
    line_read[strlen(line_read)] = 0;
    return line_read;
}

static int cmd_hello(char* args) {
    putstr("Hello World!\n");
    return 0;
}


static int cmd_echo(char* args) {
    putstr(args);
    putch('\n');
    return 0;
}

void fiball()
{
    fib[0] = 0; fib[1] = 1;
    int i = 2;
    for (; i < MAXFIB; i++)
    {
        fib[i] = fib[i - 1] + fib[i - 2];
    }
}

static int cmd_fib(char* args) {
    char cmd[MAXBUF];
    char arg[MAXBUF];
    char buf[32];
    int len = 0;
    extract_token(cmd, arg, args);

    if (!*arg) {
        int idx = atoi(cmd);
        if (idx < 0) { putstr("error: index can not be negative.\n"); return 0; }
        if (idx > 46) { putstr("error: result out of range \'int\'.\n"); return 0; }
        len = itoa(fib[idx], buf, 10);
        putstr(buf);
        putch('\n');
        return 0;
    }
    else if (strcmp(arg, "all") == 0)
    {
        int idx = atoi(cmd);
        if (idx < 0) { putstr("error: index can not be negative.\n"); return 0; }
        if (idx > 46) { putstr("error: result out of range \'int\'.\n"); return 0; }
        for (int i = 0; i <= idx; i++) 
        {
            putstr("[");
            len = itoa(i, buf, 10);
            putstr(buf);
            putstr("]    ");
            len = itoa(fib[i], buf, 10);
            putstr(buf);
            putch('\n');
        }
        return 0;
    }
    else { 
        putstr("Unknown argument \'");
        putstr(arg);
        putstr("\'.\n");
        return 0; 
    }
    return 0;
}

static int cmd_smile(char* args) {
    putstr("(  = w = )\n");
    return 0;
}

// work of telkwevr ends here.

static int cmd_help(char* args);

static struct {
    const char* name;
    const char* description;
    int (*handler) (char*);
} cmd_table[] = {
  { "help", "Display information about all supported commands.", cmd_help },
  { "hello", "Print \'Hello, World\' on the screen.", cmd_hello },
  { "echo", "Echoes your input.", cmd_echo },
  { "fib", "\'fib <n>\' gives the nth menber of Fibonacci numbers. \'fib <n> all\' gives all results from 0 to n.", cmd_fib},
  { "time", "Show elapsed time.", cmd_timer },
  { "sleep", "Show sleeping screen.", cmd_sleep },
  { "snake", "Play snake game", cmd_game },
  { "smile", "just for fun", cmd_smile },

  /* TODO: Add more commands */

};

#define NR_CMD 8 // amount of cmd.

static int cmd_help(char* args) {
    /* extract the first argument */
    char cmd[MAXBUF];
    char arg[MAXBUF];
    extract_token(arg, cmd, args);
    int i;

    if (!*arg) {
        /* no argument given */
        for (i = 0; i < NR_CMD; i++) {
            putstr(cmd_table[i].name);
            putstr(" - ");
            putstr(cmd_table[i].description);
            putch('\n');
        }
    }
    else {
        for (i = 0; i < NR_CMD; i++) {
            if (strcmp(arg, cmd_table[i].name) == 0) {
                putstr(cmd_table[i].name);
                putstr(" - ");
                putstr(cmd_table[i].description);
                putch('\n');
                return 0;
            }
        }
        putstr("help: Unknown command \'");
        putstr(arg);
        putstr("\'.\n");
    }
    return 0;
}


void sdb_mainloop() {
    for (char* str; (str = rl_gets()); ) {

        /* extract the first token as the command */
        char cmd[MAXBUF];
        char args[MAXBUF];
        extract_token(cmd, args, str);
        //printf("your extracted: %s\n", cmd);
        if (*cmd == 0) { continue; }
        /* treat the remaining string as the arguments
         * which may need further parsing
         */

        int i;
        for (i = 0; i < NR_CMD; i++) {
            if (strcmp(cmd, cmd_table[i].name) == 0) {
                if (cmd_table[i].handler(args) < 0) { return; }// quit when < 0.
                break;
            }
        }

        if (i == NR_CMD) { 
            putstr("Unknown command \'");
            putstr(cmd);
            putstr("\'. Type \'help\' for valid commands.\n");
        }
    }
}

int ternimal_loop()
{
    fiball();
    //char init[5] = "init";
    //cmd_sleep(init);
    while (1)
    {
        sdb_mainloop();
    }
    return 0;
}