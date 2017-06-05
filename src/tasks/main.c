#include "tasks.h"
#include "debugio.h"

void test(void)
{
  int val = 11;
  int tid;
  DEBUG_PRINT("Starting");
  int *x = Obtain(&tid);
  DEBUG_DUMP_VAL(tid);
  DEBUG_DUMP_VAL(*x);
  Respond(tid, &val);
  Exit();
}

void main_task(void)
{
  CreateSize(0, name_server, TASK_SIZE_TINY);
  int cs_tid = CreateSize(0, clock_server, TASK_SIZE_SMALL);
  while(WhoIs("CLOCK") < 0)
    Pass();
  CreateSize(5, idle, TASK_SIZE_TINY);
  Delay(cs_tid, 200);
  DEBUG_PRINT("Delay done");
	int curtime = Time(cs_tid);
  DelayUntil(cs_tid, curtime+200);
  DEBUG_PRINT("Delay done");
  Delay(cs_tid, 200);
  DEBUG_PRINT("Main exit");
	Exit();
}
