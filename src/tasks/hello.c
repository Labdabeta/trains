#include "tasks.h"

void hello()
{
	int cout = WhoIs("COUT");
	int cin = WhoIs("CIN");
	int tout = WhoIs("TOUT");
	int tin = WhoIs("TIN");
	int clock = WhoIs("CLOCK");
	Putstr(cout, 2, "Hello, World!\n\r");
	int ch = Getc(cin, 2);
	Putc(cout, 2, ch);
	Putc(tout, 1, 133);
	ch = Getc(tin, 1);
	Putc(cout, 2, ch);
	Delay(clock, 10);
	Exit();
}
