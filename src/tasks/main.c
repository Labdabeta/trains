#include "tasks.h"
#include "debugio.h"

struct K3Delay {
	int t, d;
};

void client_task(void)
{
	int parent = MyParentTid();
	int id = MyTid();
	int clockid;
	struct K3Delay d;
	int i;

	(void)Send(parent, 0, 0, (char*)&d, sizeof(d));

	clockid = WhoIs("CLOCK");

	for (i = 0; i < d.d; ++i) {
		Delay(clockid, d.t);
		debugio_putstr("TID ");
		debugio_putint_decimal(id);
		debugio_putstr("\tt: ");
		debugio_putint_decimal(d.t);
		debugio_putstr("\tCompleted: ");
		debugio_putint_decimal(i+1);
		debugio_putstr("\n\r");
	}

	(void)Send(parent, 0, 0, 0, 0);
	Exit();
}

void main_task(void)
{
	Service();
	CreateSize(0, name_server, TASK_SIZE_TINY);
	(void)CreateSize(0, clock_server, TASK_SIZE_SMALL);
	while(WhoIs("CLOCK") < 0)
		Pass();

	int i, t3, t4, t5, t6;
	t3 = Create(3, client_task);
	t4 = Create(4, client_task);
	t5 = Create(5, client_task);
	t6 = Create(6, client_task);

	for (i = 0; i < 4; ++i) {
		int tid;
		struct K3Delay d;
		Receive(&tid, 0, 0);
		if (tid == t3) { d.t = 10; d.d = 20; }
		if (tid == t4) { d.t = 23; d.d = 9; }
		if (tid == t5) { d.t = 33; d.d = 6; }
		if (tid == t6) { d.t = 71; d.d = 3; }
		Reply(tid, (char*)&d, sizeof(d));
	}

	for (i = 0; i < 4; ++i) {
		int tid;
		Receive(&tid, 0, 0);
		Reply(tid, 0, 0);
	}

	//KQuit();
}
