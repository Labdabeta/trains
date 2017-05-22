#include "task.h"

void load_task(struct TaskDescriptor *td, void (*entry)())
{
	struct TaskFrame *frame = 0; /* TODO: assign a frame pointer */

	td->sp = frame + sizeof(*frame); /* Set the stack pointer */
	td->cpsr = 16; /* mode set */

	frame->fp = &frame;
	frame->lr = 0; /* TODO: assign exit syscall address */
	frame->pc = entry;
}

extern inline void asm_enter(int *sp, int cpsr);

void enter(struct TaskDescriptor *td) {
	asm_enter(td->sp, td->CPSR);
}
