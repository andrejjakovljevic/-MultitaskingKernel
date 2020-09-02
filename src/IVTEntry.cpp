#include "IVTEntry.h"
#include <dos.h>
#include "macros.h"
#include "kerev.h"

IVTEntry* IVTEntry::IVTEntryList[MAX_IVT] = {0};

IVTEntry::IVTEntry(IVTNo br,pInterrupt routine)
{
    hardlock;
    myEvent=0;
    old=0;
    this->routine=routine;
    num=br;
    IVTEntryList[br]=this;
    hardunlock;
}

void IVTEntry::setEvent(IVTNo num, KernelEv* ev)
{
    hardlock;
    IVTEntry* ivtentry = IVTEntryList[num];
    ivtentry->myEvent=ev;
    ivtentry->old=getvect(num);
    setvect(num,ivtentry->routine);
    hardunlock;
}

void IVTEntry::resetEvent(IVTNo num)
{
    hardlock;
    IVTEntry* ivtentry = IVTEntryList[num];
    setvect(num,ivtentry->old);
    if (ivtentry->old!=0) ivtentry->old();
    ivtentry->myEvent=0;
    IVTEntryList[num]=0;
    hardunlock;
}

void IVTEntry::signal()
{
    hardlock;
    myEvent->signal();
    hardunlock;
}

IVTEntry::~IVTEntry()
{
    hardlock;
    resetEvent(num);
    hardunlock;
}