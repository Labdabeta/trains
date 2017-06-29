#include "tc1_terminal.h"
#include "tasks.h"

static inline void tc1_escape_jump(int x, int y)
{
    char movcode[13];
    sprintf(movcode, "\033[%d;%dH", x, y);
    cputstr(movcode);
}

void tc1_prettybox(int x1, int y1, int x2, int y2)
{
    int i;
    tc1_escape_jump( x1, y1+1);
    for(i=0; i < y2-y1 - 1; i++){
        cputc('_');
    }
    for(i=1; i <= x2-x1; i++){
        tc1_escape_jump( x1+i, y1);
        cputc('|');
        tc1_escape_jump( x1+i, y2);
        cputc('|');
    }
    tc1_escape_jump( x2, y1+1);
    for(i=0; i < y2-y1 - 1; i++){
        cputc('_');
    }
}

static void tc1_setup()
{
  cputstr("\033[2J");
  cputstr("\033[?25l");
  escape_jump(3, 27);
  cputstr("TC1");
  prettybox(5, 5, 11, 50);
  escape_jump(7, 8);
  cputstr("Predictid stopping dist:");
  escape_jump(9, 8);
  cputstr(">");
}

void tc1_view()
{
	int past_speed[80];
	for(int i = 0; i < 80; i++){
		past_speed[i] = -1;
	}
	int caller;
	int stopping = 1;

	int dist = 0;
	tc1_setup();
	struct tc1_ter_msg msg;
	while(1){
		Receive(&caller, (char *) &msg, sizeof(struct tc1_ter_msg));
		Reply(caller, 0,0);
		switch(msg.code){
			case TC1Code_Echo:
				escape_jump(13, 10+dist);
				cputc(msg.data.c);
				dist++;
			break;
			case TC1Code_Clear:
				escape_jump(13, 10);
				cputstr("          ");
				dist = 0;
			break;
			case TC1Code_Sensor:
				if(!stopping){
					past_speed[msg.data.tc1_sensor.cur_val] = msg.data.tc1_sensor.prev_velocity;
					if(past_speed[msg.data.tc1_sensor.next_val] != -1){
						int stopping_dist = (past_speed[msg.data.tc1_sensor.next_val]*149-10224) / 100;
						escape_jump(7, 20);
						printf("%d", stopping_dist);
					}
				} else{
					escape_jump(7, 20);
					printf("    ");
				}
			break;
			case TC1Code_Toggle_Stop:
				stopping = !stopping;
			break;
		}
	}
}
