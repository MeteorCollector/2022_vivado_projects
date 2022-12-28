#include "sys.h"

size_t strlen(const char *s) {
  //assert(s != NULL);
  int ret = 0;
  while (*s != '\0') { s++; ret++; }
  return ret;
}

char *strcpy(char *dst, const char *src) {////
  //assert(dst != NULL && src != NULL);// assertion
  char *ret = dst;
  while (*src != '\0')
  {
    *dst = *src; dst++; src++;
  }
  *dst = '\0';
  return ret;
}

char *strncpy(char *dst, const char *src, size_t n) {
  //assert(dst != NULL && src != NULL);// assertion
  char *ret = dst;
  while (n--)
  {
    *dst = *src; dst++; src++;
  }
  *dst = '\0';
  return ret;
}

char *strcat(char *dst, const char *src) {////
  //assert(dst != NULL && src != NULL);// assertion
  char *ret = dst;
  while (*dst != '\0') { dst++; }
  while (*src != '\0')
  {
    *dst = *src; dst++; src++;
  }
  *dst = '\0';
  return ret;
}

int strcmp(const char *s1, const char *s2) {////
  //assert(s1 != NULL && s2 != NULL);// assertion
  while (*s1 == *s2)
  {
    if (*s1 == '\0') { return 0; }
    s1++; s2++;
  }
  return *s1 > *s2 ? 1 : -1;
}

int strncmp(const char *s1, const char *s2, size_t n) {
  //assert(s1 != NULL && s2 != NULL);// assertion
  while (n--)
  {
    if (*s1 != *s2) { return *s1 > *s2 ? 1 : -1; }
    s1++; s2++;
  }
  return 0;
}

void *memset(void *s, int c, size_t n) {////
  char *ptr = (char *) s;
  if (ptr)
  {
    while (n) { *ptr = (char)c; ptr++; n--; }
  }
  return s;
}

void *memmove(void *dst, const void *src, size_t n) {
  char *dest = (char *)dst;
  const char* source = (const char *)src;
  //assert(dest != NULL && source != NULL);
  if (dest < source)
  {
    while (n--) {
      *dest = *source;
      dest++; source++;
    }
  }
  else {
    while (n--) {
      *(dest + n) = *(source + n);
    }
  }
  return dst;
}

void *memcpy(void *out, const void *in, size_t n) {
  char *dst = (char *)out;
  char *src = (char *)in;
  if ((dst) && (src))
  {
    while (n) { *(dst++) = *(src++); n--; }
  }
  //*p1 = '\0';
  return out;
}

int memcmp(const void *s1, const void *s2, size_t n) {////
  //assert(s1 != NULL && s2 != NULL);
  char *p1 = (char*) s1;
  char *p2 = (char*) s2;
  while (n--)
  {
    if (*p1 != *p2) { return *p1 > *p2 ? 1 : -1; }
    p1++; p2++;
  }
  return 0;
}