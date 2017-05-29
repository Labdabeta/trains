#include "tasks.h"

#include "debugio.h"

#define MSG_SIZE 4
#define ITERATIONS 1000

void main_task(void)
{
  DEBUG_PRINT("Entered main");
  (void)CreateSize(1, name_server, TASK_SIZE_TINY);
  //Pass();
  char name1[] = "Task";
  char name2[] = "Tupac";
  char name3[] = "Risk";
  RegisterAs(name1);
  RegisterAs(name3);
  DEBUG_DUMP_VAL(WhoIs(name1));
  DEBUG_DUMP_VAL(WhoIs(name2));
  DEBUG_DUMP_VAL(WhoIs(name3));
  
  char msg[MSG_SIZE];
  char rpl[MSG_SIZE];
  int i,tid;
  for (i = 0; i < MSG_SIZE; ++i)
      rpl[i] = i;

	tid = CreateSize(2, k1_test_task, TASK_SIZE_BIG);

    for (i = 0; i < ITERATIONS; ++i) {
        Receive(&tid, msg, MSG_SIZE);
        Reply(tid, rpl, MSG_SIZE);
    }

	Exit();
}
