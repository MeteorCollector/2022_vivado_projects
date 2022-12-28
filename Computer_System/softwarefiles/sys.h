#ifndef SYS_H
#define SYS_H

#define VGA_START    0x00200000
#define VGA_LINE_O   0x00210000
#define VGA_MAXLINE  30
#define LINE_MASK    0x003f
#define VGA_MAXCOL   70
#define KBD_START    0x00300000
#define KBD_END      0x00300100
#define TIMER_START  0X00400000

typedef unsigned int uint32_t;
typedef uint32_t word_t;
typedef uint32_t size_t;

void putstr(char* str);
void putch(char ch);
void bufputch(char ch);
void show_cursor(void);
void roll_up(void);
void refresh_screen(void);

void vga_init(void);

char wait_keyboard(void);
char get_keyboard(void);
int wait_line(char* buf);

static char backup_screen[VGA_MAXLINE][VGA_MAXCOL]; // avoid reading from vga ram.
static int vga_line = 0;
static int vga_ch = 0;

typedef enum
{
  false = 0,
  true = 1
}
bool;

//typedef unsigned int uint32_t;
#endif