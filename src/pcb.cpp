#include "pcb.h"
#include <dos.h>
#include "SCHEDULER.H"
#include <stdio.h>
#include "macros.h"
#include <iostream.h>

int PCB::MAXID=0;
volatile List<PCB*> PCB::allPCB;
volatile int PCB::runningThreads=0;
volatile List<SignalId> PCB::pomlist;

class DummyThread : public Thread
{
public:
    DummyThread(StackSize stackSize = defaultStackSize, Time timeSlice = defaultTimeSlice) : Thread(stackSize,timeSlice) {};
    virtual void run();
};

void DummyThread::run()
{
    /*softlock;
    printf("dummy\n");
    softunlock;*/
    while(1)
    {
    }
}

volatile PCB* PCB::dummyPCB=(new DummyThread(4096,1))->myPCB;
volatile PCB* PCB::initial = new PCB(4096,0);
volatile PCB* PCB::running=initial;
volatile int PCB::globalSignalLock[16] = {0};


PCB::PCB(StackSize stackSize, Time timeSlice)
{
    softlock;
    myThread=0;
    stackSize/=sizeof(unsigned);
    stack = new unsigned[stackSize];
    stack[stackSize-1]=FP_SEG(myThread);
    stack[stackSize-2]=FP_OFF(myThread);
    stack[stackSize-5]=0x200;
    stack[stackSize-6]=FP_SEG(PCB::wrapper);
    stack[stackSize-7]=FP_OFF(PCB::wrapper);
    ss=FP_SEG(stack+stackSize-16);
    sp=FP_OFF(stack+stackSize-16);
    bp=sp;
    lockCount=0;
    id=MAXID;
    MAXID++;
    state=MADE;
    kvant=timeSlice;
    timeUnblock=0;
    if (kvant==0) kvant=-1;    
    parent=0;
    for (int i=0;i<16;i++)
    {
        signalLock[i]=0;
    }
    softunlock; 
}

PCB::PCB(Thread* th, StackSize stackSize, Time timeSlice)
{
    softlock;
    if (stackSize>MAX_SIZE) stackSize=MAX_SIZE;
    if (stackSize<MIN_SIZE) stackSize=MIN_SIZE;
    //printf("stack=%d\n",stackSize);
    myThread=th;
    stackSize/=sizeof(unsigned);
    stack = new unsigned[stackSize];
    stack[stackSize-1]=FP_SEG(myThread);
    stack[stackSize-2]=FP_OFF(myThread);
    stack[stackSize-5]=0x200;
    stack[stackSize-6]=FP_SEG(PCB::wrapper);
    stack[stackSize-7]=FP_OFF(PCB::wrapper);
    ss=FP_SEG(stack+stackSize-16);
    sp=FP_OFF(stack+stackSize-16);
    bp=sp;
    lockCount=0;
    id=MAXID;
    MAXID++;
    state=MADE;
    kvant=timeSlice;
    timeUnblock=0;
    if (kvant==0) kvant=-1;
    parent=(PCB*)PCB::running;
    for (int iter=0;iter<16;iter++)
    {
        signalLock[iter]=PCB::running->signalLock[iter];
    }
    for (int i=0;i<16;i++)
    {
        List<SignalHandler>::Node* curr=PCB::running->signalHandlers[i].head;
        while(curr!=0)
        {
            signalHandlers[i].pushBack(curr->val);
            curr=curr->next;
        }
    }
    softunlock;
}

void PCB::wrapper(Thread* th)
{
    th->run();
    hardlock;
    th->myPCB->state=DONE;
    th->myPCB->signal(2);
    if (th->myPCB->parent->myThread!=0) th->myPCB->parent->signal(1);
    th->myPCB->doSignals();
    PCB::runningThreads--;
    th->myPCB->unblockAll();
    dispatch();
    hardunlock;
}

void PCB::addToAllPCB(PCB* curr)
{
    softlock;
    allPCB.push(curr);
    softunlock;
}

void PCB::deleteFromAllPCB(PCB* curr)
{
    softlock;
    allPCB.deleteval(curr);
    softunlock;
}

void PCB::addToBlockedList(PCB* nes)
{
    softlock;
    blocked.push(nes);
    softunlock;
}

void PCB::unblockAll() volatile
{
    softlock;
    while (blocked.length!=0)
    {
        PCB* pom=blocked.pop();
        pom->state=READY;
        Scheduler::put(pom);
    }
    softunlock;
}

PCB::~PCB()
{
    Timer::globalLockCnt++;
    if (stack) delete[] stack;
    Timer::globalLockCnt--;
}

void PCB::signal(SignalId signal) volatile
{
    if (signal>=16) return;
    softlock;
    activeSignals.pushBack(signal);
    if (this==PCB::running)
    {
        PCB::running->doSignals();
		if (Timer::needToKill==1)
		{	
			Timer::needToKill=0;
            dispatch();
		}
    }
    softunlock;
}

void PCB::registerHandler(SignalId signal, SignalHandler handler)
{
    if (signal>=16) return;
    softlock;
    signalHandlers[signal].pushBack(handler);
    softunlock;
}

void PCB::unregisterAllHandlers(SignalId id)
{
    softlock;
    signalHandlers[id].erase();
    softunlock;
}

void PCB::swap(SignalId id, SignalHandler hand1, SignalHandler hand2)
{
    softlock;
    List<SignalHandler>::Node* p1=0;
    List<SignalHandler>::Node* p2=0;
    List<SignalHandler>::Node* curr=signalHandlers[id].head;
    while (curr!=0)
    {
        if (curr->val==hand1) p1=curr;
        if (curr->val==hand2) p2=curr;
        curr=curr->next;
    }
    if (p1!=0 && p2!=0)
    {
        SignalHandler t=p1->val;
        p1->val=p2->val;
        p2->val=t;
    }
    softunlock;
}

void PCB::blockSignal(SignalId signal)
{
    if (signal>=16) return;
    softlock;
    signalLock[signal]=1;
    softunlock;
}

void PCB::blockSignalGlobally(SignalId signal)
{
    if (signal>=16) return;
    softlock;
    globalSignalLock[signal]=1;
    softunlock;
}

void PCB::unblockSignal(SignalId signal)
{
    if (signal>=16) return;
    softlock;
    signalLock[signal]=0;
    softunlock;
}

void PCB::unblockSignalGlobally(SignalId signal)
{
    if (signal>=16) return;
    softlock;
    globalSignalLock[signal]=0;
    softunlock;
}

void PCB::doSignals() volatile
{
    softlock;
    pomlist.erase();
    int needsToBeKilled=0;
    //printf("running=%d\n",Thread::getRunningId());
    //printf("duzina=%d %d\n",activeSignals.length,myThread->getId());
    //printf("aaa\n");
    while(activeSignals.length>0)
    {
        SignalId rdBrSignal=activeSignals.pop();
        //printf("duzina=%d\n",activeSignals.length);
        if (signalLock[rdBrSignal]==0 && globalSignalLock[rdBrSignal]==0)
        {
            if (rdBrSignal==0)
            {
                needsToBeKilled=1;
                signal(2);
                break;
            }
            else
            { 
                List<SignalHandler>::Node* pom=signalHandlers[rdBrSignal].head;
                while(pom!=0)
                {
                    Timer::globalLockCnt++;
                    asm sti;
                    pom->val();
                    asm cli;
                    Timer::globalLockCnt--;
                    pom=pom->next; 
                }
            }
        }
        else pomlist.pushBack(rdBrSignal);
    }
    List<SignalId>::Node* nesto=pomlist.head;
    while (nesto!=0)
    {
        activeSignals.pushBack(nesto->val);
        nesto=nesto->next;
    }
    //printf("kraj zivota=%d\n",activeSignals.head->val);
    if (needsToBeKilled)
    {
        if (parent->myThread!=0) parent->signal(1);
        state=DONE;
        PCB::runningThreads--;
        //cout << endl << "smrt" << endl;
        unblockAll();
        Timer::needToKill=1;
    }
    softunlock;
}