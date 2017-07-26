#include "tasks.h"
#include "util/async_delay.h"
#include "logging.h"
#include "transmission.h"
#include "trains/transit_schedule.h"

struct Data {
  int client, caller, clock_tid, track_tid, transmission_tid;
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
  registerForSensorDown(d->track_tid, d->schedule.train);
  d->control.code = TRANSMIT_TYPE_SET;
  d->control.arg = 10;
  Send(transmission_tid, (char *) &d->control, sizeof(d->control), 0, 0);
}

void conform()
{
	struct Data d;
	initialize(&d);
  while(1){
		Receive(&d.caller, (char *) &d.activ, sizeof(d.activ));
		Reply(d.caller, 0, 0);
    if(d.activ.type == TSMT_SENSOR_DOWN){
      int cur_time = Time(d.clock_tid);
      int error = transit_register_hit(&d.schedule, S_ID(d->activ.data.sensor.sensor), cur_time);
      printf("Train %d is off by %dmm\n\r", d.schedule.train, error);
      if(error > 50 || error < -50){
        d->control.code = TRANSMIT_TYPE_ADJUST;
        d->control.arg = (-1 * error) / 35;
        Send(transmission_tid, (char *) &d->control, sizeof(d->control), 0, 0);
      }
    }
  }
}
