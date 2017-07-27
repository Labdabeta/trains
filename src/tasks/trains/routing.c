#include "movement.h"
#include "tasks.h"
#include "trains/hotel.h"
#include "trains/track_server.h"
#include "trains/stop_distance.h"
#include "gui.h"

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

    if (start.group == SG_N) {
        display("%d's location unknown.", train);
        return;
    }
    LOG(LOG_ROUTING, "%d: %c%d -> %c%d", train, S_PRINT(start), S_PRINT(destination));

    while (getFreePath(reservation, train, start, destination, &path) < 0) {
        LOG(LOG_ROUTING, "No path yet");
        waitForAvailability(reservation);
    }

    LOG(LOG_ROUTING, "Got path: %s", restrictedPathToString(&path));

    // find the first reverse in the path
    for (i = 1; i < path.length; ++i) {
        struct Sensor pres;
        struct Sensor rprev;
        pres = path.sensors[i];
        rprev = getReverseSensor(path.sensors[i-1]);
        if (S_EQUAL(pres, rprev)) {
            LOG(LOG_ROUTING, "Reverse over %c%d", S_PRINT(pres));
            // go to i-1
            if (i > 1) {
                while (getFreePath(reservation, train, start, path.sensors[i-1], &current.path) < 0) {
                    LOG(LOG_ROUTING, "Waiting");
                    waitForAvailability(reservation);
                }
                struct StopOutput calibration = getStopDistance(&current.path, train);
                current.isCaboose = 1;
                current.stopIndex = calibration.stopIndex;
                current.stopTime = calibration.stopTime;
                LOG(LOG_ROUTING, "Calibration: %d %d", calibration.stopIndex, calibration.stopTime);
                while (moveTrain(train, current, reservation, track, clock)) {
                    LOG(LOG_ROUTING, "Moving failed, trying again");
                    waitForAvailability(reservation);
                }
            }
            Delay(clock, REVERSE_DELAY);
            LOG(LOG_ROUTING, "Reversing %d", train);
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
        LOG(LOG_ROUTING, "Moving failed, trying again...");
        waitForAvailability(reservation);
        while (getFreePath(reservation, train, start, path.sensors[i-1], &current.path) < 0) {
            LOG(LOG_ROUTING, "Waiting...");
            waitForAvailability(reservation);
        }
    }
    // TODO: re-reserve end point for train
}
