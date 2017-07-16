#ifndef PARSE_COMMAND_H
#define PARSE_COMMAND_H

// how many commands can we parse in one line?
#define MAX_COMMAND_COUNT 10
#define MAX_COMMAND_STRING 100
#define MAX_ARGUMENT_COUNT 10
#define MAX_ARGUMENT_SIZE 10

struct Argument {
    int isInt;
    union {
        int i;
        char string[MAX_ARGUMENT_SIZE];
    } data;
};

struct Command {
    char name[MAX_COMMAND_STRING];
    int num_args;
    struct Argument args[MAX_ARGUMENT_COUNT];
};

void parseCommands(const char *cmd, struct Command *cmds, int *num_cmds);

#endif /* PARSE_COMMAND_H */
