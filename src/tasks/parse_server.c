#include "parse_server.h"
#include <server.h>
#include "string.h"
#include "gui.h"
#include "util/async_send.h"

#define MAX_CLIENTS 0x10

struct Client {
    int tid;
    char name[MAX_COMMAND_STRING];
    int isInt[MAX_ARGUMENT_SIZE];
    int numArgs;
};

static inline int cmdsFit(struct Client *c, struct Command *cmd)
{
    int i;
    if (strcmp(c->name, cmd->name))
        return 0;

    if (c->numArgs != cmd->num_args)
        return 0;

    for (i = 0; i < c->numArgs; ++i) {
        if (c->isInt[i] != cmd->args[i].isInt)
            return 0;
    }
    return 1;
}

struct Data {
    struct Client clients[MAX_CLIENTS];
    int num_clients;
    int gui_tid;
};

struct ParseMessage {
    char name[MAX_COMMAND_STRING];
    int isInt[MAX_ARGUMENT_SIZE];
    int numArgs;
};

struct Message {
    union {
        struct GUIMessage g;
        struct ParseMessage p;
    } data;
};

ENTRY initialize(struct Data *data)
{
    RegisterAs(PARSE_SERVER_NAME);
    data->num_clients = 0;
    data->gui_tid = WhoIs(GUI_SERVER_NAME);
    registerForMessages(data->gui_tid);
}

ENTRY handle(struct Data *data, int tid, struct Message *msg, int msg_size)
{
    if (tid == data->gui_tid) {
        Reply(tid, 0, 0);

        if (msg->data.g.type == GMT_CMD) {
            struct Command cmds[MAX_COMMAND_COUNT];
            int num_cmds, i;
            int found;

            parseCommands(msg->data.g.data.cmd, cmds, &num_cmds);

            for (i = 0; i < num_cmds; ++i) {
                int client;
                found = 0;
                for (client = 0; client < data->num_clients; ++client) {
                    if (cmdsFit(&data->clients[client], &cmds[i])) {
                        async_send(data->clients[client].tid, (char*)&cmds[i], sizeof(cmds[i]));
                        found = 1;
                    }
                }

                if (!found)
                    display("Unknown command: %s", cmds[i].name);
            }
        }
    } else {
        struct ParseMessage *p = &msg->data.p;
        int i;
        Reply(tid, 0, 0);

        data->clients[data->num_clients].tid = tid;
        strcpy(data->clients[data->num_clients].name, p->name);
        data->clients[data->num_clients].numArgs = p->numArgs;
        for (i = 0; i < p->numArgs; ++i)
            data->clients[data->num_clients].isInt[i] = p->isInt[i];
        data->num_clients++;
    }
}

void registerForCommand(int pid, const char *cmd)
{
    int i;
    struct ParseMessage pm;
    pm.numArgs = 0;

    for (i = 0; cmd[i] && cmd[i] != ' '; ++i)
        pm.name[i] = cmd[i];

    pm.name[i] = 0;

    if (cmd[i] == ' ') {
        while (cmd[++i])
            pm.isInt[pm.numArgs++] = (cmd[i] == 'i');
    }

    Send(pid, (char*)&pm, sizeof(pm), 0, 0);
}

MAKE_SERVER(parse_server)
