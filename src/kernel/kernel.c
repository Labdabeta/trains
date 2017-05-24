#include "task.h"
#include "scheduler.h"
#include "linker.h"
#include "debugio.h"
#include "interface.h"

#define ever ;;

/* NOTE: This is *BIG* */
struct KernelData {
	/* Syscall info */
	int argv[5];
	int fn;

	/* Task objects and counts */
	struct TaskDescriptor tasks[NUM_SUPPORTED_TASKS];
	int num_giant;
	int num_big;
	int num_normal;
	int num_small;
	int num_tiny;

	/* Scheduler */
	struct RunQueue scheduler;
};

extern void asm_SetupTrap(struct KernelData *kernel_sp);

void fn(void) {
	debugio_putstr("What?\n");
	callSystemInterrupt(0,0,0,0,0,0);
}

int main(int argc, char *argv[])
{
	struct KernelData data;

	init_debugio();

	setupTaskArray(data.tasks);
	data.tasks[0].stack = data.tasks;

	debugio_putstr("Hello\n");

	asm_SetupTrap(&data);

	loadTask(&data.tasks[2], fn + (int)(&CODE_BASE));

	enter(&data.tasks[2]);

	debugio_putstr("Goodbye\n");

	return 0;
}
