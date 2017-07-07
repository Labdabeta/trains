#ifndef GUI_H
#define GUI_H

#define GUI_SERVER_NAME "GUI"

typedef enum GUIMessageType {
    GMT_QUIT,
    GMT_CURVE,
    GMT_STRAIGHT
} GUIMessageType;

struct GUIMessage {
    GUIMessageType type;
    int args[2];
};

void registerForMessages(int tid);

#endif /* GUI_H */
