#include "tasks.h"

#include "debugio.h"

void main_task(void)
{
  CreateSize(0, name_server, TASK_SIZE_TINY);
  CreateSize(0, clock_server, TASK_SIZE_TINY);
  while(WhoIs("CLOCK"))
    PASS();

  CreateSize(5, idle, TASK_SIZE_TINY);
	Exit();
}
