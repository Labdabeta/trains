#include "scheduler.h"
#include "task.h"

void initScheduler(struct RunQueue *state)
{
	int i;
	for (i = 0; i < NUM_PRIORITIES; ++i)
		state->exhausted[i] = 0;
	state->active = 0;
}

void scheduleTask(struct RunQueue *state, struct TaskDescriptor *task)
{
	task->next = state->active;
	state->active = task;
}

struct TaskDescriptor *reschedule(struct RunQueue *state)
{
	// TODO: if active task returned is dead, don't reschedule it
	int iterations = 32; /* How many iterations of queue updating can we still do? */

	while (iterations --> 0) {
		struct TaskDescriptor *ret = state->active;
		if (ret) {
			state->active = ret->next;

			ret->next = state->exhausted[ret->priority];
			state->exhausted[ret->priority] = ret;

			if (ret->priority < 0) return reschedule(state);
			return ret;
		} else {
			/* Need a new active array. */
			int i;
			state->active = state->exhausted[0];
			for (i = 0; i < NUM_PRIORITIES - 1; ++i)
				state->exhausted[i] = state->exhausted[i+1];
			state->exhausted[NUM_PRIORITIES - 1] = 0;
		}
	}

	/* No task found. */
	return 0;
}

