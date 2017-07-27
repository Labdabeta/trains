#include "logging.h"
#include "tasks.h"

int _log_enabled;
char log_buf[LOG_BUFSIZE];

void log_function(enum LogType type)
{
    log_buf[0] = 'l';
    log_buf[1] = type & 0xFF;
    log_buf[2] = strlen(log_buf + 4) + 1;
    log_buf[3] = '\t';

    if (_log_enabled) {
        cputstr(log_buf);
    } else {
        dprintf("\nBOOT LOG (%d): %s\t\n\r", type, log_buf + 4);
    }
}
