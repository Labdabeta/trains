#include "task.h"

void load_task(struct TaskDescriptor *td, void (*entry)())
{
	struct TaskFrame *frame = 0; /* TODO: assign a frame pointer */

	td->data = frame + 1; /* Set the stack pointer (here 1 is sizeof(*frame)) */
	td->cpsr = 16; /* mode set */

	frame->fp = (int)&frame;
	frame->lr = 0; /* TODO: assign exit syscall address */
	frame->pc = (int)entry;
}

extern void asm_EnterTask(struct TaskFrame *sp, int cpsr);

void enter(struct TaskDescriptor *td) {
	asm_EnterTask(td->data, td->cpsr);
}
