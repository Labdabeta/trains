#include "calibration_master.h"
#include "trains/path_finder.h"

void record_edge(track_calibration* cal, int src, int dest, int trav_time)
{
	for(int i = 0; i < cal->length[src]; i++){
		if(cal->edge_recs[src][i].dest == dest)
			return;
	}

	struct cal_record *reading = &cal->edge_recs[src][cal->length[src]];
	reading->src = src;
	reading->dest = dest;
	reading->time = trav_time;
	cal->length[src]++;
}

void record_mult(track_calibration* cal, int src, int dest, int trav_time)
{
	struct cal_record *reading;
	for(int i = 0; i < cal->num_extra; i++){
		reading = &cal->mult_recs[i];
		if(reading->src == src && reading->dest == dest)
			return;
	}
	reading = &cal->mult_recs[cal->num_extra];
	reading->src = src;
	reading->dest = dest;
	reading->time = trav_time;
	cal->num_extra++;
}

int find_time(track_calibration* cal, int src, int dest)
{
	if(cal->is_dead[src] || cal->is_dead[dest])
		return -2; // Edge has dead endpoint
	struct cal_record *reading;
	for(int i = 0; i < cal->length[src]; i++){
		reading = &cal->edge_recs[src][i];
		if(reading->dest == dest)
			return reading->time;
	}
	for(int i = 0; i < cal->num_extra; i++){
		reading = &cal->mult_recs[i];
		if(reading->src == src && reading->dest == dest)
			return reading->time;
	}
	return -1; // No record exists
}
