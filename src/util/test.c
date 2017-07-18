#include "trains/path_finder.h"
#include <stdio.h>

int main(int argc, char *argv[])
{
    struct Restrictions r = {0};
    struct RestrictedPath p;
    printf("%d\n", findRestrictedPath(1, 2, &r, &p));

    return 0;
}
