#include "tasks.h"

#include "debugio.h"

void main_task(void)
{
  int ns_tid, sv_tid, c1_tid, c2_tid;

  ns_tid = CreateSize(0, name_server, TASK_SIZE_TINY);

  sv_tid = Create(1, rps_server);
  c1_tid = Create(4, rps_client);
  c2_tid = Create(4, rps_client);

	Exit();
}
