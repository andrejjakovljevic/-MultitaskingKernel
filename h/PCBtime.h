#ifndef PCBtime_h
#define PCBtime_h
#include "pcb.h"
#include "lista2.h"

class PCBtime
{
public:
    struct Elem
    {
        PCB* pcb;
        Time time;
        Elem(PCB* _pcb,Time _time) : pcb(_pcb),time(_time) {};
    };
    int kolikoOtpustenih;
    ListVal<Elem> lista;
    void passTime(); 
    void addPCB(PCB* pcb, Time maxTime);
    void signalOne();
};

#endif 