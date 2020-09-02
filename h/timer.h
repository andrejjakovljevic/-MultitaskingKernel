#ifndef timer_h
#define timer_h

class Timer
{
public:
    static volatile unsigned brojac;
    static volatile unsigned zahtevana_promena_konteksta;
    static volatile int globalLockCnt;
    static volatile int pozvan_dispatch;
    static volatile int needToKill;

    static void init();
    static void restore();

};

void interrupt timer();



#endif