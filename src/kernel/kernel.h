#ifndef KERNEL_H
#define KERNEL_H

#include "task.h"
#include "scheduler.h"
#include "handlers.h"
#include "setup.h"
#include "syscall.h"

/* NOTE: This is *BIG* */
struct KernelData {
	/* Syscall info */
	int argv[3];
	SyscallCode fn;

	/* Task objects and counts */
	struct TaskDescriptor tasks[NUM_SUPPORTED_TASKS];

	/* Scheduler */
	struct Scheduler scheduler;

	/* Timers */
    unsigned long long int inittime, lasttick, kerntime, usertime, handtime, tmp;

	/* Are we dead yet? */
	int alive;
};

/** Returns a new unused task id.
 *
 * This function returns a new unused task id of the desired size.
 * If it cannot find one it will return -1.
 *
 * \param[in] data             The kernel stack pointer.
 * \param[in] size             The desired size.
 *
 * \return The new tid or -1 if none were found.
 */
int newTID(struct KernelData *data, int size);

/** Returns the t4 ticks.
 *
 * This returns the number of ticks elapsed on timer 4 since the kernel started.
 *
 * \return The number of ticks on t4, might loop!
 */
static inline unsigned long long int t4t(void)
{
    return (*(unsigned long long int*)0x80810060) & 0xFFFFFFFFFFUL;
}

#endif /* KERNEL_H */
