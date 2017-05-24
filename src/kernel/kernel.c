#include "kernel.h"
#include "linker.h"
#include "debugio.h"
#include "interface.h"
#include "syscall.h"
#include "tasks/tasks.h"

#define ever ;;

//extern void asm_SetupTrap(struct KernelData *kernel_sp);
extern void asm_SetupTrap(SyscallCode *kernel_sp);

int newTID(struct KernelData *data, int size)
{
	switch (size) {
		case 0: return data->num_tasks[0] + GIANT_TASK_INITIAL_IDX;
		case 1: return data->num_tasks[1] + BIG_TASK_INITIAL_IDX;
		case 2: return data->num_tasks[2] + NORMAL_TASK_INITIAL_IDX;
		case 3: return data->num_tasks[3] + SMALL_TASK_INITIAL_IDX;
		case 4: return data->num_tasks[4] + TINY_TASK_INITIAL_IDX;
	}
	return -1;
}

int main(int argc, char *argv[])
{
	struct KernelData data;
	struct TaskDescriptor *active;

	init_debugio();
    initScheduler(&data.scheduler);

	setupTaskArray(data.tasks);
	data.tasks[0].stack = &data;

	asm_SetupTrap(&data.fn);

	/* Load first task. */
	data.tasks[1].priority = 0; /* real-time priority */

	activateTask(&data.tasks[1], fn_ptr(main_task));
	scheduleTask(&data.scheduler, &data.tasks[1]);

    while ((active = reschedule(&data.scheduler))) {
		enterTask(active);

		active->rval = handleSyscall(&data, active);
	}

	return 0;
}
