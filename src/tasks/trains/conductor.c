#include "tasks.h"
#include "parse_server.h"
#include "trains/track_server.h"
#include "string.h"
#include "routing.h"
#include "gui.h"

void conformTest(void);

void conductor(void)
{
//    cgetc();
//    int train;
//    train = 70;
//    int index;
//    index = 10;
//    int child = Create(1, conformTest);
//    Send(child, (char*)&train, sizeof(int), 0, 0);
//    Send(child, (char*)&index, sizeof(int), 0, 0);
//    cgetc();
    display("Hello");
    int parse_id = WhoIs(PARSE_SERVER_NAME);
    int track_id = WhoIs(TRACK_SERVER_NAME);

    const char *commands[] = {
        "quit", "q",
        "add is", "a is",
        "loop ii", "l ii",
        "help", "h"
    };

    int i;
    for (i = 0; i < (sizeof(commands) / sizeof(*commands)); ++i) {
        dprintf("Registering %s\n", commands[i]);
        registerForCommand(parse_id, commands[i]);
    }

    insertTrain(track_id, 70, S_MAKE(E, 8));
    int train = 70;
    int index = 10;
    int child = Create(1, conformTest);
    Send(child, (char*)&train, sizeof(int), 0, 0);
    Send(child, (char*)&index, sizeof(int), 0, 0);

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

        if (!strcmp(cmd.name, "l") || !strcmp(cmd.name, "loop")) {
            display("Looping with %d at index %d", cmd.args[0].data.i, cmd.args[1].data.i);
            int child = Create(1, conformTest);
            Send(child, (char*)&cmd.args[0].data.i, sizeof(int), 0, 0);
            Send(child, (char*)&cmd.args[1].data.i, sizeof(int), 0, 0);
        }
    }
}

