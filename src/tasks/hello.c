#include "tasks.h"
#include "cout_server.h"

void hello()
{
	int cout = WhoIs("COUT");
	int clock = WhoIs("CLOCK");
	sendCoutPutstr(cout, "Hello, world!\n\r");
	Delay(clock, 1000);
	Exit();
}
