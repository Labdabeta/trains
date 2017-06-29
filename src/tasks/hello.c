#include "tasks.h"
#include "position.h"

#define END_POINT 20
#define START_POINT 10
#define TRAIN_NR 70
#define SPEED 10

void helper(void) {
    (void)getAccurateStopTime(END_POINT, START_POINT, TRAIN_NR, SPEED);
}

void hello()
{
    int cid = WhoIs("CLOCK");
    int pos = WhoIs("POSITION");
    struct Position p;
    Create(1, helper);
    for (ever) {
        Send(pos, 0, 0, (char*)&p, sizeof(p));
        printf("Expected position: %d ticks after sensor %d\n\r", p.distance, p.sensorId);
        Delay(cid, 100);
    }
}
