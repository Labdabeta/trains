#ifndef TASK_H
#define TASK_H

struct TaskFrame {
	int r4; int r5; int r6; int r7;
	int r8; int r9; int r10; int r11;
	int fp; int lr; int pc;
};


typedef struct TaskDescriptor {
	int tid;
	int priority;
	int cpsr;
	struct TaskData *data;
	struct TaskDescriptor *next;
	struct TaskDescriptor *parent;
} *TD_ptr;

/** Loads a task into memory for execution.
 *
 * This function loads a task's stack into memory, saving its location and
 * registers.
 *
 * \param[in,out] td           The task descriptor of the task to load.
 * \param[in] entry            The entry point of the task.
 */
void load_task(struct TaskDescriptor *td, void (*entry)());

/** Re-enters a task.
 *
 * This transfers execution from the current task to the specified task, saving
 * state and switching modes as necessary.
 *
 * \param[in] td               The task to transfer control to.
 */
void enter(struct TaskDescriptor *td);

#endif /* TASK_H */
