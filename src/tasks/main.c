#include "tasks.h"
#include "linker.h"
#include "tout_server.h"
#include "trains/track_server.h"
#include "gui.h"
#include "parse_server.h"
#include "trains/hotel.h"
#include "trains/routing.h"
#include "string.h"
#include "logging.h"
#include "trains/transmission.h"

void gui(void);
void conductor(void);
void publicTrain(void);
void privateTrain(void);

static int _cout_tid;
static int _tout_tid;
static int _cin_tid;
static int _tin_tid;
char cgetc(void) { return Getc(_cin_tid, 2); }
char tgetc(void) { return Getc(_tin_tid, 1); }
void cputc(char ch) { Putc(_cout_tid, 2, ch); }
void cputstr(char *str) { Putstr(_cout_tid, 2, str, strlen(str)); }
void cputbuf(char *buf, int bufsize) { Putstr(_cout_tid, 2, buf, bufsize); }
void tputc(char ch) { Putc(_tout_tid, 1, ch); }
void tput2(char a, char b) { sendToutBytePair(_tout_tid, a, b); }
void printf_putc(void *unused, char ch) { (void)unused; cputc(ch); }

void main_task(void)
{
	CreateSize(2, name_server, TASK_SIZE_NORMAL);

	int clock_tid = CreateSize(2, clock_server, TASK_SIZE_TINY);
	while (WhoIs("CLOCK") < 0)
		Pass();

	_cin_tid = CreateSize(2, cin_server, TASK_SIZE_BIG);
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

    int track_tid = CreateSize(3, track_server, TASK_SIZE_NORMAL);
    while (WhoIs(TRACK_SERVER_NAME) < 0)
        Pass();

#ifdef TRACK_a
		init_tracka();
#else
		init_trackb();
#endif

    CreateSize(2, gui, TASK_SIZE_SMALL);
    while (WhoIs(GUI_SERVER_NAME) < 0)
        Pass();

    _log_enabled = 1;

    CreateSize(2, parse_server, TASK_SIZE_NORMAL);
    while (WhoIs(PARSE_SERVER_NAME) < 0)
        Pass();


#endif
		int train, index, child, cycle_time;
		train = 74;
		insertTrain(track_tid, train, S_MAKE(C, 10));
		index = 4;
    child = Create(1, publicTrain);
		Send(child, (char *) &train, sizeof(int), 0, 0);
		Send(child, (char *) &index, sizeof(int), (char *) &cycle_time, sizeof(int));
		train = 70;
		insertTrain(track_tid, train, S_MAKE(C, 12));
		index = 1;
    child = Create(1, publicTrain);
		Send(child, (char *) &train, sizeof(int), 0, 0);
		Send(child, (char *) &index, sizeof(int), (char *) &cycle_time, sizeof(int));
		train = 76;
		insertTrain(track_tid, train, S_MAKE(B, 9));
		Delay(clock_tid, 3000);
		int init_id = S_INDEX('B', 9);
		int final_id = S_INDEX('A', 15);
		child = Create(1, privateTrain);
		Send(child, (char *) &train, sizeof(int), 0, 0);
		Send(child, (char *) &init_id, sizeof(int), 0, 0);
		Send(child, (char *) &final_id, sizeof(int), 0, 0);
		Send(child, (char *) &cycle_time, sizeof(int), 0, 0);

	Exit();
}
