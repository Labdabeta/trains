#include "tasks.h"
#include "debugio.h"

void main_task(void)
{
	CreateSize(2, name_server, TASK_SIZE_NORMAL);

	CreateSize(2, clock_server, TASK_SIZE_TINY);
	while (WhoIs("CLOCK") < 0)
		Pass();

	CreateSize(2, cin_server, TASK_SIZE_TINY);
	while (WhoIs("CIN") < 0)
		Pass();

	CreateSize(2, cout_server, TASK_SIZE_SMALL);
	while (WhoIs("COUT") < 0)
		Pass();

	Create(5, hello);

	Exit();
}
