#include "PCBtime.h"
#include "SCHEDULE.H"
#include <stdio.h>

void PCBtime::passTime()
{
    kolikoOtpustenih=0;
    /*softlock;
    printf("u passTime\n");
    softunlock;*/
    ListVal<Elem>::Node* first=lista.head;
    while (first!=0)
    {
        /*softlock;
        printf("time=%d\n",first->val.time);
        softunlock;*/
        if (first->val.time>0) first->val.time--;
        first=first->next;
    }
    first=lista.head;
    while (lista.length!=0 && lista.head->val.time==0)
    {
        kolikoOtpustenih++;
        Elem pom=lista.pop();
        pom.pcb->timeUnblock=1;
        pom.pcb->state=READY;
        Scheduler::put(pom.pcb);
    }
}

void PCBtime::addPCB(PCB* pcb, Time maxTime)
{
    /*softlock;
    printf("id=%d\n",pcb->myThread->getId());
    softunlock;*/
    Elem el(pcb,maxTime);
    ListVal<Elem>::Node* pom = new ListVal<Elem>::Node(el);
    ListVal<Elem>::Node* first=lista.head;
    ListVal<Elem>::Node* prev=0;
    if (maxTime!=-1)
    {
        while (first!=0 && first->val.time<maxTime)
        {
            prev=first;
            first=first->next;
        }
    }
    else
    {
        while (first!=0)
        {
            prev=first;
            first=first->next;
        }
    }
    lista.length++;
    pom->next=first;
    if (prev!=0) prev->next=pom;
    if (prev==0)
    {
        lista.head=pom;
    }
}

void PCBtime::signalOne()
{
    if (lista.length!=0)
    {
        PCB* nes=lista.pop().pcb;
        nes->state=READY;
        Scheduler::put(nes);
    }
}