#include "thread.h"
#include "pcb.h"
#include "SCHEDULE.H"
#include "lista.h"
#include "macros.h"
#include <stdio.h>
#include <iostream.h>

Thread::Thread(StackSize stackSize, Time timeSlice)
{
    softlock;
    myPCB = new PCB(this,stackSize,timeSlice);
    PCB::addToAllPCB(myPCB);
    softunlock;
}

Thread::~Thread()
{
    softlock;
    PCB::deleteFromAllPCB(myPCB);
    if (myPCB) delete myPCB;
    myPCB=0;
    softunlock;
}

void Thread::start()
{
    softlock;
    if (myPCB->state==MADE)
    {
        PCB::runningThreads++;
        myPCB->state=READY;
        Scheduler::put(myPCB);
    }
    softunlock;
}

ID Thread::getId()
{
    return myPCB->id;
}

ID Thread::getRunningId()
{
    return PCB::running->id;
}

Thread* Thread::getThreadById(ID id)
{
    List<PCB*>::Node* curr=(List<PCB*>::Node*)PCB::allPCB.head;
    softlock;
    while (curr!=0 && curr->val->id!=id)
    {
        curr=curr->next;
    }
    softunlock;
    return curr->val->myThread;
}

void dispatch()
{ // sinhrona promena konteksta 
	hardlock;
	Timer::zahtevana_promena_konteksta = 1;
    //cout << "nest=" << Timer::globalLockCnt << endl;
	asm int 8h;
	hardunlock;
}

void Thread::waitToComplete()
{
    softlock;
    if (PCB::running!=myPCB && myPCB->state!=DONE)
    {
        PCB::running->state=BLOCKED;
        myPCB->addToBlockedList((PCB*)PCB::running);
        dispatch();
    }
    softunlock;
}

void Thread::signal(SignalId signal)
{
    if (myPCB==0) return;
    myPCB->signal(signal);
}

void Thread::registerHandler(SignalId signal, SignalHandler handler)
{
    if (myPCB==0) return;
    myPCB->registerHandler(signal,handler);
}

void Thread::unregisterAllHandlers(SignalId id)
{
    if (myPCB==0) return;
    myPCB->unregisterAllHandlers(id);
}

void Thread::swap(SignalId id, SignalHandler hand1, SignalHandler hand2)
{
    if (myPCB==0) return;
    myPCB->swap(id,hand1,hand2);
}
    
void Thread::blockSignal(SignalId signal)
{
    if (myPCB==0) return;
    myPCB->blockSignal(signal);
}

void Thread::blockSignalGlobally(SignalId signal)
{
    PCB::blockSignalGlobally(signal);
}

void Thread::unblockSignal(SignalId signal)
{
    if (myPCB==0) return;
    myPCB->unblockSignal(signal);
}

void Thread::unblockSignalGlobally(SignalId signal)
{
    PCB::unblockSignalGlobally(signal);
}

