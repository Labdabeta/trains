#include "tasks.h"
#include "kernel/interface.h" /* Kernel space breach */
#include "kernel/handlers.h" /* Kernel space breach */

void idle(){
	for (ever) {
        // disable debugging of pass syscall
        (void)asm_callSystemInterrupt(0,0,0,CODE_PASS);
	}
}
