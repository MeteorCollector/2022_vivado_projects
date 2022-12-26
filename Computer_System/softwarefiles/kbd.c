#include "sys.h"

static char* queue_front = (char*) KBD_START;

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
        ptrmov();
    }
    return 0;
}