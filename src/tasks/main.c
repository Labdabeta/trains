#include "tasks.h"

#include "debugio.h"

void main_task(void)
{
    int tid;
    tid = CreateSize(2, k1_test_task, TASK_SIZE_BIG);
    debugio_putstr("Created: ");
    debugio_putint_decimal(tid);
    debugio_putstr("\n\r");

    tid = CreateSize(2, k1_test_task, TASK_SIZE_BIG);
    debugio_putstr("Created: ");
    debugio_putint_decimal(tid);
    debugio_putstr("\n\r");

    tid = CreateSize(0, k1_test_task, TASK_SIZE_BIG);
    debugio_putstr("Created: ");
    debugio_putint_decimal(tid);
    debugio_putstr("\n\r");

    tid = CreateSize(0, k1_test_task, TASK_SIZE_BIG);
    debugio_putstr("Created: ");
    debugio_putint_decimal(tid);
    debugio_putstr("\n\r");

    debugio_putstr("FirstUserTask: exiting\n\r");
    Exit();
}
