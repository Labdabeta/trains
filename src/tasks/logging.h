#ifndef LOGGING_H
#define LOGGING_H

#include <stdarg.h>
#include "tasks.h"
#include "string.h"
#include "gui.h"

enum LogType {
    LOG_SENSOR_DOWN = 0,
    LOG_CREATE = 1,
    LOG_SENSOR_UP = 2,
    LOG_ATTRIBUTION = 3,
    LOG_TRAIN_MSG = 4,
    LOG_ROUTE = 5,
    LOG_PARSE = 6,
    LOG_HOTEL = 7
};

extern int _log_enabled;

#define LOG_BUFSIZE 0x1000
extern char log_buf[LOG_BUFSIZE];

void log_function(enum LogType type);

#define LOG(TYPE, ...) do { \
    sprintf(log_buf + 4, __VA_ARGS__); \
    log_function(TYPE); } while (0)

#define ERROR(...) do { \
    sprintf(log_buf + 4, __VA_ARGS__); \
    log_function('!'); \
    display(log_buf + 4); \
    KQuit(); } while (0)

#endif /* LOGGING_H */
