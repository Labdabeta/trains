#include "tasks.h"

void hello()
{
	int cout = WhoIs("COUT");
	int clock = WhoIs("CLOCK");
	printf("Cout is: %x\n\rClock is: %d\n\r", cout, clock);
	Delay(clock, 1000);
	Exit();
}
