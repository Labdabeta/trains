#include "logging.h"
#include "tasks.h"

int _log_enabled;

void log_function(enum LogType type, int numelems, const int *elems)
{
    int *data = alloc(numelems * sizeof(*elems) + sizeof(type) + sizeof(int));
    int i;
    data[0] = 0x20474F4C; // 'log ' in little endian
    data[1] = type;
    for (i = 0; i < numelems; ++i)
        data[i+2] = elems[i];
    if (_log_enabled) {
        cputbuf((char*)data, numelems * sizeof(*elems) + sizeof(type) + sizeof(int));
    } else {
        dprintf("\nBOOT LOG (%d):\t", type);
        for (i = 0; i < numelems; ++i)
            dprintf("%d\t", elems[i]);
        dprintf("\n");
    }
}

