#include "klib.h"

#if !defined(__ISA_NATIVE__) || defined(__NATIVE_USE_KLIB__)
static unsigned long int next = 1;

int rand(void) {
  // RAND_MAX assumed to be 32767
  next = next * 1103515245 + 12345;
  return (unsigned int)(next/65536) % 32768;
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

int itoa(int n, char c[32], int radix) {
  for (int i = 0; i < 32; i++) { c[i] = '\0'; }
  //char arr[32], *tmp = arr;
  static const char digit[] = "0123456789abcdef";
  static const char int_min[] = "-2147483648";
  char *ptr = c;
  if (n == -2147483648) {
    for (int i = 0; i < 11; i++) {
      c[i] = int_min[i];
    }
    return 11; 
  }
  bool sign =  (n >= 0);
  
  if (!sign) { *ptr++ = '-'; n = -n; }// negative
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


#endif
