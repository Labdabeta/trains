#include <service.h>
#include "tc1_terminal.h"
#include "conductor.h"

void tc1_view(void);

struct Data {
    int pid; // parent
    int cid; // child
};

ENTRY initialize(struct Data *data)
{
    data->pid = MyParentTid();
    data->cid = Create(3, tc1_view);

    Send(data->pid, (char*)&data->cid, sizeof(data->cid), 0, 0);
}

ENTRY work(struct Data *data)
{
    char cmd[5];
    char c;
    struct tc1_ter_msg msg;

    cmd[0] = cgetc();
    msg.code = TC1Code_Echo;
    msg.data.c = cmd[1];
    Send(data->cid, (char*)&msg, sizeof(msg), 0, 0);

    if (cmd[0] == 'i') {
        cmd[1] = cgetc();
        msg.code = TC1Code_Echo;
        msg.data.c = cmd[1];
        Send(data->cid, (char*)&msg, sizeof(msg), 0, 0);

        while (cgetc() != '\n')
            Pass();

        msg.code = TC1Code_Clear;
        Send(data->cid, (char*)&msg, sizeof(msg), 0, 0);

        int idx = (cmd[1] <= '9' ? cmd[1] - '0' : cmd[1] - 'a');

        struct test_message code;
        code.type = CODE_Index;
        code.data.index = idx;
        Send(data->pid, (char*)&code, sizeof(code), 0, 0);
    } else {
        cmd[1] = cgetc();
        msg.code = TC1Code_Echo;
        msg.data.c = cmd[1];
        Send(data->cid, (char*)&msg, sizeof(msg), 0, 0);

        cmd[2] = cgetc();
        msg.code = TC1Code_Echo;
        msg.data.c = cmd[2];
        Send(data->cid, (char*)&msg, sizeof(msg), 0, 0);

        cmd[3] = cgetc();
        msg.code = TC1Code_Echo;
        msg.data.c = cmd[3];
        Send(data->cid, (char*)&msg, sizeof(msg), 0, 0);

        cmd[4] = cgetc();
        msg.code = TC1Code_Echo;
        msg.data.c = cmd[4];
        Send(data->cid, (char*)&msg, sizeof(msg), 0, 0);

        while (cgetc() != '\n')
            Pass();

        msg.code = TC1Code_Clear;
        Send(data->cid, (char*)&msg, sizeof(msg), 0, 0);

        struct test_message code;
        code.type = CODE_Pair;
        code.data.pair.pointA = ((cmd[1] - 'A') << 4) | (cmd[2] <= '9' ? cmd[2] - '0' : cmd[2] - 'a');
        code.data.pair.pointB = ((cmd[2] - 'A') << 4) | (cmd[3] <= '9' ? cmd[3] - '0' : cmd[3] - 'a');
        Send(data->pid, (char*)&code, sizeof(code), 0, 0);
    }
}

MAKE_SERVICE(tc1_controller)
