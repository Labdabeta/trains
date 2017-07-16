#ifndef CALIBRATION_MASTER_H
#define CALIBRATION_MASTER_H

#define NUM_EXTRA_REC 30

struct cal_record{
	int src;
	int dest;
	int time;
};

typedef struct track_calibration{
	int is_dead[80];
	int length[80]; // Number of possible next sensors
	struct cal_record edge_recs[80][4];
	int num_extra;
	struct cal_record mult_recs[NUM_EXTRA_REC];
} track_calibration;

static inline void init_cal(track_calibration* cal){
	for(int i = 0; i < 80; i++){
		cal->is_dead[i] = 0;
		cal->length[i] = 0;
	}
	cal->num_extra = 0;
}

static inline int is_dead(track_calibration* cal, int id)
{
	return cal->is_dead[id];
}

static inline void set_dead(track_calibration* cal, int id)
{
	cal->is_dead[id] = 1;
}

void record_edge(track_calibration* cal, int src, int dest, int time);
void record_mult(track_calibration* cal, int src, int dest, int time);
int find_time(track_calibration* cal, int src, int dest);

#endif
