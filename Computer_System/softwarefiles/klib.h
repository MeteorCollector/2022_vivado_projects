#ifndef KLIB_H__
#define KLIB_H__
//#ifndef __NATIVE_USE_KLIB__
//#define __NATIVE_USE_KLIB__
//#endif

#include "sys.h"

//#define __NATIVE_USE_KLIB__

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
int    itoa      (int n, char c[32], int radix);



#endif
