#ifndef PARSE_SERVER_H
#define PARSE_SERVER_H

#include "parse_command.h"

/* cmd format is "name args" where args are single characters i or s.
 * EG: "tr ii" or "something si"
 * Replies with a parse_command Command structure. */
void registerForCommand(const char *cmd);

#endif /* PARSE_SERVER_H */
