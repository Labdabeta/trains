#include "tasks.h"
#include "debugio.h"

void test0(void) { int i; for (i = 0; i < 10; ++i) { DEBUG_PRINT(__PRETTY_FUNCTION__); Pass(); } Exit(); }
void test1(void) { int i; for (i = 0; i < 10; ++i) { DEBUG_PRINT(__PRETTY_FUNCTION__); Pass(); } Exit(); }
void test2(void) { int i; for (i = 0; i < 10; ++i) { DEBUG_PRINT(__PRETTY_FUNCTION__); Pass(); } Exit(); }
void test3(void) { int i; for (i = 0; i < 10; ++i) { DEBUG_PRINT(__PRETTY_FUNCTION__); Pass(); } Exit(); }
void test4(void) { int i; for (i = 0; i < 10; ++i) { DEBUG_PRINT(__PRETTY_FUNCTION__); Pass(); } Exit(); }
void test5(void) { int i; for (i = 0; i < 10; ++i) { DEBUG_PRINT(__PRETTY_FUNCTION__); Pass(); } Exit(); }
void test6(void) { int i; for (i = 0; i < 10; ++i) { DEBUG_PRINT(__PRETTY_FUNCTION__); Pass(); } Exit(); }
void test7(void) { int i; for (i = 0; i < 10; ++i) { DEBUG_PRINT(__PRETTY_FUNCTION__); Pass(); } Exit(); }
void test8(void) { int i; for (i = 0; i < 10; ++i) { DEBUG_PRINT(__PRETTY_FUNCTION__); Pass(); } Exit(); }


void main_task(void)
{
	int tid0 = Create(0, test0); DEBUG_DUMP_VAL(tid0);
	int tid1 = Create(1, test1); DEBUG_DUMP_VAL(tid1);
	int tid2 = Create(2, test2); DEBUG_DUMP_VAL(tid2);
	int tid3 = Create(3, test3); DEBUG_DUMP_VAL(tid3);
	int tid4 = Create(4, test4); DEBUG_DUMP_VAL(tid4);
	int tid5 = Create(5, test5); DEBUG_DUMP_VAL(tid5);
	int tid6 = Create(6, test6); DEBUG_DUMP_VAL(tid6);
	int tid7 = Create(7, test7); DEBUG_DUMP_VAL(tid7);
	int tid8 = Create(8, test8); DEBUG_DUMP_VAL(tid8);
	Pass();
	DEBUG_PRINT("Main exiting.");
	Exit();
}
