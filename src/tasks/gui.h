#ifndef GUI_H
#define GUI_H

#define GUI_SERVER_NAME "GUI"
#define GUI_CMD_LEN_MAX 101

typedef enum GUIMessageType {
    GMT_QUIT,
    GMT_CURVE,
    GMT_STRAIGHT,
    GMT_CMD
} GUIMessageType;

struct GUIMessage {
    GUIMessageType type;
    union {
        int switch_id;
        char cmd[GUI_CMD_LEN_MAX]; // null-terminated
    } data;
};

void registerForMessages(int tid);

#endif /* GUI_H */
