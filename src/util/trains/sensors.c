#include "trains/sensors.h"

static int isA;

void setSensorTrack(int a) { isA = a; }

struct Sensor getPrevSensor(struct Sensor src, switch_state switches)
{
    if (src.group == SG_N) return src;
    switch (src.group) {
        default: return src;
        case SG_A:
            switch (src.id) {
                case 0: return S_NONE;
                case 1: return S_MAKE(C, 14);
                case 2: return S_MAKE(B, 15);
                case 3: return (IS_CURVED(switches, 14) ? S_MAKE(C, 12) : S_MAKE(C, 14));
                case 4: return S_MAKE(B, 9);
                case 5: return S_MAKE(C, 8);
                case 6: return S_MAKE(C, 8);
                case 7: return S_MAKE(B, 11);
                case 8: return S_MAKE(C, 8);
                case 9: return S_MAKE(B, 7);
                case 10: return (isA ? S_NONE : S_MAKE(A, 15));
                case 11: return S_MAKE(C, 8);
                case 12: return S_NONE;
                case 13: return S_MAKE(C, 14);
                case 14: return S_MAKE(C, 14);
                case 15: return (isA ? S_NONE : S_MAKE(A, 12));
            }
        case SG_B:
            switch (src.id) {
                case 0: return S_MAKE(C, 10);
                case 1: return S_MAKE(D, 13);
                case 2: return S_MAKE(C, 10);
                case 3: return S_MAKE(C, 1);
                case 4: return S_MAKE(C, 11);
                case 5: return S_MAKE(D, 4);
                case 6: return S_NONE;
                case 7: return S_MAKE(A, 9);
                case 8: return S_NONE;
                case 9: return S_MAKE(A, 6);
                case 10: return S_NONE;
                case 11: return S_MAKE(A, 7);
                case 12: return S_MAKE(D, 15);
                case 13: return (IS_CURVED(switches, SW_156) ? S_MAKE(E, 1) : (IS_CURVED(switches, SW_155) ? S_MAKE(D, 1) : S_NONE));
                case 14: return (IS_CURVED(switches, 15) ? S_MAKE(C, 9) : S_MAKE(C, 6));
                case 15: return S_MAKE(A, 4);
            }
        case SG_C:
            switch (src.id) {
                case 0: return (IS_CURVED(switches, SW_156) ? S_MAKE(E, 1) : (IS_CURVED(switches, SW_156) ? S_MAKE(D, 1) : S_NONE));
                case 1: return S_MAKE(B, 3);
                case 2: return (IS_CURVED(switches, 18) ? S_MAKE(C, 5) : S_MAKE(C, 7));
                case 3: return S_NONE;
                case 4: return S_MAKE(B, 16);
                case 5: return (IS_CURVED(switches, 6) ? (IS_CURVED(switches, 5) ? S_MAKE(E, 12) : S_MAKE(C, 4)) : S_MAKE(C, 16));
                case 6: return (IS_CURVED(switches, 3) ? (IS_CURVED(switches, 2) ? S_MAKE(A, 8) : (IS_CURVED(switches, 1) ? S_MAKE(A, 10) : S_MAKE(A, 11))) : S_MAKE(A, 5));
                case 7: return (IS_CURVED(switches, 5) ? S_MAKE(E, 12) : S_MAKE(C, 4));
                case 8: return (IS_CURVED(switches, 16) ? S_MAKE(B, 4) : S_MAKE(B, 2));
                case 9: return S_MAKE(B, 16);
                case 10: return S_MAKE(A, 3);
                case 11: return (IS_CURVED(switches, 13) ? S_MAKE(E, 15) : S_MAKE(B, 6));
                case 12: return (IS_CURVED(switches, 11) ? S_MAKE(A, 3) : (IS_CURVED(switches, 12) ? (IS_CURVED(switches, 4) ? S_MAKE(A, 13) : S_MAKE(A, 16)) : S_MAKE(A, 1)));
                case 13: return S_MAKE(E, 8);
                case 14: return S_MAKE(C, 5);
                case 15: return S_MAKE(D, 11);
            }
        case SG_D:
            switch (src.id) {
                case 0: return S_MAKE(E, 3);
                case 1: return (IS_CURVED(switches, SW_154) ? S_MAKE(B, 13) : (IS_CURVED(switches, SW_153) ? S_MAKE(C, 2) : S_NONE));
                case 2: return S_MAKE(B, 5);
                case 3: return S_MAKE(E, 6);
                case 4: return (IS_CURVED(switches, 8) ? S_MAKE(E, 9) : S_MAKE(D, 10));
                case 5: return S_MAKE(E, 5);
                case 6: return S_MAKE(E, 7);
                case 7: return (IS_CURVED(switches, 8) ? S_MAKE(E, 9) : S_MAKE(D, 10));
                case 8: return (IS_CURVED(switches, 9) ? S_MAKE(D, 6) : S_MAKE(D, 7));
                case 9: return S_MAKE(E, 11);
                case 10: return S_MAKE(E, 12);
                case 11: return S_MAKE(C, 15);
                case 12: return S_MAKE(E, 13);
                case 13: return S_MAKE(B, 1);
                case 14: return S_MAKE(E, 13);
                case 15: return S_MAKE(B, 14);
            }
        case SG_E:
            switch (src.id) {
                case 0: return S_MAKE(E, 16);
                case 1: return (IS_CURVED(switches, SW_154) ? S_MAKE(B, 13) : (IS_CURVED(switches, SW_153) ? S_MAKE(C, 2) : S_NONE));
                case 2: return S_MAKE(E, 6);
                case 3: return S_MAKE(D, 2);
                case 4: return (IS_CURVED(switches, 10) ? S_MAKE(E, 4) : S_MAKE(D, 3));
                case 5: return S_MAKE(D, 5);
                case 6: return S_MAKE(C, 13);
                case 7: return S_MAKE(D, 8);
                case 8: return S_MAKE(E, 14);
                case 9: return (IS_CURVED(switches, 9) ? S_MAKE(D, 6) : S_MAKE(D, 7));
                case 10: return (IS_CURVED(switches, 7) ? (IS_CURVED(switches, 18) ? S_MAKE(C, 5) : S_MAKE(C, 7)) : S_MAKE(D, 12));
                case 11: return S_MAKE(D, 9);
                case 12: return S_MAKE(E, 10);
                case 13: return (IS_CURVED(switches, 17) ? S_MAKE(D, 16) : S_MAKE(D, 14));
                case 14: return S_MAKE(E, 2);
                case 15: return S_MAKE(C, 11);
            }
    }

    return S_NONE;
}

struct Sensor getNextSensor(struct Sensor src, switch_state switches)
{
    if (src.group == SG_N) return src;
    switch (src.group) {
        default: return src;
        case SG_A:
            switch (src.id) {
                case 0: return S_MAKE(C, 13);
                case 1: return S_NONE;
                case 2: return (IS_CURVED(switches, 14) ? S_MAKE(C, 11) : S_MAKE(C, 13));
                case 3: return S_MAKE(B, 16);
                case 4: return S_MAKE(C, 7);
                case 5: return S_MAKE(B, 10);
                case 6: return S_MAKE(B, 12);
                case 7: return S_MAKE(C, 7);
                case 8: return S_MAKE(B, 8);
                case 9: return S_MAKE(C, 7);
                case 10: return S_MAKE(C, 7);
                case 11: return (isA ? S_NONE : S_MAKE(A, 16));
                case 12: return S_MAKE(C, 13);
                case 13: return S_NONE;
                case 14: return (isA ? S_NONE : S_MAKE(A, 11));
                case 15: return S_NONE;
            }
        case SG_B:
            switch (src.id) {
                case 0: return S_MAKE(D, 14);
                case 1: return S_MAKE(C, 9);
                case 2: return S_MAKE(C, 2);
                case 3: return S_MAKE(C, 9);
                case 4: return S_MAKE(D, 3);
                case 5: return S_MAKE(C, 12);
                case 6: return S_MAKE(A, 10);
                case 7: return S_NONE;
                case 8: return S_MAKE(A, 5);
                case 9: return S_NONE;
                case 10: return S_MAKE(A, 8);
                case 11: return S_NONE;
                case 12: return (IS_CURVED(switches, SW_156) ? S_MAKE(E, 2) : (IS_CURVED(switches, SW_155) ? S_MAKE(D, 2) : S_NONE));
                case 13: return S_MAKE(D, 16);
                case 14: return S_MAKE(A, 3);
                case 15: return (IS_CURVED(switches, 15) ? S_MAKE(C, 10) : S_MAKE(C, 5));
            }
        case SG_C:
            switch (src.id) {
                case 0: return S_MAKE(B, 4);
                case 1: return (IS_CURVED(switches, SW_156) ? S_MAKE(E, 2) : (IS_CURVED(switches, SW_155) ? S_MAKE(D, 2) : S_NONE));
                case 2: return S_NONE;
                case 3: return (IS_CURVED(switches, 18) ? S_MAKE(C, 6) : S_MAKE(C, 8));
                case 4: return (IS_CURVED(switches, 6) ? (IS_CURVED(switches, 5) ? S_MAKE(E, 11) : S_MAKE(C, 3)) : S_MAKE(C, 15));
                case 5: return S_MAKE(B, 15);
                case 6: return (IS_CURVED(switches, 5) ? S_MAKE(E, 11) : S_MAKE(C, 3));
                case 7: return (IS_CURVED(switches, 3) ? (IS_CURVED(switches, 2) ? S_MAKE(A, 7) : (IS_CURVED(switches, 1) ? S_MAKE(A, 9) : S_MAKE(A, 12))) : S_MAKE(A, 6));
                case 8: return S_MAKE(B, 15);
                case 9: return (IS_CURVED(switches, 16) ? S_MAKE(B, 3) : S_MAKE(B, 1));
                case 10: return (IS_CURVED(switches, 13) ? S_MAKE(E, 16) : S_MAKE(B, 5));
                case 11: return S_MAKE(A, 4);
                case 12: return S_MAKE(E, 7);
                case 13: return (IS_CURVED(switches, 11) ? S_MAKE(A, 4) : (IS_CURVED(switches, 12) ? (IS_CURVED(switches, 4) ? S_MAKE(A, 14) : S_MAKE(A, 15)) : S_MAKE(A, 2)));
                case 14: return S_MAKE(D, 12);
                case 15: return S_MAKE(C, 6);
            }
        case SG_D:
            switch (src.id) {
                case 0: return (IS_CURVED(switches, SW_154) ? S_MAKE(B, 14) : (IS_CURVED(switches, SW_153) ? S_MAKE(C, 1) : S_NONE));
                case 1: return S_MAKE(E, 4);
                case 2: return S_MAKE(E, 5);
                case 3: return S_MAKE(B, 6);
                case 4: return S_MAKE(E, 6);
                case 5: return (IS_CURVED(switches, 8) ? S_MAKE(E, 10) : S_MAKE(D, 9));
                case 6: return (IS_CURVED(switches, 8) ? S_MAKE(E, 10) : S_MAKE(D, 9));
                case 7: return S_MAKE(E, 8);
                case 8: return S_MAKE(E, 12);
                case 9: return (IS_CURVED(switches, 9) ? S_MAKE(D, 5) : S_MAKE(D, 8));
                case 10: return S_MAKE(C, 16);
                case 11: return S_MAKE(E, 11);
                case 12: return S_MAKE(B, 2);
                case 13: return S_MAKE(E, 14);
                case 14: return S_MAKE(B, 13);
                case 15: return S_MAKE(E, 14);
            }
        case SG_E:
            switch (src.id) {
                case 0: return (IS_CURVED(switches, SW_154) ? S_MAKE(B, 14) : (IS_CURVED(switches, SW_153) ? S_MAKE(C, 1) : S_NONE));
                case 1: return S_MAKE(E, 15);
                case 2: return S_MAKE(D, 1);
                case 3: return S_MAKE(E, 5);
                case 4: return S_MAKE(D, 6);
                case 5: return (IS_CURVED(switches, 10) ? S_MAKE(E, 3) : S_MAKE(D, 4));
                case 6: return S_MAKE(D, 7);
                case 7: return S_MAKE(C, 14);
                case 8: return (IS_CURVED(switches, 9) ? S_MAKE(D, 5) : S_MAKE(D, 8));
                case 9: return S_MAKE(E, 13);
                case 10: return S_MAKE(D, 10);
                case 11: return (IS_CURVED(switches, 7) ? (IS_CURVED(switches, 18) ? S_MAKE(C, 6) : S_MAKE(C, 8)) : S_MAKE(D, 11));
                case 12: return (IS_CURVED(switches, 17) ? S_MAKE(D, 15) : S_MAKE(D, 13));
                case 13: return S_MAKE(E, 9);
                case 14: return S_MAKE(C, 12);
                case 15: return S_MAKE(E, 1);
            }
    }

    return S_NONE;
}

struct Sensor getReverseSensor(struct Sensor src)
{
    if (src.group == SG_N) return src;
    struct Sensor ret;
    ret.group = src.group;
    if (src.id & 1)
        ret.id = src.id + 1;
    else
        ret.id = src.id - 1;
    return ret;
}

int getDistanceFromPrev(struct Sensor src, switch_state switches)
{
    if (src.group == SG_N) return -1;
    switch (src.group) {
        default: return -1;
        case SG_A:
            switch (src.id) {
                case 0: return -1;
                case 1: return 468;
                case 2: return 440;
                case 3: return (IS_CURVED(switches, 14) ? 376 : 567);
                case 4: return 649;
                case 5: return 361;
                case 6: return 538;
                case 7: return 473;
                case 8: return 473;
                case 9: return 289;
                case 10: return (isA ? -1 : 774);
                case 11: return (isA ? 928 : 783);
                case 12: return -1;
                case 13: return 650;
                case 14: return 695;
                case 15: return (isA ? -1 : 774);
            }
        case SG_B:
            switch (src.id) {
                case 0: return 371;
                case 1: return 398;
                case 2: return 366;
                case 3: return 230;
                case 4: return 354;
                case 5: return 405;
                case 6: return -1;
                case 7: return 289;
                case 8: return -1;
                case 9: return 649;
                case 10: return -1;
                case 11: return 473;
                case 12: return 202;
                case 13: return (IS_CURVED(switches, SW_156) ? 478 : (IS_CURVED(switches, SW_155) ? 507 : -1));
                case 14: return (IS_CURVED(switches, 15) ? 375 : 481);
                case 15: return 440;
            }
        case SG_C:
            switch (src.id) {
                case 0: return (IS_CURVED(switches, SW_156) ? 506 : (IS_CURVED(switches, SW_156) ? 535 : -1));
                case 1: return 230;
                case 2: return (IS_CURVED(switches, 18) ? 830 : 628);
                case 3: return -1;
                case 4: return 481;
                case 5: return (IS_CURVED(switches, 6) ? (IS_CURVED(switches, 5) ? 1003 : 830) : 302);
                case 6: return (IS_CURVED(switches, 3) ? (IS_CURVED(switches, 2) ? 538 : (IS_CURVED(switches, 1) ? 728 : (isA ? 928 : 783))) : 361);
                case 7: return (IS_CURVED(switches, 5) ? 801 : 628);
                case 8: return (IS_CURVED(switches, 16) ? 366 : 371);
                case 9: return 375;
                case 10: return 376;
                case 11: return (IS_CURVED(switches, 13) ? 370 : 354);
                case 12: return (IS_CURVED(switches, 11) ? 567 : (IS_CURVED(switches, 12) ? (IS_CURVED(switches, 4) ? 650 : (isA ? 829 : 695)) : 468));
                case 13: return (isA ? 877 : 785);
                case 14: return 302;
                case 15: return 405;
            }
        case SG_D:
            switch (src.id) {
                case 0: return 200;
                case 1: return (IS_CURVED(switches, SW_154) ? 507 : (IS_CURVED(switches, SW_153) ? 535 : -1));
                case 2: return 405;
                case 3: return 297;
                case 4: return (IS_CURVED(switches, 8) ? 621 : 697);
                case 5: return (isA ? 375 : 275);
                case 6: return 375;
                case 7: return (IS_CURVED(switches, 8) ? 698 : 774);
                case 8: return (IS_CURVED(switches, 9) ? 697 : 774);
                case 9: return (isA ? 361 : 284);
                case 10: return 285;
                case 11: return 405;
                case 12: return 287;
                case 13: return 398;
                case 14: return 292;
                case 15: return 202;
            }
        case SG_E:
            switch (src.id) {
                case 0: return 203;
                case 1: return (IS_CURVED(switches, SW_154) ? 478 : (IS_CURVED(switches, SW_153) ? 506 : -1));
                case 2: return 294;
                case 3: return 200;
                case 4: return (IS_CURVED(switches, 10) ? 294 : 297);
                case 5: return (isA ? 375 : 275);
                case 6: return (isA ? 877 : 785);
                case 7: return 375;
                case 8: return (isA ? 375 : 275);
                case 9: return (IS_CURVED(switches, 9) ? 621 : 698);
                case 10: return (IS_CURVED(switches, 7) ? (IS_CURVED(switches, 18) ? 1003 : 801) : 285);
                case 11: return (isA ? 361 : 284);
                case 12: return (isA ? 375 : 275);
                case 13: return (IS_CURVED(switches, 17) ? 292 : 287);
                case 14: return 203;
                case 15: return 370;
            }
    }
    return -1;
}

int getDistanceToNext(struct Sensor src, switch_state switches)
{
    return getDistanceFromPrev(getNextSensor(src, switches), switches);
}
