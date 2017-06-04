#include "scheduler.h"
#include "task.h"
#include "debugio.h"

void initScheduler(struct Scheduler *state)
{
	int i,ii;
	for (i = 0; i < NUM_PRIORITIES; ++i) {
		state->queues[i]->head = 0;
		for (ii = 0; ii < NUM_PRIORITIES; ++ii)
			state->queues[i]->queues[ii] = state->queues[(i+ii)%NUM_PRIORITIES];
	}
	state->active = state->queues[0];
}

