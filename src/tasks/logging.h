#ifndef LOGGING_H
#define LOGGING_H

#include <stdarg.h>
#include "tasks.h"
#include "string.h"

enum LogType {
    LOG_SENSOR_DOWN = 1,
    LOG_CREATE = 2,
    LOG_SENSOR_UP = 3,
    LOG_ATTRIBUTION = 4,
    LOG_TRAIN_MSG = 5,
    LOG_ROUTE = 6,
    LOG_PARSE = 7,
    LOG_HOTEL = 8,
    LOG_TRACK_CLIENTS = 9
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
