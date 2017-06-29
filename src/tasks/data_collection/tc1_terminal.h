#ifndef TERMINAL_VIEW_H
#define TERMINAL_VIEW_H

typedef enum tc1_ter_code {
	TC1Code_Echo,
	TC1Code_Clear,
	TC1Code_Sensor
} tc1_ter_code;

struct tc1_ter_msg{
	tc1_ter_code code;
	union {
		char c;
		struct {
			int cur_val;
			int prev_velocity;
			int next_val;
			int next_dist;
		} tc1_sensor;
	} data;
};

void tc1_view(void);

#endif
