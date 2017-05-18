#ifndef TASK_H
#define TASK_H

#define magic 0x00218000

typedef unsigned int uint;

typedef struct TaskDescriptor {
  int tid;
  int parent;
  int priority;
  uint CPSR;
  uint* sp;
} TD;

void activate(TD *td, void (*entry) ());
void enter(TD *td);

extern uint* asm_enter(uint *sp, uint CPSR);

//void trap(int code);

/* static void exit(void) */

#endif
