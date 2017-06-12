#include "tasks.h"

void hello()
{
	int cout = WhoIs("COUT");
	int cin = WhoIs("CIN");
	int tout = WhoIs("TOUT");
	int tin = WhoIs("TIN");
	int clock = WhoIs("CLOCK");
	printf("Cout is: %d\n\rCin is: %d\n\r", cout, cin);
	printf("Tout is: %d\n\rTin is: %d\n\r", tout, tin);
	Delay(clock, 10);

	printf("Got: %d\n\r", Getc(cin, 2));
	Putc(tout, 1, 193);
	printf("Sensor: %d\n\r", Getc(tin, 1));

	while (1) {
		int ch = Getc(cin, 2);
		if (ch == 's') break;
		Putc(cout, 2, ch);
	}

	Delay(clock, 100);
	Exit();
}
