#include <service.h>
#include "gui.h" // for the messages we pass to our clients
#include "debugio.h"

struct Data {
    int parent;
};

ENTRY initialize(struct Data *data)
{
    data->parent = MyParentTid();
    dprintf("Creating gui reader.\n\r");
}

int getHexChar(void)
{
    int ch = cgetc();
    if (ch <= '9' && ch >= '0')
        return ch - '0';
    if (ch <= 'f' && ch >= 'a')
        return ch - 'a' + 10;
    if (ch <= 'F' && ch >= 'A')
        return ch - 'A' + 10;
    return 0;
}

int getSwitch(void)
{
    int ret = getHexChar() << 4;
    return ret | getHexChar();
}

ENTRY work(struct Data *data)
{
    struct GUIMessage msg;
    char ch = cgetc();

#define DO_SEND Send(data->parent, (char*)&msg, sizeof(msg), 0, 0)
    // State machine for parsing messages
    switch (ch) {
        case 'd':
        case 'D':
            msg.type = GMT_QUIT;
            DO_SEND;
            Delay(WhoIs("CLOCK"), 10);
            KQuit();
            break;
        case 'c':
            msg.type = GMT_CURVE;
            msg.data.switch_id = getSwitch();
            DO_SEND;
            break;
        case '|':
            msg.type = GMT_STRAIGHT;
            msg.data.switch_id = getSwitch();
            DO_SEND;
            break;
        case 'g': {
            int len = getHexChar() * 10;
            len += getHexChar();
            msg.type = GMT_CMD;
            for (int i = 0; i < len; ++i)
                msg.data.cmd[i] = cgetc();
            msg.data.cmd[len] = 0;
            DO_SEND;
            break; }
        default:
            break;
    }
}

MAKE_SERVICE(gui_reader)
