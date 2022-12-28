#include "sys.h"

static unsigned long int next = 1;

int rand(void) {
  // RAND_MAX assumed to be 32767
  next = next * 1103515245 + 12345;
  return (unsigned int)(next/(uint32_t)65536) % (uint32_t)32768;
}

void srand(unsigned int seed) {
  next = seed;
}

int abs(int x) {
  return (x < 0 ? -x : x);
}

int atoi(const char* nptr) {
  int x = 0;
  while (*nptr == ' ') { nptr ++; }
  while (*nptr >= '0' && *nptr <= '9') {
    x = x * 10 + *nptr - '0';
    nptr ++;
  }
  return x;
}

int itoa(uint32_t n, char c[32], uint32_t radix) {
  for (int i = 0; i < 32; i++) { c[i] = '\0'; }
  //char arr[32], *tmp = arr;
  static const char digit[] = "0123456789abcdef";
  char *ptr = c;
  
  if (n < radix) { *ptr++ = digit[n]; *ptr = '\0'; }
  else {
    char tmp[32];
    char *a = tmp;
    while (n) { *a++ = digit[n % radix]; n /= radix; }
    while (--a != tmp) { *ptr++ = *a; }
    *ptr++ = *a; *ptr = '\0';
  }

  return ptr - c;
}

