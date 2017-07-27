#include "tasks.h"
#include "util/async_delay.h"
#include "logging.h"
#include "transmission.h"
#include "trains/transit_schedule.h"
#include "track_server.h"

#define grace_period 250

struct Data {
  int client, caller, clock_tid, track_tid, transmission_tid, quit_id, slow_id;
  struct TransitSchedule schedule;
  struct TrackServerMessage activ, timeout;
  struct TransmitMessage control;
};

static inline void initialize(struct Data *d)
{
  d->clock_tid = WhoIs("CLOCK");
  d->track_tid = WhoIs("TRACK");
  d->timeout.type = TSMT_NONE;
  Receive(&d->client, (char *) &d->transmission_tid, sizeof(d->transmission_tid));
	Reply(d->client, 0, 0);
  Receive(&d->client, (char *) &d->schedule, sizeof(d->schedule));
	Reply(d->client, 0, 0);
	Receive(&d->client, (char *) &d->quit_id, sizeof(d->quit_id));
	Reply(d->client, 0, 0);
	Receive(&d->client, (char *) &d->slow_id, sizeof(d->slow_id));
	Reply(d->client, 0, 0);
  registerForSensorDown(d->track_tid, d->schedule.train);
  d->control.code = TRANSMIT_TYPE_SET;
  d->control.arg = 10;
  Send(d->transmission_tid, (char *) &d->control, sizeof(d->control), 0, 0);
	d->control.code = TRANSMIT_TYPE_ADJUST;
}

void conform()
{
	struct Data d;
	initialize(&d);
	printf("Beginning to conform\n\r");
  while(1){
		Receive(&d.caller, (char *) &d.activ, sizeof(d.activ));
		Reply(d.caller, 0, 0);
    if(d.activ.type == TSMT_SENSOR_DOWN){
      int cur_time = Time(d.clock_tid);
      int error = transit_register_hit(&d.schedule, S_ID(d.activ.data.sensor.sensor), cur_time);
			int velocity = transit_vel_from(&d.schedule, 1);
			struct RestrictedPath *path = &d.schedule.route;
			int pathIdx = d.schedule.last_ind + 1;
			for (int i = 0; i < SWITCH_MAX; ++i)
				if (IS_CURVED(path->masks[pathIdx], i))
					notifySwitch(d.track_tid, i, IS_CURVED(path->states[pathIdx], i));
			pathIdx = (d.schedule.last_ind + 1) %  d.schedule.route.length + 1;
			for (int i = 0; i < SWITCH_MAX; ++i)
				if (IS_CURVED(path->masks[pathIdx], i))
					notifySwitch(d.track_tid, i, IS_CURVED(path->states[pathIdx], i));
			if(S_ID(d.activ.data.sensor.sensor) == d.slow_id){
				printf("Slowing\n\r");
				d.control.code = TRANSMIT_TYPE_SET;
				d.control.arg = 8;
				Send(d.transmission_tid, (char *) &d.control, sizeof(d.control), 0, 0);
			} else if(S_ID(d.activ.data.sensor.sensor) == d.quit_id){
				printf("Stopping\n\r");
				d.control.code = TRANSMIT_TYPE_SET;
				d.control.arg = 0;
				Send(d.transmission_tid, (char *) &d.control, sizeof(d.control), 0, 0);
				Exit();
			} else{
	      printf("Ind: %d. Train %d is off by %dmm. Velocity: %d\n\r", d.schedule.last_ind, d.schedule.train, error, velocity);
				velocity = velocity - d.schedule.target_velocity;
				int abs_err = (error < 0) ? -error : error;
				int permissible_bound = (abs_err <= 40) ? 20 :
					((abs_err <= 100) ? 50 : ((abs_err <= 300) ? 100 : 150));
				if(error > 50 && velocity > -permissible_bound){
					d.control.arg = -permissible_bound / 50;
					Send(d.transmission_tid, (char *) &d.control, sizeof(d.control), 0, 0);
				} else if(error < -50 && velocity < permissible_bound){
					d.control.arg = permissible_bound / 50;
					Send(d.transmission_tid, (char *) &d.control, sizeof(d.control), 0, 0);
				} else {
					int velocity = transit_vel_from(&d.schedule, 2) - d.schedule.target_velocity;
					if(velocity > permissible_bound || velocity < -permissible_bound){
						d.control.arg = (velocity > 0) ? -1 : 1;
						Send(d.transmission_tid, (char *) &d.control, sizeof(d.control), 0, 0);
					}
				}
			}
    }
  }
}

int backtrace(struct TransitSchedule *ts, int fixed_ind, int cur_time, int cycle_time)
{
	init_schedule_times(ts, 0, grace_period, 420);
	printf("We're trying top get the t0 of the spoke when 24 is at %c%d\n\r", S_PRINT(ts->route.sensors[fixed_ind]));
	int time_offset = ts->expected_times[fixed_ind];
	int multiple = (cur_time + time_offset + cycle_time - 1) / cycle_time;
	return multiple * cycle_time - time_offset - cur_time; // Delay
}

void publicTrain()
{
  int tramsmission_tid = CreateSize(2, transmission, TASK_SIZE_TINY);
	int train, index, client;
	Receive(&client, (char *) &train, sizeof(int));
	Reply(client, 0, 0);
	Receive(&client, (char *) &index, sizeof(int));
  int init_speed = 0;
	int quit_id = -1;
	int slow_id = -1;
	Send(tramsmission_tid, (char *) &train, sizeof(train), 0, 0);
	Send(tramsmission_tid, (char *) &init_speed, sizeof(init_speed), 0, 0);
  struct TransitSchedule ts;
  struct RestrictedPath part;
  struct Restrictions no_restrictions;
  for (int i = 0; i < TRACK_MAX; ++i) {
		no_restrictions.isEnabled[i] = 1;
	}
	int route_segemnts[3] =
		{S_INDEX('B', 6), S_INDEX('B', 1), S_INDEX('B', 6)};
  findRestrictedPath(route_segemnts[0], route_segemnts[1], &no_restrictions, &ts.route);
	for(int j = 2; j < 3; j++){
		findRestrictedPath(route_segemnts[j-1], route_segemnts[j], &no_restrictions, &part);
	  restrictedPathAppend(&ts.route, &part);
	}
  ts.train = train;
  init_schedule_times(&ts, index, grace_period, 420);
	int cycle_time = ts.expected_times[index] - grace_period;
	Reply(client, (char *) &cycle_time, sizeof(int));
  int conform_tid = CreateSize(2, conform, TASK_SIZE_TINY);
  Send(conform_tid, (char *) &tramsmission_tid, sizeof(tramsmission_tid), 0, 0);
  Send(conform_tid, (char *) &ts, sizeof(ts), 0, 0);
	Send(conform_tid, (char *) &quit_id, sizeof(quit_id), 0, 0);
	Send(conform_tid, (char *) &quit_id, sizeof(slow_id), 0, 0);
}

void privateTrain()
{
  int tramsmission_tid = CreateSize(2, transmission, TASK_SIZE_TINY);
	int train, init_id, final_id, quit_id, slow_id, cycle_time, client;
	Receive(&client, (char *) &train, sizeof(int));
	Reply(client, 0, 0);
	Receive(&client, (char *) &init_id, sizeof(int));
	Reply(client, 0, 0);
	Receive(&client, (char *) &final_id, sizeof(int));
	Reply(client, 0, 0);
	Receive(&client, (char *) &cycle_time, sizeof(int));
	Reply(client, 0, 0);
  int init_speed = 0;
	Send(tramsmission_tid, (char *) &train, sizeof(train), 0, 0);
	Send(tramsmission_tid, (char *) &init_speed, sizeof(init_speed), 0, 0);
  struct TransitSchedule ts;
  struct RestrictedPath part;
  struct Restrictions no_restrictions;
  for (int i = 0; i < TRACK_MAX; ++i) {
		no_restrictions.isEnabled[i] = 1;
	}
	int route_segemnts[4] =
		{0, S_INDEX('C', 7), S_INDEX('E', 8), 0};
	route_segemnts[0] = init_id;
	route_segemnts[3] = final_id;
  findRestrictedPath(route_segemnts[0], route_segemnts[1], &no_restrictions, &ts.route);
	int init_len = ts.route.length;
	for(int j = 2; j < 4; j++){
		printf("Path seg: %c%d to %c%d\n\r", SID_PRINT(route_segemnts[j-1]), SID_PRINT(route_segemnts[j]));
		findRestrictedPath(route_segemnts[j-1], route_segemnts[j], &no_restrictions, &part);
	  restrictedPathAppend(&ts.route, &part);
	}
	quit_id = S_ID(ts.route.sensors[ts.route.length - 2]);
	slow_id = S_ID(ts.route.sensors[ts.route.length - 3]);
  ts.train = train;
	int clock_tid = WhoIs("CLOCK");
	int delay = backtrace(&ts, init_len + 1, Time(clock_tid), cycle_time);
	Delay(clock_tid, delay);
  init_schedule_times(&ts, 0, Time(clock_tid) + grace_period, 420);
  int conform_tid = CreateSize(2, conform, TASK_SIZE_TINY);
  Send(conform_tid, (char *) &tramsmission_tid, sizeof(tramsmission_tid), 0, 0);
  Send(conform_tid, (char *) &ts, sizeof(ts), 0, 0);
	Send(conform_tid, (char *) &quit_id, sizeof(quit_id), 0, 0);
	Send(conform_tid, (char *) &slow_id, sizeof(quit_id), 0, 0);
}
