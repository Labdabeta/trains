#include "parse_command.h"
#include "string.h"

/*******************************************************************************
REGEX:
    oct=0|1|2|3|4|5|6|7
    digit=oct|8|9
    hex=digit|A|a|B|b|C|c|D|d|E|e|F|f
    num=(digit+)|(0 oct+)|(0x hex+)
    letter=[A-Za-z]|_
    id=letter (letter|digit)+
    space=' '|'\t'                      --  mandatory space
    argument=id|num
    cmd={id} space {argument}*          --  save id and args
    line=cmd (; cmd)*

NFA: see parse_nfa.dot
DFA: see parse_dfa.dot

*******************************************************************************/

enum CommandParseState {
    CPS_START,
    CPS_NAME,
    CPS_ARGUMENT,
    CPS_ID,
    CPS_OCT_START,
    CPS_OCT,
    CPS_DEC,
    CPS_HEX
};

#define IS_LETTER(X) (((X) >= 'a' && (X) <= 'z') || ((X) >= 'A' && (X) <= 'Z') || (X) == '_')
#define IS_DIGIT(X) ((X) >= '0' && (X) <= '9')
#define CHR_TO_HEX(X) ((X) > '9' ? (X) - 'A' + 10 : (X) - '0')

void parseCommands(const char *cmd, struct Command *cmds, int *num_cmds)
{
    const char *ch;
    char end = ';';
    enum CommandParseState state = CPS_START;
    *num_cmds = 0;

    char name[MAX_COMMAND_STRING];
    name[0] = 0;

    for (ch = cmd; ch != &end + 1; ++ch) {
        if (!*ch || *ch == '\n') ch = &end;
        switch (state) {
            case CPS_START:
                if (IS_LETTER(*ch)) {
                    strpsh(name, *ch);
                    state = CPS_NAME;
                }
                break;
            case CPS_NAME:
                if (IS_LETTER(*ch) || IS_DIGIT(*ch)) {
                    strpsh(name,*ch);
                } else if (*ch == ';') {
                    strcpy(cmds[*num_cmds].name, name);
                    cmds[*num_cmds].num_args = 0;
                    name[0] = 0;

                    (*num_cmds)++;
                    state = CPS_START;
                } else if (*ch == ' ') {
                    strcpy(cmds[*num_cmds].name, name);
                    cmds[*num_cmds].num_args = 0;

                    state = CPS_ARGUMENT;
                }
                break;
            case CPS_ARGUMENT:
                if (*ch == '0') {
                    cmds[*num_cmds].args[cmds[*num_cmds].num_args].isInt = 1;
                    cmds[*num_cmds].args[cmds[*num_cmds].num_args].data.i = 0;
                    state = CPS_OCT_START;
                } else if (*ch >= '1' && *ch <= '9') {
                    cmds[*num_cmds].args[cmds[*num_cmds].num_args].isInt = 1;
                    cmds[*num_cmds].args[cmds[*num_cmds].num_args].data.i = (*ch - '0');
                    state = CPS_DEC;
                } else if (*ch == ';') {
                    (*num_cmds)++;
                    name[0] = 0;
                    state = CPS_START;
                } else {
                    cmds[*num_cmds].args[cmds[*num_cmds].num_args].isInt = 0;
                    cmds[*num_cmds].args[cmds[*num_cmds].num_args].data.string[0] = *ch;
                    cmds[*num_cmds].args[cmds[*num_cmds].num_args].data.string[1] = 0;
                    state = CPS_ID;
                }
                break;
            case CPS_ID:
                if (*ch == ' ') {
                    cmds[*num_cmds].num_args++;
                    state = CPS_ARGUMENT;
                } else if (*ch == ';') {
                    cmds[*num_cmds].num_args++;
                    (*num_cmds)++;
                    name[0] = 0;
                    state = CPS_START;
                } else {
                    strpsh(cmds[*num_cmds].args[cmds[*num_cmds].num_args].data.string, *ch);
                }
                break;
            case CPS_OCT_START:
                if (*ch == 'x') {
                    state = CPS_HEX;
                } else if (*ch == ' ') {
                    cmds[*num_cmds].num_args++;
                    state = CPS_ARGUMENT;
                } else if (*ch == ';') {
                    cmds[*num_cmds].num_args++;
                    (*num_cmds)++;
                    name[0] = 0;
                    state = CPS_START;
                } else {
                    cmds[*num_cmds].args[cmds[*num_cmds].num_args].data.i = (*ch - '0');
                    state = CPS_OCT;
                }
                break;
            case CPS_OCT:
                if (*ch == ' ') {
                    cmds[*num_cmds].num_args++;
                    state = CPS_ARGUMENT;
                } else if (*ch == ';') {
                    cmds[*num_cmds].num_args++;
                    (*num_cmds)++;
                    name[0] = 0;
                    state = CPS_START;
                } else {
                    cmds[*num_cmds].args[cmds[*num_cmds].num_args].data.i *= 8;
                    cmds[*num_cmds].args[cmds[*num_cmds].num_args].data.i += (*ch - '0');
                }
                break;
            case CPS_DEC:
                if (*ch == ' ') {
                    cmds[*num_cmds].num_args++;
                    state = CPS_ARGUMENT;
                } else if (*ch == ';') {
                    cmds[*num_cmds].num_args++;
                    (*num_cmds)++;
                    name[0] = 0;
                    state = CPS_START;
                } else {
                    cmds[*num_cmds].args[cmds[*num_cmds].num_args].data.i *= 10;
                    cmds[*num_cmds].args[cmds[*num_cmds].num_args].data.i += (*ch - '0');
                }
                break;
            case CPS_HEX:
                if (*ch == ' ') {
                    cmds[*num_cmds].num_args++;
                    state = CPS_ARGUMENT;
                } else if (*ch == ';') {
                    cmds[*num_cmds].num_args++;
                    (*num_cmds)++;
                    name[0] = 0;
                    state = CPS_START;
                } else {
                    cmds[*num_cmds].args[cmds[*num_cmds].num_args].data.i *= 16;
                    cmds[*num_cmds].args[cmds[*num_cmds].num_args].data.i += CHR_TO_HEX(*ch);
                }
                break;
        }
    }
}
