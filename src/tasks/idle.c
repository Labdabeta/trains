#include "tasks.h"
#include "debugio.h"

void idle(){
	DEBUG_PRINT("Idle enter!");
	while(1)
		Pass();
}
