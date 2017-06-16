#ifndef ZTO_H
#define ZTO_H

/* A zto is an approximated real number from 0 to 1 (inclusive). */
typedef unsigned int zto;
extern zto zto_one;
extern zto zto_zero;

zto ztoInverse(unsigned int x);
zto ztoAdd(zto a, zto b);
zto ztoSub(zto a, zto b);
zto ztoMul(zto a, zto b);
zto ztoDiv(zto a, zto b);
zto ztoRoot(zto a, unsigned int b);
zto ztoPower(zto a, unsigned int b);
int ztoRound(zto a);

#endif /* ZTO_H */
