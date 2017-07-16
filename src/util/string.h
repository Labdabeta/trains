#ifndef STRING_H
#define STRING_H

#include "stdlib.h"

void *memcpy(void *dst, const void *src, size_t len);
void *memset(void *s, int c, size_t n);
char *strcpy(char *dest, const char *src);
char *strcat(char *dest, const char *src);
char *strpsh(char *str, char c); // adds c to str
int strcmp(const char *a, const char *b);

#endif /* STRING_H */
