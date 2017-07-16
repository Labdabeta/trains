#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <termios.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>

struct termios com2_tty;
struct termios com2_tty_old;
int com2;

#define ERROR_MSG_MAX 1000
char errormsg[ERROR_MSG_MAX];

const char *initCom2(const char *fname)
{
    com2 = open(fname, O_RDWR | O_NOCTTY);

    memset(&com2_tty, 0, sizeof(com2_tty));

    if (tcgetattr(com2, &com2_tty)) {
        sprintf(errormsg, "Error %d from tcgetattr: %s", errno, strerror(errno));
        return errormsg;
    }

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

    if (tcsetattr(com2, TCSANOW, &com2_tty)) {
        sprintf(errormsg, "Error %d from tcsetattr: %s", errno, strerror(errno));
        return errormsg;
    }

    /* Make read nonblocking */
    if (fcntl(com2, F_SETFL, FNDELAY)) {
        sprintf(errormsg, "Error %d from fcntl: %s", errno, strerror(errno));
        return errormsg;
    }

    return NULL;
}

const char *quitTerminals(void)
{
    if (tcsetattr(com2, TCSANOW, &com2_tty_old)) {
        sprintf(errormsg, "Error %d from tcsetattr: %s", errno, strerror(errno));
        return errormsg;
    }
    return NULL;
}

int com2_getc(void)
{
    unsigned char rd;
    int n = read(com2, &rd, sizeof(rd));

    if (n < 0)
        return -1;

    putchar(rd);
    return rd;
}

void com2_putc(char x)
{
    putchar(x);
    write(com2, &x, sizeof(x));
}

