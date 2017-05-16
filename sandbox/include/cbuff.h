/*
 * cbuff.h
*/

#ifndef _CBUFF
#define _CBUFF

#define CBUFF_SIZE 1024

struct cbuff {
  char contents[CBUFF_SIZE];
  int begin;
  int end;
};

typedef struct cbuff cbuff;

void cbinit(cbuff *buff);
int cbsize(cbuff *buff);
void cbwrite(cbuff *buff, char c);
int cbpeak(cbuff *buff, char *c);
void cbpop(cbuff *buff);
int cbread(cbuff *buff, char *c);
void flushcb(cbuff *b1, cbuff *b2);
void cbaoti(cbuff *buff, int *index);
void cbputdig(cbuff* buff, int n, unsigned int val);
void bwout(cbuff* buff);
void cbputr(cbuff* buff, unsigned int reg);
void cbputstr(cbuff* buff, char *str);
void cbputw(cbuff* buff, int n, char fc, char *bf );
void cbprintf(cbuff* buff, char *fmt, ... );

#endif
