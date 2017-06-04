#include "tasks.h"
#include "debugio.h"

void main_task(void)
{
  CreateSize(0, name_server, TASK_SIZE_TINY);
  int cs_tid = CreateSize(0, clock_server, TASK_SIZE_SMALL);
  DEBUG_PRINT("Created");
  while(WhoIs("CLOCK") < 0)
    Pass();
  CreateSize(5, idle, TASK_SIZE_TINY);
  Delay(cs_tid, 200);
  DEBUG_PRINT("Delay done");
  Delay(cs_tid, 200);
  DEBUG_PRINT("Delay done");
  Delay(cs_tid, 200);
  DEBUG_PRINT("Main exit");
	Exit();
}
