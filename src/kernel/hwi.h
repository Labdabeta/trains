#ifndef HWI_H
#define HWI_H

#ifdef DEBUG_MODE
#define HWI_STACK_SIZE 100
#else
#define HWI_STACK_SIZE 20
#endif

#include "syscall.h"
#include "kernel.h"

void initEventBlocks(struct Scheduler *scheduler);
void addAwait(EventType type, struct TaskDescriptor *task);
void addTransmit(EventType type, struct TaskDescriptor *task, int data, int *addr);
void addReceive(EventType type, struct TaskDescriptor *task, int *addr);
void EnterHWI(void) __attribute__((interrupt("IRQ")));

#endif /* HWI_H */
