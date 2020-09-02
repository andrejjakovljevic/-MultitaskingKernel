#ifndef _event_h
#define _event_h
#include "macros.h"
#include "IVTEntry.h"

typedef unsigned char IVTNo;
class KernelEv;

class Event
{
public:
    Event (IVTNo ivtNo);
    ~Event();

    void wait();

protected:
    friend class KernelEv;
    void singal(); // can call KernelEv

private:
    KernelEv* myImpl;
};



#endif