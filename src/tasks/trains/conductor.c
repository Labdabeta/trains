#include "tasks.h"
#include "parse_server.h"
#include "trains/track_server.h"
#include "string.h"
#include "routing.h"
#include "gui.h"

void conductor(void)
{
    display("Hello");
    int parse_id = WhoIs(PARSE_SERVER_NAME);
    int track_id = WhoIs(TRACK_SERVER_NAME);

    const char *commands[] = {
        "quit", "q",
        "add is", "a is",
        "speed i", "s i",
        "reverse", "r",
        "help", "h"
    };

    int i;
    for (i = 0; i < (sizeof(commands) / sizeof(*commands)); ++i) {
        dprintf("Registering %s\n", commands[i]);
        registerForCommand(parse_id, commands[i]);
    }

    int thetrain = 0;
    for (ever) {
        struct Command cmd;
        Receive(&i, (char*)&cmd, sizeof(cmd));
        Reply(i, 0, 0);

        if (!strcmp(cmd.name, "q") || !strcmp(cmd.name, "quit")) {
            display("Goodbye");
            Exit();
        }

        if (!strcmp(cmd.name, "h") || !strcmp(cmd.name, "help")) {
            for (i = 0; i < (sizeof(commands) / sizeof(*commands)); ++i)
                display("%s", commands[i]);
        }

        if (!strcmp(cmd.name, "a") || !strcmp(cmd.name, "add")) {
            display("Adding %d to %c%d", cmd.args[0].data.i, S_PRINT(parseSensor(cmd.args[1].data.string)));
            thetrain = cmd.args[0].data.i;
            insertTrain(track_id, cmd.args[0].data.i, parseSensor(cmd.args[1].data.string));
        }

        if (!strcmp(cmd.name, "s") || !strcmp(cmd.name, "speed")) {
            display("Setting speed to %d", cmd.args[0].data.i);
            tput2(cmd.args[0].data.i, thetrain);
        }

        if (!strcmp(cmd.name, "r") || !strcmp(cmd.name, "reverse")) {
            display("Reversing %d", thetrain);
            tput2(15, thetrain);
        }
    }
}


