#ifndef KERNEL_H
#define KERNEL_H

#include "task.h"
#include "scheduler.h"
#include "handlers.h"
#include "setup.h"

/* NOTE: This is *BIG* */
struct KernelData {
	/* Syscall info */
	int argv[3];
	SyscallCode fn;

	/* Task objects and counts */
	struct TaskDescriptor tasks[NUM_SUPPORTED_TASKS];

	/* Scheduler */
	struct RunQueue scheduler;
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

#endif /* KERNEL_H */
