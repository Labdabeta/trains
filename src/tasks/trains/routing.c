#include "movement.h"
#include "tasks.h"
#include "trains/hotel.h"
#include "trains/track_server.h"

#define REVERSE_DELAY 5

void routeTrain(int train, struct Sensor destination)
{
    int i;
    struct Movement current;
    struct RestrictedPath path;

    int track = WhoIs(TRACK_SERVER_NAME);
    int reservation = WhoIs(RESERVATION_SERVER_NAME);
    int clock = WhoIs("CLOCK");
    struct Sensor start = lastKnownLocation(track, train);

    while (getFreePath(reservation, train, start, destination, &path) < 0)
        waitForAvailability(reservation);

    // find the first reverse in the path
    for (i = 1; i < path.length; ++i) {
        if (S_EQUAL(path.sensors[i], getReverseSensor(path.sensors[i-1]))) {
            // go to i-1
            while (getFreePath(reservation, train, start, path.sensors[i-1], &current.path) < 0)
                waitForAvailability(reservation);
            current.isCaboose = 1;
            current.stopIndex = 0;
            current.stopTime = 0;
            while (!moveTrain(train, current, reservation, track, clock))
                waitForAvailability(reservation);
            Delay(clock, REVERSE_DELAY);
            dprintf("Reversing train %d\n\r", train);
            tput2(15, train); // reverse the train
            Delay(clock, REVERSE_DELAY);
            start = path.sensors[i];
        }
    }
}
