#ifndef SCHEDULER_H
#define SCHEDULER_H

#include "task.h"

#define NUM_PRIORITIES 8

/** Maintains the state of the scheduler.
 *
 * The scheduler will consistently pop a task off the active queue to run next.
 *
 * When a task completes it is placed on its priority of exhausted queue.
 * (exhausted[prio])
 *
 * When the active queue is empty, exhausted[0] becomes active, and all
 * exhausted queues shift down one level. Finally exhausted[NUM_PRIORITIES-1]
 * is set to the old active queue.
 *
 * Note: the queues are actually stacks.
 */
struct RunQueue {
	/* exhausted[0] is the active stack */
	struct TaskDescriptor *exhausted[NUM_PRIORITIES]; /* The exhausted queues */
};

/** Initializes the state of the scheduler.
 *
 * \param[out] state           The state to initialize.
 */
void initScheduler(struct RunQueue *state);

/** Adds the given task to the scheduler state.
 *
 * Initially the task is placed on the start of the active queue, but later it
 * will be scheduled based on its internal priority value.
 *
 * \param[in,out] state        The state of the scheduler.
 * \param[in] task             The task to schedule. Its priority must already
 *                             be set.
 */
void scheduleTask(struct RunQueue *state, struct TaskDescriptor *task);

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
static inline struct TaskDescriptor *reschedule(struct RunQueue *state)
{
	int iterations = NUM_PRIORITIES; /* How many iterations of queue updating can we still do? */
    struct TaskDescriptor *ret;

	while (iterations --> 0) {
		ret = state->exhausted[0];
		if (ret) {
			state->exhausted[0] = ret->next;
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
/** Block a task
 *
 * This will add a task to the blocked list. It will only unblock when
 * explicitly told to do so.
 *
 * How blocking works: A blocked task is given negative priority. When scheduled
 * it will be removed from any of the priority queues, making it unschedulable.
 * Once unblocked the priority becomes positive again and it will be added to
 * the appropriate stack.
 *
 * \param[in] state            The state of the scheduler.
 * \param[in] task             The task to block.
 */
static inline void blockTask(struct RunQueue *state, struct TaskDescriptor *task)
{
    if (task->priority >= 0) {
        task->priority = (-task->priority) - 1;
    }
}


/** Unblock the given task
 *
 * This will reschedule the given blocked task.
 *
 * \param[in,out] state        The state of the scheduler.
 * \param[in] task             The task to unblock.
 */
static inline void unblockTask(struct RunQueue *state, struct TaskDescriptor *task)
{
	if (task->priority < 0) {
		task->priority = -(task->priority + 1);
		task->state = STATE_ACTIVE;

		/* Reschedule the task, unless its already scheduled. */
       if (!task->isin) {
           task->next = state->exhausted[task->priority];
           state->exhausted[task->priority] = task;
           task->isin = 1;
       }
	}
}


#endif /* SCHEDULER_H */
