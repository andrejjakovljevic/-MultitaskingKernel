#ifndef _kerev_h
#define _kerev_h
#include "event.h"
#include "Semaphor.h"
#include "PCB.h"

typedef unsigned char IVTNo;
class KernelEv
{
public:
    IVTNo ivtNo;
    PCB* hisPCB;
    int val;
    Event* myEvent;

    KernelEv(Event* ev, IVTNo ivtNo);

    void wait();
    void signal();
};




#endif