#include "movement.h"
#include "tasks.h"
#include "trains/hotel.h"
#include "trains/track_server.h"
#include "trains/stop_distance.h"

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

    dprintf("Routing %d from %c%d to %c%d\n", train, S_PRINT(start), S_PRINT(destination));

    while (getFreePath(reservation, train, start, destination, &path) < 0) {
        dprintf("Waiting for a good path...\n\r");
        waitForAvailability(reservation);
    }

    dprintf("Routing path found.\n");

    // find the first reverse in the path
    for (i = 1; i < path.length; ++i) {
        struct Sensor pres;
        struct Sensor rprev;
        pres = path.sensors[i];
        rprev = getReverseSensor(path.sensors[i-1]);
        if (S_EQUAL(pres, rprev)) {
            // go to i-1
            while (getFreePath(reservation, train, start, pres, &current.path) < 0) {
                dprintf("Waiting for a free path...\n\r");
                waitForAvailability(reservation);
            }
            struct StopOutput calibration = getStopDistance(&current.path, train);
            current.isCaboose = 1;
            current.stopIndex = calibration.stopIndex;
            current.stopTime = calibration.stopTime;
            while (moveTrain(train, current, reservation, track, clock)) {
                dprintf("Waiting for a successful movement...\n\r");
                waitForAvailability(reservation);
            }
            Delay(clock, REVERSE_DELAY);
            dprintf("Reversing train %d\n\r", train);
            tput2(15, train); // reverse the train
            Delay(clock, REVERSE_DELAY);
            start = pres;
        }
    }

    // go to i-1
    getFreePath(reservation, -1, start, path.sensors[path.length-1], &current.path);
    struct StopOutput calibration = getStopDistance(&current.path, train);
    current.isCaboose = 1;
    current.stopIndex = calibration.stopIndex;
    current.stopTime = calibration.stopTime;
    while (moveTrain(train, current, reservation, track, clock)) {
        dprintf("Waiting for a successful movement...\n");
        waitForAvailability(reservation);
        while (getFreePath(reservation, train, start, path.sensors[i-1], &current.path) < 0) {
            dprintf("Waiting for a free path...\n");
            waitForAvailability(reservation);
        }
    }
}
