#include "kernel.h"
#include "linker.h"
#include "debugio.h"
#include "interface.h"
#include "syscall.h"
#include "tasks/tasks.h"

//extern void asm_SetupTrap(struct KernelData *kernel_sp);
extern void asm_SetupTrap(void *one, void *two);

int newTID(struct KernelData *data, int size)
{
	int i;
	switch (size) {
		case 0: i = GIANT_TASK_INITIAL_IDX; break;
		case 1: i = BIG_TASK_INITIAL_IDX; break;
		case 2: i = NORMAL_TASK_INITIAL_IDX; break;
		case 3: i = SMALL_TASK_INITIAL_IDX; break;
		case 4: i = TINY_TASK_INITIAL_IDX; break;
		default: return -1;
	}

	for (; i < NUM_SUPPORTED_TASKS; ++i)
		if (data->tasks[i].priority < 0)
			return i;

	return -1;
}

struct Scheduler *global_sheduler;
struct TaskDescriptor *global_dispatcher;

void EnterHWI(void) __attribute__((interrupt("IRQ")));
void EnterHWI(void)
{
	volatile int *tclr = (int *) ( TIMER_BASE + TIMER_CLR_OFFSET );
	*tclr = 0;
	unblockTask(global_sheduler, global_dispatcher);
}

int main(int argc, char *argv[])
{
	struct KernelData data;
	struct TaskDescriptor *active;

	init_debugio();
    DEBUG_DUMP_ADR(&CODE_BASE);
    DEBUG_DUMP_ADR(main);
	initScheduler(&data.scheduler);
	global_sheduler = &data.scheduler;

	setupTaskArray(data.tasks);
	data.tasks[0].stack = &data;
	data.tasks[0].priority = 0; /* Don't ever schedule us, but don't delete us either. */

	/* Load first task. */
	data.tasks[1].priority = 0;
	data.tasks[1].state = STATE_ACTIVE;
	activateTask(&data.tasks[1], fn_ptr(main_task));
	scheduleTask(&data.scheduler, &data.tasks[1]);

	global_dispatcher = &data.tasks[18];
	asm_SetupTrap(&data.fn, fn_ptr(EnterHWI));
	//setupTimer();

	while ((active = reschedule(&data.scheduler))) {
		enterTask(active);

		active->rval = handleSyscall(&data, active);
	}

	return 0;
}
