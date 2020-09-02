#include "kersem.h"
#include "macros.h"
#include "pcb.h"
#include "SCHEDULE.H"
#include <stdio.h>
#include <iostream.h>

List<KernelSem*> KernelSem::allSemaphores;

KernelSem::KernelSem(Semaphore* sem, int init)
{
    softlock;
    mySem=sem;
    val=init;
    if (val<0) val=0;
    softunlock;
}

void KernelSem::block(Time maxTimeToWait)
{
    softlock;
    PCB::running->state=BLOCKED;
    blocked.addPCB((PCB*)PCB::running,maxTimeToWait);
    dispatch();
    softunlock;
}

void KernelSem::unblock()
{
    /*softlock;
    printf("u unblock\n");
    softunlock;*/
    if (blocked.lista.length==0) return;
    softlock;
    blocked.signalOne();
    softunlock;
}

int KernelSem::wait(Time maxTimeToWait)
{
    softlock;
    val--;
    if (maxTimeToWait==0) maxTimeToWait=-1;
    if (val<0) block(maxTimeToWait);
    /*softlock;
    printf("val=%d\n",PCB::running->timeUnblock);
    softunlock;*/
    int ret=1-PCB::running->timeUnblock;
    PCB::running->timeUnblock=0;
    softunlock;
    return ret;
}

int KernelSem::signal (int n)
{
    /*softlock;
    printf("n=%d\n",blocked.lista.length);
    softunlock;*/
    if (n<0) return n;
    else if (n==0) 
    {
        if (val++<0) 
        {
            if (blocked.lista.length>0) 
            {
                unblock();
            }
            return 1;
        }
        return 0;
    }
    else
    {
        int k=n;
        int ret=0;
        while (k>0)
        {
            if (blocked.lista.length>0)
            {
                if (val++<0) unblock();
                ret++;
            }
            else val++;
            k--;
        }
        return ret;
    }
}

void KernelSem::passTime()
{
    softlock;
    blocked.passTime();
    softunlock;
}

KernelSem::~KernelSem()
{
    softlock;
    allSemaphores.deleteval(this);
    softunlock;
}