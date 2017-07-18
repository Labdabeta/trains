#include "stop_distance.h"

struct Movement makeMovement(struct RestrictedPath *path, int train)
{
    struct Movement mov;
    mov.path = *path;
    mov.stopIndex = 0;
    mov.stopTime = 0;
#warning TODO: Implement reads from calibration to figure out smarter values

    return mov;
}
