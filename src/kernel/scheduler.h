#ifndef SCHEDULER_H
#define SCHEDULER_H

#define NUM_PRIORITIES 32

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
struct TaskDescriptor *reschedule(struct RunQueue *state);

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
void blockTask(struct RunQueue *state, struct TaskDescriptor *task);

/** Unblock the given task
 *
 * This will reschedule the given blocked task.
 *
 * \param[in,out] state        The state of the scheduler.
 * \param[in] task             The task to unblock.
 */
void unblockTask(struct RunQueue *state, struct TaskDescriptor *task);

#endif /* SCHEDULER_H */
