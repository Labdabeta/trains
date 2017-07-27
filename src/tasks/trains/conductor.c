#include "tasks.h"
#include "parse_server.h"
#include "trains/track_server.h"
#include "string.h"
#include "routing.h"
#include "gui.h"

void async_router(void)
{
    int caller;
    int train;
    struct Sensor destination;

    Receive(&caller, (char*)&train, sizeof(train));
    Reply(caller, 0, 0);

    Receive(&caller, (char*)&destination, sizeof(destination));
    Reply(caller, 0, 0);

    routeTrain(train, destination);
    Exit();
}

void conductor(void)
{
    display("Hello");
    int parse_id = WhoIs(PARSE_SERVER_NAME);
    int track_id = WhoIs(TRACK_SERVER_NAME);

    const char *commands[] = {
        "quit", "q",
        "add is", "a is",
        "tr ii", "t ii",
        "goto is", "g is",
        "help", "h"
    };

    int i;
    for (i = 0; i < (sizeof(commands) / sizeof(*commands)); ++i) {
        dprintf("Registering %s\n", commands[i]);
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

        if (!strcmp(cmd.name, "h") || !strcmp(cmd.name, "help")) {
            for (i = 0; i < (sizeof(commands) / sizeof(*commands)); ++i)
                display("%s", commands[i]);
        }

        if (!strcmp(cmd.name, "a") || !strcmp(cmd.name, "add")) {
            display("Adding %d to %c%d", cmd.args[0].data.i, S_PRINT(parseSensor(cmd.args[1].data.string)));
            insertTrain(track_id, cmd.args[0].data.i, parseSensor(cmd.args[1].data.string));
        }

        if (!strcmp(cmd.name, "g") || !strcmp(cmd.name, "goto")) {
            int child = CreateSize(1, async_router, TASK_SIZE_TINY);
            struct Sensor dest = parseSensor(cmd.args[1].data.string);
            display("Moving %d to %c%d", cmd.args[0].data.i, S_PRINT(dest));
            Send(child, (char*)&cmd.args[0].data.i, sizeof(cmd.args[0].data.i), 0, 0);
            Send(child, (char*)&dest, sizeof(dest), 0, 0);
        }

        if (!strcmp(cmd.name, "t") || !strcmp(cmd.name, "tr"))
            tput2(cmd.args[1].data.i, cmd.args[0].data.i);
    }
}


