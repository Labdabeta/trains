#include "scheduler.h"
#include "task.h"
#include "debugio.h"

void initScheduler(struct RunQueue *state)
{
	int i;
	for (i = 0; i < NUM_PRIORITIES; ++i)
		state->exhausted[i] = 0;
}

void scheduleTask(struct RunQueue *state, struct TaskDescriptor *task)
{
	task->next = state->exhausted[task->priority];
	state->exhausted[task->priority] = task;
}

struct TaskDescriptor *reschedule(struct RunQueue *state)
{
	int iterations = NUM_PRIORITIES; /* How many iterations of queue updating can we still do? */

	while (iterations --> 0) {
		struct TaskDescriptor *ret = state->exhausted[0];
		if (ret) {
			state->exhausted[0] = ret->next;

			if (ret->priority < 0) {
				/* Don't reschedule. */
				return reschedule(state);
			}

			ret->next = state->exhausted[ret->priority];
			state->exhausted[ret->priority] = ret;

			return ret;
		} else {
			/* Need a new active array. */
			int i;
			for (i = 0; i < NUM_PRIORITIES - 1; ++i)
				state->exhausted[i] = state->exhausted[i+1];
			state->exhausted[NUM_PRIORITIES - 1] = 0;
		}
	}

	/* No task found. */
	return 0;
}

void blockTask(struct RunQueue *state, struct TaskDescriptor *task)
{
	task->priority = -task->priority;
}

void unblockTask(struct RunQueue *state, struct TaskDescriptor *task)
{
	if (task->priority < 0) {
		task->priority = -task->priority;

		/* Reschedule the task. */
		task->next = state->exhausted[task->priority];
		state->exhausted[task->priority] = task;
	}
}
