#if 0 /* Service template */
#include <service.h>

struct Data {
	/* Static data here. */
};

ENTRY initialize(struct Data *data)
{
	/* Initialization code here. */
}

ENTRY work(struct Data *data)
{
	/* Work code here. Infinite loop is implicit. */
}

MAKE_SERVICE(name)
#endif


#ifndef SERVICE_H
#define SERVICE_H

/* Use this to ignore a required section of a template. */
#define IGNORED char _unused;
#define ENTRY static inline void

#include "tasks.h"

#define MAKE_SERVICE_LONG(name, d_str, init, work) void name(void) {\
	struct d_str data; \
	Service(); \
	DEBUG_PRINT("Service %s created with tid %d.", #name, MyTid()); \
	init(&data); \
	for (ever) work(&data); \
}

#define MAKE_SERVICE(name) MAKE_SERVICE_LONG(name, Data, initialize, work)

#endif /* SERVICE_H */
