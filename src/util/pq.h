#ifndef PQ_H
#define PQ_H

struct event{
	int time;
  int tid;
};

typedef struct timeheap{
  int size;
	struct event data[PQ_CAPACITY];
} timeheap;

static inline void thinit(timeheap *th){
  th->size =0;
}

void thinit(timeheap* th);
struct event* thgetmax(timeheap* th);
void thpop(timeheap* th);
void thinsert(timeheap* th, int time, int tid);

#endif
