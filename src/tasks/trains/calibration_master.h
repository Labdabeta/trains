#ifndef CALIBRATION_MASTER_H
#define CALIBRATION_MASTER_H

#define NUM_EXTRA_REC 30

#include "trains/sensors.h"

struct cal_record{
	int src;
	int dest;
	int time;
};

typedef struct track_calibration{
	int train, reg_a, reg_b;
	int is_dead[80];
	int length[80]; // Number of possible next sensors
	struct cal_record edge_recs[80][4];
	int num_extra;
	struct cal_record mult_recs[NUM_EXTRA_REC];
} track_calibration;

static inline void init_cal(track_calibration* cal, int train, int reg_a, int reg_b){
	cal->train = train;
	cal->reg_a = reg_a;
	cal->reg_b = reg_b;
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

void set_dead(track_calibration* cal, int id);

void record_edge(track_calibration* cal, int src, int dest, int time);
static inline void edge_rec(track_calibration* cal, char g1, int n1, char g2, int n2, int time)
{
	record_edge(cal, index_sensor(g1, n1), index_sensor(g2, n2), time);
}
void record_mult(track_calibration* cal, int src, int dest, int time);
static inline void mult_rec(track_calibration* cal, char g1, int n1, char g2, int n2, int time)
{
	record_mult(cal, index_sensor(g1, n1), index_sensor(g2, n2), time);
}
int find_time(track_calibration* cal, int src, int dest);

#endif
