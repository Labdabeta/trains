#include "movement.h"
#include "track_server.h"
#include "tasks.h"
#include "trains/hotel.h"
#include "gui.h"
#include "util/async_delay.h"

#warning TODO: implement "Exact knowledge" IE: feel free to overshoot a bit, then backup to land perfectly and reset direction to forward. No need for precise calibration, just "good enough"

#define PRINT(X) dprintf("%d: %s = %d\n", __LINE__, #X, X)

static void setupSwitches(switch_state state, switch_state mask, int track)
{
    int i;
    for (i = 0; i < SWITCH_MAX; ++i) {
        if (IS_CURVED(mask, i))
            notifySwitch(track, i, IS_CURVED(state, i));
    }
}

static inline void printPath(struct RestrictedPath *p)
{
    int i;
    printf("START\n");
    for (i = 0; i < p->length; ++i) {
        printf("\tSegment %d: \n"
               "\t\tDistance - %d mm\n"
               "\t\tDestination - %c%d\n"
               "\t\tSwitch Configuration - %x\n"
               "\t\tSwitch Mask - %x\n",
               i + 1,
               p->distances[i],
               p->sensors[i].group + 'A',
               p->sensors[i].id + 1,
               p->states[i],
               p->masks[i]);
    }
    printf("END\n");
}

void movement_task(void)
{
    struct Movement move;
    struct TrackServerMessage tsm;
    int caller;
    int idx;
    int track_tid;
    int reservation_tid;
    int clock_tid;
    int train;

    dprintf("Making a movement...\n\r");

    int failure = 1;
    int success = 0;

    Receive(&caller, (char*)&move, sizeof(move));
    Reply(caller, 0, 0);

    Receive(&caller, (char*)&reservation_tid, sizeof(move));
    Reply(caller, 0, 0);

    Receive(&caller, (char*)&track_tid, sizeof(move));
    Reply(caller, 0, 0);

    Receive(&caller, (char*)&clock_tid, sizeof(move));
    Reply(caller, 0, 0);

    Receive(&caller, (char*)&train, sizeof(move));
    // Replies with 0 = success or X = failure

    dprintf("Reserving a path for %d:\n\r", train);

    printPath(&move.path);

    // Reserve spaces
    for (idx = 1; idx < move.path.length; ++idx) {
        int i;
        if (requestSpace(reservation_tid,
            SENSOR_SPACE(move.path.sensors[idx-1],
                move.path.sensors[idx]), train)) {
            dprintf("Could not reserve: %c%d to %c%d.\n\r", S_PRINT(move.path.sensors[idx-1]), S_PRINT(move.path.sensors[idx]));
            Reply(caller, (char*)&failure, sizeof(failure));
            Exit();
        }
        for (i = 0; i < SWITCH_MAX; ++i) {
            if (IS_CURVED(move.path.masks[idx], i)) {
                if (requestSpace(reservation_tid, SWITCH_SPACE(i), train)) {
                    dprintf("Could not reserve switch %d\n\r", SW_ID_TO_NUM(i));
                    Reply(caller, (char*)&failure, sizeof(failure));
                    Exit();
                }
            }
        }
    }

    dprintf("Reservations made.\n\r");

    registerForSensorDown(track_tid, -1);

    dprintf("Registered for train %d activity.\n\r", train);

    setupSwitches(move.path.states[0], move.path.masks[0], track_tid);
    setupSwitches(move.path.states[1], move.path.masks[1], track_tid);

    int speed = 2;
    dprintf("Setting train %d to speed %d.\n\r", train, speed);
    tput2(speed, train);
    dprintf("Speed set!\n\r", train, speed);
    idx = 0;
    while (idx < move.path.length) {
        dprintf("%d: %d %d", __LINE__, idx, move.path.length);
        int sender;
        int size = Receive(&sender, (char*)&tsm, sizeof(tsm));
        PRINT(sender);
        Reply(sender, 0, 0);

        PRINT(size);
        PRINT(sender);

        if (size == 0) {
            // A message from the async delay
            display("Stopping train %d.", train);
            tput2(16, train);
        } else {
            int old_idx = idx;
            int i;
            for (i = idx; i < move.path.length; ++i) {
                dprintf("%d: %d %d", __LINE__, idx, move.path.length);
                if (S_EQUAL(tsm.data.sensor.sensor, move.path.sensors[i])) {
                    idx = i;
                    dprintf("%d: %d %d", __LINE__, idx, move.path.length);
                    break;
                }
            }

            PRINT(old_idx);
            PRINT(idx);

            if (idx == old_idx) {
                PRINT("NOT ON PATH");
                // Not on path, this is bad, abort
                unregisterForSensorDown(track_tid, train);
                unregisterForSensorUp(track_tid, train);
                display("Spurrious attribution of %c%d to train %d", S_PRINT(tsm.data.sensor.sensor), train);
                Reply(caller, (char*)&failure, sizeof(failure));
                Exit();
            } else {
                PRINT("ON PATH");
                // Update to next segment of path
                setupSwitches(move.path.states[idx], move.path.masks[idx], track_tid);
                setupSwitches(move.path.states[idx+1], move.path.masks[idx+1], track_tid);

                display("%d passed sensor %d on its path", train, idx);

                if (move.isCaboose) {
                    int index;
                    for (index = 1; index < idx; ++index) {
                        dprintf("%d: %d %d", __LINE__, idx, move.path.length);
                        int i;
                        freeSpace(reservation_tid,
                            SENSOR_SPACE(move.path.sensors[index-1],
                                move.path.sensors[index]), train);
                        for (i = 0; i < SWITCH_MAX; ++i) {
                            dprintf("%d: %d %d", __LINE__, idx, move.path.length);
                            if (IS_CURVED(move.path.masks[index], i))
                                freeSpace(reservation_tid, SWITCH_SPACE(i), train);
                        }
                    }
                }

                // get ready to stop
                if (idx >= (move.path.length - move.stopIndex - 1)) {
                    display("Preparing to stop!", train);
                    async_delay(clock_tid, move.stopTime, 0, 0);
                }
            }
        }
    }

    unregisterForSensorDown(track_tid, -1);
    Reply(caller, (char*)success, sizeof(success));
    Exit();
}

int moveTrain(int train, struct Movement movement, int reservation_tid, int track_tid, int clock_tid)
{
    int reply;
    int mover = CreateSize(1, movement_task, TASK_SIZE_TINY);

    Send(mover, (char*)&movement, sizeof(movement), 0, 0);
    Send(mover, (char*)&reservation_tid, sizeof(reservation_tid), 0, 0);
    Send(mover, (char*)&track_tid, sizeof(track_tid), 0, 0);
    Send(mover, (char*)&clock_tid, sizeof(clock_tid), 0, 0);
    Send(mover, (char*)&train, sizeof(train), (char*)&reply, sizeof(reply));

    return reply;
}
