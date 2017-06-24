#include "task.h"
#include "debugio.h"
#include "syscall.h"
#include "linker.h"

#define WORD_SIZE 4

void setupTaskArray(struct TaskDescriptor *ta)
{
	int i;
    int task_base_address = 0x2000000;

	for (i = 0; i < NUM_SUPPORTED_TASKS; ++i) {
		ta[i].tid = i;
		ta[i].priority = -1;
		ta[i].cpsr = -1;
		ta[i].stack = (void*)(task_base_address);
		ta[i].next = 0;
		ta[i].parent = 0;
		ta[i].rval = 0;
		ta[i].data = 0; /* computed later. */
		ta[i].state = STATE_ZOMBIE;
		ta[i].recvQueueHead = 0;
		ta[i].recvQueueTail = 0;
		ta[i].nextRecv = 0;
		ta[i].buf[0] = 0;
		ta[i].buf[1] = 0;
		ta[i].ticks = 0;

        if (i < BIG_TASK_INITIAL_IDX)
            task_base_address -= GIANT_TASK_SIZE_BYTES;
        else if (i < NORMAL_TASK_INITIAL_IDX)
            task_base_address -= BIG_TASK_SIZE_BYTES;
        else if (i < SMALL_TASK_INITIAL_IDX)
            task_base_address -= NORMAL_TASK_SIZE_BYTES;
        else if (i < TINY_TASK_INITIAL_IDX)
            task_base_address -= SMALL_TASK_SIZE_BYTES;
        else
            task_base_address -= TINY_TASK_SIZE_BYTES;
	}
}

void activateTask(struct TaskDescriptor *td, void (*entry)())
{
	td->cpsr = 0x50; /* mode set */
	td->data = (struct TaskFrame*)((int)td->stack - sizeof(struct TaskFrame) + WORD_SIZE);

	td->data->lr = (int)fn_ptr(Exit);
	td->data->pc = (int)entry;
}

/*
extern int asm_EnterTask(struct TaskFrame *sp, int cpsr, int rval);

void enterTask(struct TaskDescriptor *td) {
	td->data = (struct TaskFrame*)asm_EnterTask((struct TaskFrame*)td->data, td->cpsr, td->rval);
	asm ("mov %0, r1" : "=r"(td->cpsr));
} */
