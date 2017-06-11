#include "tasks.h"
#include "debugio.h"

void main_task(void)
{
	DEBUG_PRINT("Creating name server.");
	CreateSize(2, name_server, TASK_SIZE_TINY);

	DEBUG_PRINT("Creating clock server.");
	CreateSize(2, clock_server, TASK_SIZE_TINY);
	while (WhoIs("CLOCK") < 0)
		Pass();

	DEBUG_PRINT("Creating cin server.");
	CreateSize(2, cin_server, TASK_SIZE_TINY);
	while (WhoIs("CIN") < 0)
		Pass();

	DEBUG_PRINT("Creating cout server.");
	CreateSize(2, cout_server, TASK_SIZE_SMALL);
	while (WhoIs("COUT") < 0)
		Pass();

	Create(5, hello);

	Exit();
}
