#ifndef LINKER_H
#define LINKER_H

extern char CODE_BASE;

#include "stdlib.h"

#ifndef REMOTE
#define fn_ptr(x) (x + (int)(&CODE_BASE))
#else
#define fn_ptr(x) x
#include <stdlib.h>
#endif


// gcc provides a stack-based alloc implementation
#define alloc(x) __builtin_alloca(x)

#endif /* LINKER_H */
