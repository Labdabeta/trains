#include "tasks.h"

#define TOP 1
#define LEFT 1
#define RIGHT 80
#define BOTTOM 46
#define LEFT_MARGIN 3
#define RIGHT_MARGIN 78
#define INPUT_Y 45
#define INPUT_X 16

#define DIVIDER_1 20
#define DIVIDER_2 33
#define DIVIDER_3 42

#define TIMESKIP 10
#define DONE_X 69

#define WHITE 1, 1, 1
#define BLACK 0, 0, 0
#define YELLOW 1, 1, 0
#define GREEN 0, 1, 0

static int cout;

static void clear_screen(void) { Putstr(cout, 2, "\033[2J"); }
static void hide_cursor(void) { Putstr(cout, 2, "\033[?25l"); }
//static void show_cursor(void) { Putstr(cout, 2, "\033[?6l"); }
static void move_cursor(int x, int y)
{
	char str[10] = "\033[";
	int stri = 2;
	if (y >= 10) str[stri++] = '0' + (y / 10);
	str[stri++] = '0' + y % 10;
	str[stri++] = ';';
	if (x >= 10) str[stri++] = '0' + (x / 10);
	str[stri++] = '0' + x % 10;
	str[stri++] = 'H'; str[stri++] = 0;
	Putstr(cout, 2, str);
}

static void set_foreground(int r, int g, int b) { char str[] = "\033[30m"; if (r) str[3] += 1; if (g) str[3] += 2; if (b) str[3] += 4; Putstr(cout, 2, str); }
static void set_background(int r, int g, int b) { char str[] = "\033[40m"; if (r) str[3] += 1; if (g) str[3] += 2; if (b) str[3] += 4; Putstr(cout, 2, str); }
static void set_underline(int u) { Putstr(cout, 2, (u?"\033[24m":"\033[4m")); }
static void reset_format(void) { Putstr(cout, 2, "\033[0m"); }

static void init_display()
{
	int i;
    clear_screen();

    set_foreground(BLACK);
    set_background(WHITE);
    for (i = 2; i < RIGHT; ++i) {
        move_cursor(i, TOP); Putc(cout,2,'-');
        move_cursor(i, DIVIDER_1); Putc(cout,2,'-');
        move_cursor(i, DIVIDER_2); Putc(cout,2,'-');
        move_cursor(i, DIVIDER_3); Putc(cout,2,'-');
        move_cursor(i, BOTTOM); Putc(cout,2,'-');
    }

    for (i = 2; i < BOTTOM; ++i) {
        move_cursor(LEFT, i); Putc(cout,2,'|');
        move_cursor(RIGHT, i); Putc(cout,2,'|');
    }

    for (i = DIVIDER_1+1; i < DIVIDER_2; ++i) {
        move_cursor(40,i); Putstr(cout,2,"||");
    }

    move_cursor(LEFT,TOP); Putc(cout,2,'\\');
    move_cursor(RIGHT,TOP); Putc(cout,2,'/');
    move_cursor(LEFT,BOTTOM); Putc(cout,2,'/');
    move_cursor(RIGHT,BOTTOM); Putc(cout,2,'\\');


    set_foreground(WHITE);
    set_background(BLACK);

    /* Draw the maps */
    move_cursor(LEFT_MARGIN, 3); Putstr(cout,2,"=========?""?===?""?==================     ===<>============<>====<>====<>===");
    move_cursor(LEFT_MARGIN, 4); Putstr(cout,2,"        //   //                  \\\\            //   //                  \\\\");
    move_cursor(LEFT_MARGIN, 5); Putstr(cout,2,"=======?""?   ?""?====?""?========?""?====?""?   ===<>==//   //===<>==<>==<>==<>=<>\\\\");
    move_cursor(LEFT_MARGIN, 6); Putstr(cout,2,"      //   //      \\\\      //      \\\\        //   //      \\\\      //      \\\\");
    move_cursor(LEFT_MARGIN, 7); Putstr(cout,2,"<-A  //   //        \\\\ || //        \\\\ <-A  //   //        v^ || ^v        \\\\");
    move_cursor(LEFT_MARGIN, 8); Putstr(cout,2,"-----|    ||         \\\\||//         || --<>-|    v^         v^||^v         ||");
    move_cursor(LEFT_MARGIN, 9); Putstr(cout,2,"|^        ||          ?""??""?          || |^        ||          \\||/          ||");
    move_cursor(LEFT_MARGIN,10); Putstr(cout,2,"||B       ||   SWI     ||     TCH   || ||B       ||   SEN     ||     SOR   ||");
    move_cursor(LEFT_MARGIN,11); Putstr(cout,2,"|v        ||          ?""??""?          || |v        ||          /||\\          ||");
    move_cursor(LEFT_MARGIN,12); Putstr(cout,2,"-----|    ||         //||\\\\         || --<>-|    ^v         v^||^v         ||");
    move_cursor(LEFT_MARGIN,13); Putstr(cout,2,"<-A  \\\\   \\\\        // || \\\\        // <-A  \\\\   \\\\        v^ || ^v        //");
    move_cursor(LEFT_MARGIN,14); Putstr(cout,2,"      \\\\   \\\\      //      \\\\      //        \\\\   \\\\      //      \\\\      //");
    move_cursor(LEFT_MARGIN,15); Putstr(cout,2,"=======?""?   ?""?====?""?========?""?====?""?   =<>=<>=\\\\   \\\\===<>==<>==<>==<>=<>//");
    move_cursor(LEFT_MARGIN,16); Putstr(cout,2,"        \\\\   \\\\                  //            \\\\   ^v                  v^");
    move_cursor(LEFT_MARGIN,17); Putstr(cout,2,"=========?""?   ?""?================?""?     =<>=<>===\\\\   \\\\==<>========<>==v^");
    move_cursor(LEFT_MARGIN,18); Putstr(cout,2,"          \\\\   \\\\              //                \\\\   \\\\              //");
    move_cursor(LEFT_MARGIN,19); Putstr(cout,2,"===========?""?===?""?============?""?====== =<>=<>=======<>==================<>===");

    set_underline(1);
    move_cursor(39, TOP+1); Putstr(cout,2,"Maps");
    move_cursor(17, DIVIDER_1+1); Putstr(cout,2,"Switches");
    move_cursor(58, DIVIDER_1+1); Putstr(cout,2,"Sensor");
    move_cursor(38, DIVIDER_2+1); Putstr(cout,2,"Active");
    move_cursor(38, DIVIDER_3+1); Putstr(cout,2,"Inputs");

    move_cursor(INPUT_X - 2, INPUT_Y);
    set_underline(0);
    set_foreground(YELLOW);
    Putstr(cout,2,"> _");

    set_foreground(BLACK);
    set_background(YELLOW);
    move_cursor(LEFT_MARGIN, 22); Putstr(cout,2," 1:");
    move_cursor(LEFT_MARGIN, 23); Putstr(cout,2," 2:");
    move_cursor(LEFT_MARGIN, 24); Putstr(cout,2," 3:");
    move_cursor(LEFT_MARGIN, 25); Putstr(cout,2," 4:");
    move_cursor(LEFT_MARGIN, 26); Putstr(cout,2," 5:");
    move_cursor(LEFT_MARGIN, 27); Putstr(cout,2," 6:");
    move_cursor(LEFT_MARGIN, 28); Putstr(cout,2," 7:");
    move_cursor(LEFT_MARGIN, 29); Putstr(cout,2," 8:");
    move_cursor(LEFT_MARGIN, 30); Putstr(cout,2," 9:");
    move_cursor(LEFT_MARGIN, 31); Putstr(cout,2,"10:");
    move_cursor(LEFT_MARGIN, 32); Putstr(cout,2,"11:");

    move_cursor(36, 22); Putstr(cout,2,":12");
    move_cursor(36, 23); Putstr(cout,2,":13");
    move_cursor(36, 24); Putstr(cout,2,":14");
    move_cursor(36, 25); Putstr(cout,2,":15");
    move_cursor(36, 26); Putstr(cout,2,":16");
    move_cursor(36, 27); Putstr(cout,2,":17");
    move_cursor(36, 28); Putstr(cout,2,":18");
    move_cursor(36, 29); Putstr(cout,2,":99");
    move_cursor(36, 30); Putstr(cout,2,":9A");
    move_cursor(36, 31); Putstr(cout,2,":9B");
    move_cursor(36, 32); Putstr(cout,2,":9C");

    reset_format();
    hide_cursor();

}

void view()
{
	int i;
	//int clock = WhoIs("CLOCK");
	cout = WhoIs("COUT");
	int cin = WhoIs("CIN");

	printf("Enter what you want...\n\r");
	for (;;) {
		int ch = Getc(cin, 2);
		Putc(cout, 2, ch);
	}

	Exit();
}
#if 0
	Create(4, model);



	int cout = WhoIs("COUT");
	int cin = WhoIs("CIN");
	int tout = WhoIs("TOUT");
	int tin = WhoIs("TIN");
	int clock = WhoIs("CLOCK");
	printf("Cout is: %d\n\rCin is: %d\n\r", cout, cin);
	printf("Tout is: %d\n\rTin is: %d\n\r", tout, tin);
	Delay(clock, 10);

	printf("Got: %d\n\r", Getc(cin, 2));
	Putc(tout, 1, 193);
	printf("Sensor: %d\n\r", Getc(tin, 1));

	while (1) {
		int ch = Getc(cin, 2);
		if (ch == 's') break;
		Putc(cout, 2, ch);
	}

	Delay(clock, 100);
	Exit();
}
#endif
