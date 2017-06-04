/*
 * scheduler.c
*/

#define PQ_CAPACITY 0
#include "pq.h"

#define _t(i) (th->data[(i)])

void thswap(struct event *e1, struct event *e2){
  int temp;
  temp = e1->time;
  e1->time = e2->time;
  e2->time = temp;
  temp = e1->tid;
  e1->tid = e2->tid;
  e2->tid = temp;
}

void thbubbleup(timeheap *th, int i){
  if(!i){
    int p = (i - 1) / 2;
    if( _t(i).time < _t(p).time ){
      thswap(&_t(i), &_t(p));
      thbubbleup(th, p);
    }
  }
}

void thbubbledown(timeheap *th, int i){
  int l = 2*i + 1;
  int r = 2*i + 2;
  int min = i;
  if(l < th->size){
    if(_t(l).time < _t(min).time){
      min = l;
    }
  }
  if(r < th->size){
    if(_t(r).time < _t(min).time){
      min = r;
    }
  }
  if(!(min == i)){
    thswap(&_t(i), &_t(min));
    thbubbledown(th, min);
  }
}

struct event* thgetmax(timeheap* th){
  if(th->size){
    return th->data;
  } else{
    return (void *)0;
  }
}

void thpop(timeheap* th){
  if(th->size <= 1){
    th->size = 0;
  } else{
    thswap(&_t(0), &_t(th->size -1));
    th->size--;
    thbubbledown(th, 0);
  }
}

void thinsert(timeheap* th, int time, int tid){
  _t(th->size).time = time;
  _t(th->size).tid = tid;
  th->size += 1;
  thbubbleup(th, th->size - 1);
}
