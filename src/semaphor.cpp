#include "semaphor.h"
#include "kersem.h"
#include <iostream.h>
#include <stdio.h>
#include "macros.h"

Semaphore::Semaphore(int init)
{
    softlock;
    myImpl = new KernelSem(this,init);
    KernelSem::allSemaphores.push(myImpl);
    softunlock;
}

Semaphore::~Semaphore()
{
    hardlock;
    signal(myImpl->val);
    //KernelSem::allSemaphores.deleteval(myImpl);
    delete myImpl;
    myImpl=0;
    hardunlock;
}

int Semaphore::val() const
{
    return myImpl->val;
}

int Semaphore::wait(Time maxTimeToWait)
{
    hardlock;
    int ret = myImpl->wait(maxTimeToWait);
    hardunlock;
    return ret;
}

int Semaphore::signal(int n)
{
    hardlock;
    int ret = myImpl->signal(n);
    hardunlock;
    return ret;
}
