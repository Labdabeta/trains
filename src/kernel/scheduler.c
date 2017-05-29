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

