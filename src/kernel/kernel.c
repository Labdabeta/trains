#include "kernel.h"
#include "linker.h"
#include "debugio.h"
#include "interface.h"

#define ever ;;

extern void asm_SetupTrap(struct KernelData *kernel_sp);

void fn(void) {
	debugio_putstr("What?\n");
	callSystemInterrupt(0,0,0,0,0,0);
}

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

	init_debugio();

	setupTaskArray(data.tasks);
	data.tasks[0].stack = data.tasks;

	debugio_putstr("Hello\n");

	asm_SetupTrap(&data.argv[4]);

	activateTask(&data.tasks[2], fn + (int)(&CODE_BASE));

	enterTask(&data.tasks[2]);

	debugio_putstr("Goodbye\n");

	return 0;
}
