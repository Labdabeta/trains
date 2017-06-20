#include "tasks.h"
#include "linker.h"
#include "tout_server.h"

static int _cout_tid;
static int _tout_tid;
static int _cin_tid;
static int _tin_tid;
char cgetc(void) { return Getc(_cin_tid, 2); }
char tgetc(void) { return Getc(_tin_tid, 1); }
void cputc(char ch) { Putc(_cout_tid, 2, ch); }
void cputstr(char *str) { Putstr(_cout_tid, 2, str); }
void tputc(char ch) { Putc(_tout_tid, 1, ch); }
void tput2(char a, char b) { sendToutBytePair(_tout_tid, a, b); }
void printf_putc(void *unused, char ch) { (void)unused; cputc(ch); }

void main_task(void)
{
	CreateSize(2, name_server, TASK_SIZE_NORMAL);

	CreateSize(2, clock_server, TASK_SIZE_TINY);
	while (WhoIs("CLOCK") < 0)
		Pass();

	_cin_tid = CreateSize(2, cin_server, TASK_SIZE_TINY);
	while (WhoIs("CIN") < 0)
		Pass();

	_cout_tid = CreateSize(0, cout_server, TASK_SIZE_NORMAL);
	while (WhoIs("COUT") < 0)
		Pass();

	init_printf(0, fn_ptr(printf_putc));

	_tin_tid = CreateSize(2, tin_server, TASK_SIZE_TINY);
	while (WhoIs("TIN") < 0)
		Pass();

	_tout_tid = CreateSize(2, tout_server, TASK_SIZE_TINY);
	while (WhoIs("TOUT") < 0)
		Pass();

	//Create(1, A0_controller);
	Create(1, test_controller);

  //Create(1, hello);
	Exit();
}
