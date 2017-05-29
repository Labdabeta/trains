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
    task->isin = 1;
}

struct TaskDescriptor *reschedule(struct RunQueue *state)
{
	int iterations = NUM_PRIORITIES; /* How many iterations of queue updating can we still do? */

	while (iterations --> 0) {
		struct TaskDescriptor *ret = state->exhausted[0];
		if (ret) {
			state->exhausted[0] = ret->next;
            DEBUG_PRINT("Next active tid: ");
            DEBUG_DUMP_VAL(ret->tid);
            DEBUG_DUMP_VAL(ret->priority);
            DEBUG_DUMP_ADR(ret);
            DEBUG_DUMP_ADR(ret->next);

			if (ret->priority < 0 || ret->priority == NUM_PRIORITIES) {
                ret->isin = 0;
				/* Don't reschedule that task, get a new one. */
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
    DEBUG_PRINT("Unblocking: ");
    DEBUG_DUMP_VAL(task->tid);
    DEBUG_DUMP_VAL(task->priority);
    DEBUG_DUMP_ADR(task);
    DEBUG_DUMP_ADR(task->next);
	if (task->priority < 0) {
        DEBUG_DUMP_ADR(state->exhausted[task->priority]);
		task->priority = -task->priority;

		/* Reschedule the task, unless its already scheduled. */
        if (!task->isin) {
            task->next = state->exhausted[task->priority];
            state->exhausted[task->priority] = task;
        }
	}
}
