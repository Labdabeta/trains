#include "tasks.h"
#include "linker.h"

static int _cout_tid;
void printf_putc(void *data, char ch) {
	Putc(_cout_tid, 2, ch);
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

	_cout_tid = CreateSize(0, cout_server, TASK_SIZE_NORMAL);
	while (WhoIs("COUT") < 0)
		Pass();

	init_printf(0, fn_ptr(printf_putc));

	CreateSize(2, tin_server, TASK_SIZE_TINY);
	while (WhoIs("TIN") < 0)
		Pass();

	CreateSize(2, tout_server, TASK_SIZE_TINY);
	while (WhoIs("TOUT") < 0)
		Pass();

	Create(1, view);

	Exit();
}
