#include "tasks.h"
#include "parse_command.h"
#include "parse_server.h"
#include "string.h"

void conductor(void)
{
    struct Command cmd;
    int parser = WhoIs("PARSE");
    registerForCommand(parser, "quit");
    registerForCommand(parser, "tr ii");

    for (ever) {
        Receive(&parser, (char*)&cmd, sizeof(cmd));

        if (!strcmp(cmd.name, "quit")) {
            Exit();
        } else if (!strcmp(cmd.name, "tr")) {
            int train = cmd.args[0].data.i;
            int speed = cmd.args[1].data.i;

            printf("Setting %d to speed %d\n\r", train, speed);

            tput2(speed, train);
        }
    }
}
