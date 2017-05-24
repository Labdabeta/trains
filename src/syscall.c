#include "syscall.h"
#include "interface.h" /* Kernel space breach */
#include "handlers.h" /* Kernel space breach */

#include "debugio.h"

void Exit(void)
{
    (void)callSystemInterrupt(0,0,0,CODE_EXIT);
}
