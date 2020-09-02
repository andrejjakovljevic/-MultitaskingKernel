#ifndef _IVTEntry_h
#define _IVTEntry_h
#include <stdio.h>
#include "timer.h"
typedef unsigned char IVTNo;
const int MAX_IVT=256;
typedef void interrupt (*pInterrupt) (...);

class KernelEv;

#define PREPAREENTRY(numEntry, callOld)\
void interrupt inter##numEntry(...); \
IVTEntry newEntry##numEntry(numEntry, inter##numEntry); \
void interrupt inter##numEntry(...) {\
newEntry##numEntry.signal();\
if (callOld == 1)\
newEntry##numEntry.old();\
Timer::zahtevana_promena_konteksta=1;\
timer();\
}

class IVTEntry
{
public:
    IVTNo num;
    pInterrupt routine;
    pInterrupt old;
    KernelEv* myEvent;

    static IVTEntry* IVTEntryList[MAX_IVT];

    IVTEntry(IVTNo br,pInterrupt routine);
    ~IVTEntry();

    static void setEvent(IVTNo num, KernelEv* ev);
    static void resetEvent(IVTNo num);
    void signal();

};




#endif