#ifndef TASK_H
#define TASK_H

typedef struct Context {
  void *sp;
} C;

typedef struct TaskDescriptor {
  int tid;
  int parent;
  int priority;

  struct Context *data;
} TD;
void activate(TD *td);
inline void enter(TD *td);

void trap(int code);

/* static void exit(void) */

#endif
