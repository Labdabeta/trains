#include "conio.h"

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <termios.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>

struct termios local_tty;
struct termios local_tty_old;
struct termios com2_tty;
struct termios com2_tty_old;
int com2;

static void initCom2(void)
{
    com2 = open("/dev/ttyS0", O_RDWR | O_NOCTTY);

    memset(&com2_tty, 0, sizeof(com2_tty));

    if (tcgetattr(com2, &com2_tty))
        printf("Error %d from tcgetattr: %s\n", errno, strerror(errno));

    com2_tty_old = com2_tty;

    /* Set Baud Rate */
    cfsetospeed(&com2_tty, (speed_t)B115200);
    cfsetispeed(&com2_tty, (speed_t)B115200);

    /* Set other info */
    com2_tty.c_cflag &= ~PARENB & ~CSTOPB & ~CSIZE & ~CRTSCTS;
    com2_tty.c_cflag |= CS8;

    com2_tty.c_cc[VMIN] = 1;
    com2_tty.c_cc[VTIME] = 5;
    com2_tty.c_cflag |= CREAD | CLOCAL;

    cfmakeraw(&com2_tty);

    tcflush(com2, TCIFLUSH);

    if (tcsetattr(com2, TCSANOW, &com2_tty))
        printf("Error %d from tcsetattr: %s\n", errno, strerror(errno));

    /* Make read nonblocking */
    if (fcntl(com2, F_SETFL, FNDELAY))
        printf("Error %d from fcntl: %s\n", errno, strerror(errno));
}

static void initLocal(void)
{
    if (tcgetattr(0, &local_tty))
        printf("Error %d from tcgetattr: %s\n", errno, strerror(errno));

    local_tty_old = local_tty;

    cfmakeraw(&local_tty);

    if (tcsetattr(0, TCSANOW, &local_tty))
        printf("Error %d from tcsetattr: %s\n", errno, strerror(errno));
}

void initTerminals(void)
{
    initCom2();
    initLocal();
}

void quitTerminals(void)
{
    if (tcsetattr(0, TCSANOW, &local_tty_old))
        printf("Error %d from tcsetattr: %s\n", errno, strerror(errno));
    if (tcsetattr(com2, TCSANOW, &com2_tty_old))
        printf("Error %d from tcsetattr: %s\n", errno, strerror(errno));
}

int local_getc(void)
{
    struct timeval tv = {0};
    unsigned char ret;
    fd_set fds;
    FD_ZERO(&fds);
    FD_SET(0, &fds);
    if (!select(1, &fds, NULL, NULL, &tv))
        return -1;

    if (read(0, &ret, sizeof(ret)) < 0) {
        printf("Error %d from read: %s\n", errno, strerror(errno));
        return 0;
    }

    return (int)ret;
}

int com2_getc(void)
{
    unsigned char rd;
    int n = read(com2, &rd, sizeof(rd));

    if (n < 0)
        return -1;

    return rd;
}

void com2_putc(char x)
{
    write(com2, &x, sizeof(x));
}

