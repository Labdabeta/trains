#include "stop_distance.h"
#include "calibration_master.h"

#if 0
static track_calibration cal_70;
static track_calibration cal_69;
static track_calibration cal_X;
#endif

void initStopDistance(void)
{

}

struct StopOutput getStopDistance(struct RestrictedPath *path, int train)
{
    struct StopOutput ret;
    ret.stopIndex = 0;
    ret.stopTime = 0;

    return ret;
}
