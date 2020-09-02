#ifndef pcb_h
#define pcb_h

#include "thread.h"
#include "lista.h"
#include "timer.h"
enum States {DONE,READY,MADE,BLOCKED};
typedef unsigned int Time;
typedef int ID;
const StackSize MIN_SIZE = 2048;
const StackSize MAX_SIZE = 32768;

class PCB
{
public:
    static volatile PCB* running;
    unsigned* stack;
    unsigned ss;
    unsigned sp;
    unsigned bp;
    unsigned kvant;
    int lockCount;
    int id;
    int timeUnblock;
    States state;
    Thread* myThread;
    static int MAXID;
    List<SignalHandler> signalHandlers[16];
    List<SignalId> activeSignals;
    int signalLock[16];
    static volatile int globalSignalLock[16];
    PCB* parent;

    static volatile List<PCB*> allPCB;
    List<PCB*> blocked;
    static volatile PCB* initial;
    static volatile PCB* dummyPCB;
    static volatile int runningThreads;
    static volatile List<SignalId> pomlist;

    PCB(StackSize stackSize, Time timeSlice);
    PCB(Thread* th, StackSize stackSize, Time timeSlice);
    static void wrapper(Thread* th);
    static void addToAllPCB(PCB* curr);
    static void deleteFromAllPCB(PCB* curr);
    void addToBlockedList(PCB* nes);
    void unblockAll() volatile;
    ~PCB();

    void signal(SignalId signal) volatile;
    void registerHandler(SignalId signal, SignalHandler handler);
    void unregisterAllHandlers(SignalId id);
    void swap(SignalId id, SignalHandler hand1, SignalHandler hand2);
    void blockSignal(SignalId signal);
    static void blockSignalGlobally(SignalId signal);
    void unblockSignal(SignalId signal);
    static void unblockSignalGlobally(SignalId signal);
    void doSignals() volatile;
};


#endif