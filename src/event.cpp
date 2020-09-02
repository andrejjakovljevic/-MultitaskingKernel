#include "event.h"
#include "timer.h"
#include "kerev.h"

Event::Event (IVTNo ivtNo)
{
    hardlock;
    myImpl = new KernelEv(this,ivtNo);
    hardunlock;
}

Event::~Event()
{
    hardlock;
    singal();
    if (myImpl) delete myImpl;
    myImpl=0;
    hardunlock;
}

void Event::wait()
{
    hardlock;
    myImpl->wait(); 
    hardunlock;
}

void Event::singal()
{
    hardlock;
    myImpl->signal();
    hardunlock;
}