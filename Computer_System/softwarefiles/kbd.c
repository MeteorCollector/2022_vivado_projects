#include "sys.h"

static char* queue_front = (char*) KBD_START;

int wait_line(char* buf)
{
    char* vga_start = (char*) VGA_START;
    int len = 0;
    while (1)
    {
        char ch = get_keyboard();
        if (ch)
        {
            if (ch == 10 || ch == 13 || ch == 8)
            {
                vga_start[(vga_line << 7) + vga_ch] = 0;
            }
            putch(ch);
            if (ch == 10 || ch == 13) { 
                buf[len] = 0;
                len++;
                return len; 
            }
            else if (ch == 8)// backspace
            {
                if (len > 0) { buf[len] = 0; len--; }
            }
            else { buf[len] = ch; len++; }
        }
        else { show_cursor(); }
    }
    buf[len] = 0;
    len++;
    return len; 
}

void ptrmov()
{
    queue_front = (queue_front == (char*) KBD_END) ? (char*) KBD_START : queue_front + 1; 
}

char wait_keyboard()
{
    char ret;
    while (*queue_front == 0) { ptrmov(); }
    ret = *queue_front;
    *queue_front = 0;
    return ret;
}

char get_keyboard()
{
    char ret;
    int i = 0;
    int searchlimit = (KBD_END - KBD_START) << 1;
    while (*queue_front == 0 && i < searchlimit) { ptrmov(); i++; }
    ret = *queue_front;
    *queue_front = 0;
    return ret;
}