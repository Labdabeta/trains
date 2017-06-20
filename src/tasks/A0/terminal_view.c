#include "terminal_view.h"
#include "A0_model.h"

#define MOVE(X, Y) "\033[" #X ";" #Y "H"

// These are coordinate flipped (y == horizontal, x == vertical)
static inline void escape_jump(int x, int y){
	char movcode[13];
	sprintf(movcode, "\033[%d;%dH", x, y);
	cputstr(movcode);
}

void prettybox(int x1, int y1, int x2, int y2){
	int i;
	escape_jump( x1, y1+1);
	for(i=0; i < y2-y1 - 1; i++){
		cputc('_');
	}
	for(i=1; i <= x2-x1; i++){
		escape_jump( x1+i, y1);
		cputc('|');
		escape_jump( x1+i, y2);
		cputc('|');
	}
	escape_jump( x2, y1+1);
	for(i=0; i < y2-y1 - 1; i++){
		cputc('_');
	}
}


void setup_t(void){
	cputstr("\033[2J");
	cputstr("\033[?25l");
	prettybox(3, 3, 26, 46);
	prettybox(3, 46, 26, 68);
	escape_jump( 2,18);
	cputstr("\033[31m");
	cputstr("Taggart Transcontinental Control Console");
	cputstr("\033[37m");
	escape_jump( 23,5);
	cputstr(">");
	escape_jump( 6,6);
	cputstr("_____v______v_______________________");
	escape_jump( 7,6);
	cputstr("    /      /                        \\");
	escape_jump( 8,6);
	cputstr("___<      >______v_________v______   \\");
	escape_jump( 9,6);
	cputstr("  /      /        \\       /       \\  |");
	escape_jump( 10,6);
	cputstr("_/      /          \\  |  /         \\ |");
	escape_jump( 11,6);
	cputstr("       /            \\ | /           \\|");
	escape_jump( 12,6);
	cputstr("      |               >              <");
	escape_jump( 13,6);
	cputstr("      |               |              |");
	escape_jump( 14,6);
	cputstr("      |               <              <");
	escape_jump( 15,6);
	cputstr("__     \\            / | \\           /|");
	escape_jump( 16,6);
	cputstr("  \\     \\          /  |  \\         / |");
	escape_jump( 17,6);
	cputstr("___<     >________^_______^_______/  |");
	escape_jump( 18,6);
	cputstr("    \\     \\                         /");
	escape_jump( 19,6);
	cputstr("_____<     \\___v_____________v_____/");
	escape_jump( 20,6);
	cputstr("      \\         \\           /");
	escape_jump( 21,6);
	cputstr("_______^_________^_________^________");
	escape_jump( 4,6);
	cputstr("Time:");
	escape_jump( 4,48);
	cputstr("Recent activations:");
	int caller;
	Receive(&caller, 0, 0);
	Reply(caller, 0, 0);
}

void echo_view_t(){
	int userlen = 0;
	int caller;
	char c;
	int out_tid = WhoIs("COUT");
	char clear[] = "                                     ";

	while(1){
		Receive(&caller, &c, 1);
		Reply(caller, 0, 0);
		if(c == '\r'){
			escape_jump( 23, 7);
			Putstr(out_tid, 2, clear);
			escape_jump( 25, 5);
			Putstr(out_tid, 2, clear);
			userlen = 0;
		} else{
			escape_jump( 23, 7 + userlen);
			Putc(out_tid, 2, c);
			userlen++;
		}
	}
}

void flip_view_t(){
	char curvedchars[]   = " <<^<^vv<<vvvv>>^^^";
	char straightchars[] = " ^^<v>><v^<<<>^v><<";

	int xpos[21];
	xpos[1] = 12; xpos[2] = 14; xpos[3] = 16; xpos[4] = 3; xpos[5] = 16; xpos[6] = 14; xpos[7] = 14;
	xpos[8] = 9; xpos[9] = 7;  xpos[10] = 3; xpos[11] = 1; xpos[12] = 1; xpos[13] = 3; xpos[14] = 3;
	xpos[15] = 12; xpos[16] = 12; xpos[17] = 12; xpos[18] = 16;  xpos[19] = 9; xpos[20] = 7;

	int ypos[21];
	ypos[1] = 4; ypos[2] = 6; ypos[3] = 8; ypos[4] = 4; ypos[5] = 28; ypos[6] = 16; ypos[7] = 30;
	ypos[8] = 38; ypos[9] = 38;  ypos[10] = 28; ypos[11] = 13; ypos[12] = 6; ypos[13] = 18; ypos[14] = 11;
	ypos[15] = 10; ypos[16] = 19; ypos[17] = 27; ypos[18] = 18;  ypos[19] = 23; ypos[20] = 23;

	char switchstates[23];
	for (int i = 0; i < 23; ++i)
		switchstates[i] = '?';

	int caller;
	char first, second;
	char msg[2];
	int out_tid = WhoIs("COUT");

	while(1){
		Receive(&caller, msg, 2);
		Reply(caller, 0, 0);

		if(msg[0] < 19){
			escape_jump( xpos[(int) msg[0]] + 5, ypos[(int) msg[0]] + 5);
			msg[1] = msg[1] == 'S' ? straightchars[(int) msg[0]] : curvedchars[(int) msg[0]];
		} else{
			if(msg[0] == 19 || msg[0] == 22){
				first = switchstates[19];
				second = switchstates[22];
				escape_jump( xpos[19] + 5, ypos[19] + 5);
			} else{
				first = switchstates[21];
				second = switchstates[20];
				escape_jump( xpos[20] + 5, ypos[20] + 5);
			}

			if(first == '?' || second == '?'){
				msg[1] = '?';
			} else if(first == 'S'){
				if(second == 'S'){
					msg[1] = '|';
				} else{
					msg[1] = '>';
				}
			} else{
				if(second == 'S'){
					msg[1] = '<';
				} else{
					msg[1] = '?';
				}
			}
		}
		Putc(out_tid, 2, msg[1]);
	}
}

void sensor_view_t(void){
	int userheight = 0;
	int caller;
	char msg[2];
	while(1){
		Receive(&caller, msg, 2);
		Reply(caller, 0, 0);
		for(int i = 0; i <= 7; i++){
			if(msg[1] & (1 << (7-i)) ){
				char buf[40];
				sprintf(buf, "\033[%d;48H%c%d    \033[%d;48H------",
						6 + userheight, 'A' + (msg[0] / 2), 1 + i + (msg[0] % 2)*8,
						6 + ((userheight + 1) % 20));
				userheight = (userheight + 1) % 20;
				cputstr(buf);
			}
		}
	}
}

void time_view_t(){
	int curtime;
	int hr, min, sec, msec;
	char str[24];
	hr=min=sec=msec=0;
	int clock_tid = WhoIs("CLOCK");
	while(1){
		Delay(clock_tid, 1);
		curtime = Time(clock_tid);
		msec = curtime % 100;
		curtime /= 100;
		sec = curtime % 60;
		curtime /= 60;
		min = curtime % 60;
		hr = curtime / 60;
		sprintf(str, MOVE(4, 13) "%04d:%02d:%02d:%02d", hr, min, sec, msec);
		cputstr(str);
	}
}
