#include "conductor.h"
#include "precise_stop.h"
#include "trains/path_finder.h"
#include "tasks.h"

#define pointA 20
#define pointB 40

void conductor()
{
	init_tracka();
	printf("Conducting...\n\r");
	printf("Result: %d\n\r", getAccurateStopTime(pointB, pointA, 70, 10));
}
