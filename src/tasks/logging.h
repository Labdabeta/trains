#ifndef LOGGING_H
#define LOGGING_H

#include <stdarg.h>

enum LogType {
    LOG_SENSOR
};

extern int _log_enabled;

/* Logs many ints */
void log_function(enum LogType type, int numelems, const int *elems);

#define LOG(TYPE, ...) do { int _data[] = {__VA_ARGS__}; log_function(TYPE, sizeof(_data)/sizeof(int), _data); } while (0)

#endif /* LOGGING_H */
