#include "tasks.h"
#include "debugio.h"

void main_task(void)
{
  int ns_tid = CreateSize(0, name_server, TASK_SIZE_TINY);
  DEBUG_DUMP_VAL(ns_tid);
  int cs_tid = CreateSize(0, clock_server, TASK_SIZE_SMALL);
  DEBUG_DUMP_VAL(cs_tid);
  while(WhoIs("CLOCK") < 0)
    Pass();
  CreateSize(5, idle, TASK_SIZE_TINY);
	Exit();
}
