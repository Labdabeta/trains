#include "string.h"

// Implementations from clc-wiki.net/wiki/C_standard_library

void *memcpy(void *dst, const void *src, size_t len)
{
    char *dst_ptr = dst;
    const char *src_ptr = src;
    while (len--)
        *dst_ptr++ = *src_ptr++;
    return dst;
}

void *memset(void *s, int c, size_t n)
{
    unsigned char *p = s;
    while (n--)
        *p++ = (unsigned char)c;
    return s;
}

char *strcpy(char *dest, const char *src)
{
    char *ret = dest;
    while ((*dest++ = *src++));
    return ret;
}

char *strcat(char *dest, const char *src)
{
    char *ret = dest;
    while (*dest) dest++;
    while ((*dest++ = *src++));
    return ret;
}

char *strpsh(char *str, char c)
{
    char *ret = str;
    while (*str) str++;
    *str++ = c;
    *str++ = 0;
    return ret;
}

int strcmp(const char *a, const char *b)
{
    while (*a && (*a == *b)) a++, b++;
    return *(const unsigned char*)a - *(const unsigned char*)b;
}
