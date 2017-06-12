#include "tasks.h"

void hello()
{
	int cout = WhoIs("COUT");
	int clock = WhoIs("CLOCK");
	printf("Cout is: %x\n\rClock is: %d\n\r", cout, clock);
	printf("sizeof(unsigned long) = %d\n\rsizeof(unsigned long long) = %d\n\r",
			sizeof(unsigned long), sizeof(unsigned long long));
	Delay(clock, 1000);
	Exit();
}
