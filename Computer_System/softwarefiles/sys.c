#include "sys.h"

char* vga_start = (char*) VGA_START;


int charcnt[VGA_MAXLINE];

static int flip_interval = 300;
static int tick_last = 0;

void show_cursor()
{
   int tick_current = *(int*)TIMER_START;
   if (tick_current <= tick_last) return;
   int rem = tick_current % 2;
   if (rem == 0) { vga_start[(vga_line << 7) + vga_line] = '_'; }
   else if (rem == (flip_interval >> 1)) { vga_start[(vga_line << 7) + vga_line] = backup_screen[vga_line][vga_ch]; }
}

void vga_init() {
    vga_line = 0;
    vga_ch = 0;
    for(int i = 0; i < VGA_MAXLINE; i++)
    {
        charcnt[i] = 0;
        for(int j = 0; j < VGA_MAXCOL; j++)
        {
          vga_start[(i << 7) + j] = 0;
          backup_screen[i][j] = 0;
        }
    }
}

void refresh_screen() {
  vga_line = 0;
  vga_ch = 0;
  for (int i = 0; i < VGA_MAXLINE; i++)
    for (int j = 0; j < VGA_MAXCOL; j++)
      bufputch(backup_screen[i][j]);
}

void roll_up() {
    for (int i = 0; i < VGA_MAXLINE - 1; i++)
    {
        charcnt[i] = charcnt[i + 1];
        for (int j = 0; j < VGA_MAXCOL; j++)
          backup_screen[i][j] = backup_screen[i + 1][j];
    }
    for (int j = 0; j < VGA_MAXCOL; j++)
    {
      backup_screen[VGA_MAXLINE - 1][j] = 0;
    }
    refresh_screen();
    vga_line = VGA_MAXLINE - 1;
    vga_ch = 0;
}

void new_line() {
    if (vga_line >= VGA_MAXLINE - 1)
    {
        charcnt[vga_line] = vga_ch - 1;
        roll_up();
        vga_line = VGA_MAXLINE - 1;
        vga_ch = 0;
    }
    else
    {
        charcnt[vga_line] = vga_ch - 1;
        vga_line++;
        vga_ch = 0;
    }
    return;
}

void putch(char ch) {
  if(ch==8) //backspace
  {
      if (vga_ch == 0)
      {
        if (vga_line > 0)
        {
            vga_line--;
            vga_ch = charcnt[vga_line];
            vga_start[(vga_line << 7) + vga_ch] = 0;
            backup_screen[vga_line][vga_ch] = 0;
        }
      }
      else
      {
        vga_ch--;
        vga_start[(vga_line << 7) + vga_ch] = 0;
        backup_screen[vga_line][vga_ch] = 0;
      }
      return;
  }
  if(ch == 10 || ch == 13) //enter
  {
      new_line();
      return;
  }
  else
  {
    vga_start[(vga_line << 7) + vga_ch] = ch;
    backup_screen[vga_line][vga_ch] = ch;
    vga_ch++;
    if(vga_ch >= VGA_MAXCOL) { new_line(); }
  }
  return;
}

void bufputch(char ch)
{
    vga_start[(vga_line << 7) + vga_ch] = ch;
    backup_screen[vga_line][vga_ch] = ch;
    vga_ch++;
    if(vga_ch >= VGA_MAXCOL) { 
      vga_ch--; 
      vga_line = (vga_line >= VGA_MAXLINE - 1) ? VGA_MAXLINE - 1 : vga_line + 1;
      vga_ch = 0;
    }
    return;
}

void putstr(char *str){
    for(char* p=str; *p!=0; p++)
      putch(*p);
}