#include "kerev.h"
#include "IVTEntry.h"
#include "SCHEDULE.H"

KernelEv::KernelEv(Event* ev, IVTNo ivtNo)
{
    hardlock;
    myEvent=ev;
    val=1;
    this->ivtNo=ivtNo;
    hisPCB = (PCB*)PCB::running;
    IVTEntry::setEvent(ivtNo,this);
    hardunlock;
}

void KernelEv::wait()
{
    hardlock;
    if (hisPCB==PCB::running)
    {
        if (val>0)
        {
            val=0;
            PCB::running->state=BLOCKED;
            dispatch();
        }
    }
    hardunlock;
}

void KernelEv::signal()
{
    hardlock;
    if (val==0)
    {
        hisPCB->state=READY;
        Scheduler::put(hisPCB);
        val=1;
    }
    hardunlock;
}