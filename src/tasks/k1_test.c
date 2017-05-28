#include "tasks.h"

#include "debugio.h"

void k1_test_task(void)
{
	int tid, pid;
    char msg;
    char rpl;
	tid = MyTid();
	pid = MyParentTid();

    msg = 'A';
    Send(1, &msg, 1, &rpl, 1);

    debugio_putstr("Reply: ");
    debugio_putc(msg);
    debugio_putstr("\n\r");

	Exit();
}
