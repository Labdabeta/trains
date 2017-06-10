/*
 * cbuff.h
*/

#ifndef _CBUFF
#define _CBUFF

typedef struct cbuff {
  int begin;
  int end;
  int capacity;
  char contents[CBUFF_SIZE];
} cbuff;

static inline void cbinit(cbuff* buff){
  buff->begin = buff->end = 0;
  buff->capacity = CBUFF_SIZE;
}

void cbinit(cbuff *buff);
int cbsize(cbuff *buff);
void cbwrite(cbuff *buff, char c);
int cbpeak(cbuff *buff, char *c);
void cbpop(cbuff *buff);
int cbread(cbuff *buff, char *c);
void flushcb(cbuff *b1, cbuff *b2);

#endif
