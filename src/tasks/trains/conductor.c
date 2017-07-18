#include "tasks.h"
#include "parse_server.h"
#include "trains/track_server.h"
#include "trains/hotel.h"
#include "string.h"
#include "routing.h"
#include "gui.h"

void conductor(void)
{
    display("Hello");
    int parse_id = WhoIs(PARSE_SERVER_NAME);
    int track_id = WhoIs(TRACK_SERVER_NAME);
    int hotel = WhoIs(RESERVATION_SERVER_NAME);

    const char *commands[] = {
        "quit", "q",
        "book ii", "b ii",
        "book iss", "b iss",
        "who i", "w i",
        "who ss", "w ss",
        "cancel ii", "c ii",
        "cancel iss", "c iss",
        "goto is",
        "add is", "a is"
    };

    int i;
    for (i = 0; i < (sizeof(commands) / sizeof(*commands)); ++i) {
        dprintf("Registering %s\n\r", commands[i]);
        registerForCommand(parse_id, commands[i]);
    }

    for (ever) {
        struct Command cmd;
        Receive(&i, (char*)&cmd, sizeof(cmd));
        Reply(i, 0, 0);

        if (!strcmp(cmd.name, "q") || !strcmp(cmd.name, "quit")) {
            display("Goodbye");
            Exit();
        }

        if (!strcmp(cmd.name, "book") || !strcmp(cmd.name, "b")) {
            if (cmd.args[1].isInt) {
                int result = requestSpace(hotel, SWITCH_SPACE(cmd.args[1].data.i), cmd.args[0].data.i);
                display("Request result: %d", result);
            } else {
                int result = requestSpace(hotel, SENSOR_SPACE(parseSensor(cmd.args[1].data.string), parseSensor(cmd.args[2].data.string)), cmd.args[0].data.i);
                display("Request result: %d", result);
            }
        }

        if (!strcmp(cmd.name, "who") || !strcmp(cmd.name, "w")) {
            if (cmd.args[1].isInt) {
                int result = queryOwner(hotel, SWITCH_SPACE(cmd.args[0].data.i));
                display("Query result: %d", result);
            } else {
                int result = queryOwner(hotel, SENSOR_SPACE(parseSensor(cmd.args[0].data.string), parseSensor(cmd.args[1].data.string)));
                display("Query result: %d", result);
            }
        }

        if (!strcmp(cmd.name, "cancel") || !strcmp(cmd.name, "c")) {
            if (cmd.args[1].isInt) {
                freeSpace(hotel, SWITCH_SPACE(cmd.args[1].data.i), cmd.args[0].data.i);
                display("Space freed!");
            } else {
                freeSpace(hotel, SENSOR_SPACE(parseSensor(cmd.args[1].data.string), parseSensor(cmd.args[2].data.string)), cmd.args[0].data.i);
                display("Space freed!");
            }
        }

        if (!strcmp(cmd.name, "goto")) {
            struct RestrictedPath p;
            struct Sensor src = lastKnownLocation(track_id, cmd.args[0].data.i);
            struct Sensor dst = parseSensor(cmd.args[1].data.string);
            int distance = getFreePath(hotel, cmd.args[0].data.i, src, dst, &p);
            display("Distance: %dmm", distance);

            if (distance >= 0) {
                char *dsp = alloc(1 + 4 * p.length);
                char *cur = dsp;
                int i;
                for (i = 0; i < p.length; ++i) {
                    struct Sensor sen = p.sensors[i];
                    *cur++ = sen.group + 'A';
                    *cur++ = sen.id >> 4;
                    *cur++ = sen.id & 0xF;
                    *cur++ = '-';
                }

                *cur = 0;
                display(cur);
            }
        }

        if (!strcmp(cmd.name, "a") || !strcmp(cmd.name, "add")) {
            display("Adding %d to %c%d", cmd.args[0].data.i, S_PRINT(parseSensor(cmd.args[1].data.string)));
            insertTrain(track_id, cmd.args[0].data.i, parseSensor(cmd.args[1].data.string));
        }
    }
}

