/*
* cbuff.h
*/

#define CBUFF_SIZE 0

#include <cbuff.h>

#define add1(ind) ((ind) = ((ind) + 1) % buff->capacity)
#define c_ buff->contents
#define b_ buff->begin
#define e_ buff->end

int cbsize(cbuff *buff){
  int result = e_ - b_;
  if(result < 0){
    result += buff->capacity;
  }
  return result;
}

void cbwrite(cbuff *buff, char c){
  c_ [ e_ ] = c;
  add1( e_ );
  if( e_ == b_ ){
    add1( b_ );
  }
}

int cbpeak(cbuff *buff, char *c){
  if( b_ == e_ ){ //Buffer is empty
    return -1;
  }
  *c = c_ [ b_ ];
  return 0;
}

void cbpop(cbuff *buff){
  if( b_ == e_ ){
    //assert(0);
  }
  add1( b_ );
}

int cbread(cbuff *buff, char *c){
  if( b_ == e_ ){
    return -1;
  }
  *c = c_ [ b_ ];
  add1( b_ );
  return 0;
}

void flushcb(cbuff *b1, cbuff *b2){
  if(!b2){ //Write to /dev/null
    b1->begin = b1->end;
    return;
  }
  char c;
  while(!cbread(b1, &c)){
    cbwrite(b2, c);
  }
}
