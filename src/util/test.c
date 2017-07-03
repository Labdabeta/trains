#include "trains/path_finder.h"
#include <stdio.h>

int main(int argc, char *argv[])
{
    struct TrackPath path;
    struct PathSwitchPositions switches;
    init_tracka();
    printf("Pathlength: %d\n", findPath(10, 20, &path, &switches));

    return 0;
}
