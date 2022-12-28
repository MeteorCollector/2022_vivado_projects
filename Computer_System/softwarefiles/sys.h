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
static void refresh_screen(void);

void vga_init(void);
int ternimal_loop(void);

char wait_keyboard(void);
char get_keyboard(void);
int wait_line(char* buf);

static char backup_screen[VGA_MAXLINE][VGA_MAXCOL] = { 0 }; // avoid reading from vga ram.
static int vga_line = 0;
static int vga_ch = 0;

typedef enum
{
  false = 0,
  true = 1
}
bool;

// string.h
void  *memset    (void *s, int c, size_t n);
void  *memcpy    (void *dst, const void *src, size_t n);
void  *memmove   (void *dst, const void *src, size_t n);
int    memcmp    (const void *s1, const void *s2, size_t n);
size_t strlen    (const char *s);
char  *strcat    (char *dst, const char *src);
char  *strcpy    (char *dst, const char *src);
char  *strncpy   (char *dst, const char *src, size_t n);
int    strcmp    (const char *s1, const char *s2);
int    strncmp   (const char *s1, const char *s2, size_t n);

// stdlib.h
void   srand     (unsigned int seed);
int    rand      (void);
//void  *malloc    (size_t size);
//void   free      (void *ptr);
int    abs       (int x);
int    atoi      (const char *nptr);
int    itoa      (uint32_t n, char c[32], uint32_t radix);

#endif