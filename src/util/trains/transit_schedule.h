#ifndef TRANSIT_SCHEDULE_H
#define TRANSIT_SCHEDULE_H

#include "path_finder.h"

struct TransitSchedule{
  struct RestrictedPath route; //Must begin and end at the same point
  int expected_times[MAX_PATH_LENGTH];
  int observed_times[MAX_PATH_LENGTH];
  int target_velocity;
  int last_ind;
  int train;
};

void init_schedule_times(struct TransitSchedule *ts, int last_ind, int last_time, int velocity);

// register_hit returns the distance deviation
int transit_register_hit(struct TransitSchedule *ts, int sensor_id, int time);

int transit_vel_from(struct TransitSchedule *ts, int num);

void printSchedule(struct TransitSchedule *ts);

#endif
