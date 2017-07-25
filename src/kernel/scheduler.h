#ifndef SCHEDULER_H
#define SCHEDULER_H

#include "task.h"
#include "debugio.h"

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

static inline void dump_scheduler(struct Scheduler *state)
{
    int i;
    int visited[NUM_SUPPORTED_TASKS];

    for (i = 0; i < NUM_SUPPORTED_TASKS; ++i)
        visited[i] = 0;
    dprintf("Scheduler:\n");
    for (i = 0; i < NUM_PRIORITIES; ++i) {
        struct TaskDescriptor *t = state->active->queues[i]->head;
        while (t) {
            if ((int)t == 1) {
                dprintf("Z->");
                break;
            } else {
                if (visited[t->tid]) {
                    dprintf("DUPLICATE %d!", t->tid);
                    break;
                }
                dprintf("%d->", t->tid);
                visited[t->tid] = 1;
            }
            t = t->next;
        }
        dprintf("|\n");
    }
}

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
    //dprintf("Scheduling %d onto %d\n", task->tid,
            //((int)state->active->queues[task->priority]->head > 1 ? state->active->queues[task->priority]->head->tid : state->active->queues[task->priority]->head));
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
    struct TaskDescriptor *ret;
    struct RunQueue *initial = state->active;
    for (ever) {
        while (!state->active->head) {
            state->active = state->active->queues[1];
            if (state->active == initial)
                return 0; /* No tasks found. */
        }
        //dump_scheduler(state);
        ret = state->active->head;
        state->active->head = state->active->head->next;

        /* Check if we need to block the task. */
        if (ret->state) {
            ret->next = (void*)1;
        } else {
            //dprintf("returning: %d\n", ret->tid);
            scheduleTask(state,ret);
            return ret;
        }
    }
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
	task->state = STATE_ACTIVE;
}

/** Unschedule the given task
 *
 * This will completely remove the task from the scheduler, immediately.
 *
 * \param[in,out] state        The state of the scheduler.
 * \param[in] task             The task to unblock.
 */
static inline void unscheduleTask(struct Scheduler *state, struct TaskDescriptor *task)
{
    int i;
    for (i = 0; i < NUM_PRIORITIES; ++i) {
        struct TaskDescriptor *prev;
        struct TaskDescriptor *current;

        prev = 0;
        current = state->queues[i].head;

        while (current && current != task) {
            prev = current;
            current = current->next;
        }

        if (current == task) {
            if (prev) {
                if ((int)current->next > 1)
                    prev->next = current->next->next;
                else
                    prev->next = 0;
            } else {
                if ((int)current->next > 1)
                    state->queues[i].head = current->next;
                else
                    state->queues[i].head = 0;
            }
            return;
        }
    }
}

#endif /* SCHEDULER_H */
