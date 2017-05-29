#include "tasks.h"

#include "debugio.h"

#define MSG_SIZE 4
#define ITERATIONS 1000

void main_task(void)
{
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
