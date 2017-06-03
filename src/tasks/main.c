#include "tasks.h"

#include "debugio.h"

void main_task(void)
{
  int ns_tid;
  ns_tid = CreateSize(0, name_server, TASK_SIZE_TINY);
	Exit();
}
