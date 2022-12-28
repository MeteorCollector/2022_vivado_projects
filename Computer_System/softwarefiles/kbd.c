#include "sys.h"

static char* queue_front = (char*) KBD_START;

int wait_line(char* buf)
{
    int len = 0;
    while (1)
    {
        show_cursor();
        char ch = wait_keyboard();
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
    char *ptr = (char*) KBD_START;
    while (ptr <= (char*) KBD_END) { 
        if (*ptr != 0) 
        {
            ret = *ptr;
            *ptr = 0;
            return *ptr; 
        }
        ptr++;
    }
    return 0;
}