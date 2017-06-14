#include "tasks.h"

void A0_initialization(void)
{
	int tid;
	printf("Initting\n\r");
	Receive(&tid, 0, 0);
	Reply(tid, 0, 0);
}
