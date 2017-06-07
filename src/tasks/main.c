#include "tasks.h"
#include "debugio.h"

void main_task(void)
{
	CreateSize(0, name_server, TASK_SIZE_TINY);
	int cs_tid = CreateSize(0, clock_server, TASK_SIZE_TINY);
	while(WhoIs("CLOCK") < 0)
		Pass();
	CreateSize(0, uart_server, TASK_SIZE_TINY);
	while(WhoIs("COM2") < 0)
		Pass();
	Delay(cs_tid, 1000);
	debugio_putstr("\n\rWe're done here.\n\r");
	Exit();
}
