#ifndef kersem_h
#define kersem_h

#include "semaphor.h"
#include "lista.h"
#include "pcb.h"
#include "PCBtime.h"
#include "lista2.h"

class KernelSem
{
public:
    static List<KernelSem*> allSemaphores;
    int val;
    Semaphore* mySem;
    PCBtime blocked;

    int wait(Time maxTimeToWait);
    int signal (int n);

    void block(Time maxTimeToWait);
    void unblock();

    KernelSem(Semaphore* sem, int init);
    ~KernelSem();
    void passTime();
};





#endif