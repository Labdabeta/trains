#ifndef KERNEL_H
#define KERNEL_H

#include "task.h"
#include "scheduler.h"

/* NOTE: This is *BIG* */
struct KernelData {
	/* Syscall info */
	int argv[5];
	int fn;

	/* Task objects and counts */
	struct TaskDescriptor tasks[NUM_SUPPORTED_TASKS];
	int num_tasks[5];

	/* Scheduler */
	struct RunQueue scheduler;
};

int newTID(struct KernelData *data, int size);

#endif /* KERNEL_H */
