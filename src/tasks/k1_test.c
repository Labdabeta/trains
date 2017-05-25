#include "tasks.h"

#include "debugio.h"

void k1_test_task(void)
{
    int tid, pid;
    tid = MyTid();
    pid = MyParentTid();

    debugio_putstr("TID: ");
    debugio_putint_decimal(tid);
    debugio_putstr("\tPID: ");
    debugio_putint_decimal(pid);
    debugio_putstr("\n\r");

    Pass();

    debugio_putstr("TID: ");
    debugio_putint_decimal(tid);
    debugio_putstr("\tPID: ");
    debugio_putint_decimal(pid);
    debugio_putstr("\n\r");

    Exit();
}
