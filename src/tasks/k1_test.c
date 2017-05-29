#include "tasks.h"

#include "debugio.h"

#define MSG_SIZE 4
#define ITERATIONS 1000

void k1_test_task(void)
{
    char msg[MSG_SIZE];
    char rpl[MSG_SIZE];
	int i;
    volatile unsigned int *timer = 0;
    unsigned int initial, final;

    timer = (unsigned int*)0x80810080;
    timer[0] = ~0;
    timer[2] &= ~(0x8); /* 2khz */
    timer[2] |= 0x80; /* enable */
    initial = timer[1];

    for (i = 0; i < MSG_SIZE; ++i)
        msg[i] = -i;

    debugio_putstr("Starting...\n\r");

    for (i = 0; i < ITERATIONS; ++i)
        Send(1, msg, MSG_SIZE, rpl, MSG_SIZE);

    final = timer[1];
    timer[2] &= ~(0x80); /* disable */


    debugio_putstr("Done\n\r");
    debugio_putuint_decimal(initial);
    debugio_putstr("\n\r");
    debugio_putuint_decimal(final);

	Exit();
}
