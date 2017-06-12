#include "tasks.h"
#include "debugio.h"
#include "linker.h"

static int _cout_tid;
void printf_putc(void *data, char ch) {
	Putc(_cout_tid, 1, ch);
}

void main_task(void)
{
	CreateSize(2, name_server, TASK_SIZE_NORMAL);

	CreateSize(2, clock_server, TASK_SIZE_TINY);
	while (WhoIs("CLOCK") < 0)
		Pass();

	CreateSize(2, cin_server, TASK_SIZE_TINY);
	while (WhoIs("CIN") < 0)
		Pass();

	_cout_tid = CreateSize(2, cout_server, TASK_SIZE_SMALL);
	while (WhoIs("COUT") < 0)
		Pass();

	init_printf(0, fn_ptr(printf_putc));

	Create(5, hello);

	Exit();
}
