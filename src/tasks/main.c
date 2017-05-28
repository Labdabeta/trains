#include "tasks.h"

#include "debugio.h"

void main_task(void)
{
	int tid;
    char msg;
	tid = CreateSize(2, k1_test_task, TASK_SIZE_BIG);
	debugio_putstr("Created: ");
	debugio_putint_decimal(tid);
	debugio_putstr("\n\r");

    Receive(&tid, &msg, 1);

    debugio_putstr("Got: ");
    debugio_putc(msg);
    debugio_putstr("\n\r");
    msg = 'X';
    Reply(tid, &msg, 1);

	debugio_putstr("FirstUserTask: exiting\n\r");
	Exit();
}
