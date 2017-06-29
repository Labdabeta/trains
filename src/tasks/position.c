#include <server.h>
#include "position.h"
#include "rand.h"
#include "sensors.h"
#include "switches.h"

#define TRAIN_NR 70

struct Data {
    PositionCalculator pc;
    int clock;
};

struct Message {
    int sensor; // one byte = query, 2 bytes = switch
};

static void dumpNetworkState(ISTNetwork *n)
{
        int i;
        dprintf("Network state:\n\r");

        dprintf("input_weights[] = {");
        for (i = 0; i < NUM_INPUT_WEIGHTS; ++i)
                dprintf("0x%x,",n->input_weights[i]);

        dprintf("\n\rlayer1_weights[] = {");
        for (i = 0; i < NUM_LAYER_WEIGHTS; ++i)
                dprintf("0x%x,",n->layer_weights[i]);
}

static float float_abs(float x) { if (x < 0.0) return -x; return x; }

ENTRY initialize(struct Data *data)
{
    int i;
    int r = (int)data;
    for (i = 0; i < NUM_INPUT_WEIGHTS; ++i)
        data->pc.n.input_weights[i] = float_abs((float)rand(r) / 2147483647.0);
    for (i = 0; i < NUM_LAYER_WEIGHTS; ++i)
        data->pc.n.layer_weights[i] = float_abs((float)rand(r) / 2147483647.0);

    initPositionCalculator(&data->pc);

    data->clock = WhoIs("CLOCK");

    registerForSensorFlips(WhoIs("SENSOR"));
    registerForSwitchFlips(WhoIs("SWITCH"));

    RegisterAs("POSITION");
}

ENTRY handle(struct Data *data, int tid, struct Message *msg, int size)
{
    if (size == 4) { // Sensor update
        Reply(tid, 0, 0);
        if (msg->sensor > 0) {
            dprintf("Hit %d at %d\n\r", msg->sensor, Time(data->clock));
            registerSensorTrigger(&data->pc, msg->sensor-1, TRAIN_NR, Time(data->clock), 1);
            dprintf("Expect to hit next sensor at t+%d\n\r", getExpectedNextSensorTime(&data->pc, TRAIN_NR));
        }
    } else if (size == 2) { // Switch update
        registerSwitchState(&data->pc, msg->sensor & 0xFF, msg->sensor & 0x100);
        learnPositions(&data->pc);
    } else { // Query
        struct Position pos = getPosition(&data->pc, TRAIN_NR, Time(data->clock));
        Reply(tid, (char*)&pos, sizeof(pos));
    }
}

MAKE_SERVER(position_server)
