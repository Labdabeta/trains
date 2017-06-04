#ifndef SCHEDULER_H
#define SCHEDULER_H

#include "task.h"

#define NUM_PRIORITIES 8

struct RunQueue {
	/* The head of the stack. */
	struct TaskDescriptor *head;

	/* Quick-access pointers to each of the queues relative to this one. */
	struct RunQueue *queues[NUM_PRIORITIES];
};

struct Scheduler {
	struct RunQueue queues[NUM_PRIORITIES];
	struct RunQueue *active; /* Points to one of the queues entries. */
};

/** Initializes the state of the scheduler.
 *
 * \param[out] state           The state to initialize.
 */
void initScheduler(struct Scheduler *state);

/** Adds the given task to the scheduler state.
 *
 * \param[in,out] state        The state of the scheduler.
 * \param[in] task             The task to schedule. Its priority must already
 *                             be set.
 */
static inline void scheduleTask(struct Scheduler *state, struct TaskDescriptor *task)
{
	task->next = state->active->queues[task->priority]->head;
	state->active->queues[task->priority]->head = task;
}

/** Reschedules tasks, advancing the queue.
 *
 * This will move the top of the active queue to the appropriate exhausted
 * queue, then return it.
 *
 * Returns NULL if no tasks are left to be scheduled.
 *
 * \param[in,out] state        The state of the scheduler.
 *
 * \return The next task in line, which should be given a chance to execute.
 */
static inline struct TaskDescriptor *reschedule(struct Scheduler *state)
{
	struct RunQueue *initial = state->active;
	while (!state->active->head) {
		state->active = state->active->queues[1];
		if (state->active == initial)
			return 0; /* No tasks found. */
	}

	struct TaskDescriptor *ret = state->active->head;
	state->active->head = state->active->head->next;

	/* Check if we need to block the task. */
	if (ret->state) {
		ret->next = (void*)1;
		return reschedule(state);
	}

	scheduleTask(state, ret);
	return ret;
}

/** Unblock the given task
 *
 * This will reschedule the given blocked task if necessary.
 *
 * \param[in,out] state        The state of the scheduler.
 * \param[in] task             The task to unblock.
 */
static inline void unblockTask(struct Scheduler *state, struct TaskDescriptor *task)
{
	if (task->next == (void*)1)
		scheduleTask(state,task);
}


#endif /* SCHEDULER_H */
