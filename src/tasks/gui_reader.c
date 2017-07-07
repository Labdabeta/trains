#include <service.h>
#include "gui.h" // for the messages we pass to our clients
#include "debugio.h"

typedef enum MessageParseState {
    MPS_INIT,
    MPS_CURVE,
    MPS_CURVE2,
    MPS_STRAIGHT,
    MPS_STRAIGHT2
} MessageParseState;

struct Data {
    int parent;
};

ENTRY initialize(struct Data *data)
{
    data->parent = MyParentTid();
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

#define DO_SEND Send(data->parent, (char*)&msg, sizeof(msg), 0, 0)
    // State machine for parsing messages
    switch (cgetc()) {
        case 'Q':
            msg.type = GMT_QUIT;
            DO_SEND;
            break;
        case 'c':
            msg.type = GMT_CURVE;
            msg.args[0] = getSwitch();
            DO_SEND;
            break;
        case 's':
            msg.type = GMT_STRAIGHT;
            msg.args[0] = getSwitch();
            DO_SEND;
            break;
        default:
            break;
    }
}

MAKE_SERVICE(gui_reader)
