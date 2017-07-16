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

extern char _display_buffer[GUI_CMD_LEN_MAX];
#define display(...) do { \
    int len; \
    sprintf(_display_buffer, __VA_ARGS__); \
    for (len = 0; _display_buffer[len]; ++len); \
    cputc('p'); cputc('0' + (len / 10)); cputc('0' + (len % 10)); \
    cputstr(_display_buffer); } while (0)

#endif /* GUI_H */
