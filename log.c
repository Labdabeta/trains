/* Prints the logs generated DEBUG_PRINT */
#define LOG_BASE 0x50000

int main(int argc, char *argv[])
{
    char *c;
    *(int*)0x800b0014 = 0xFFFFFFFF;
    *(int*)0x800c0014 = 0xFFFFFFFF;
    *(int*)0x808d0008 &= ~(0x10);

    for (c = (char*)LOG_BASE; *c; c = (char*)((int)c + 1)) {
        while (((*(int*)0x808d0014) & 0x20));
        (*(int*)0x808d0000) = (int)*c;
    }

    return 0;
}
