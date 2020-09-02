#include "timer.h"
#include "pcb.h"
#include "SCHEDULE.h"
#include "kersem.h"
#include <iostream.h>
#include <stdio.h>

volatile unsigned Timer::brojac=0;
volatile unsigned Timer::zahtevana_promena_konteksta=0;
volatile int Timer::globalLockCnt=0;
volatile int Timer::pozvan_dispatch=0;
volatile int Timer::needToKill=0;
unsigned tsp;
unsigned tss;
unsigned tbp;
List<KernelSem*>::Node* curr; 
extern void tick();

unsigned oldTimerOFF, oldTimerSEG;

void interrupt timer()
{  
	if(!Timer::pozvan_dispatch && !Timer::zahtevana_promena_konteksta) 
	{
		curr = KernelSem::allSemaphores.head;
		while (curr!=0)
		{
			curr->val->passTime();
			if (curr->val->blocked.kolikoOtpustenih>0)
			{
				curr->val->val+=curr->val->blocked.kolikoOtpustenih;
				curr->val->blocked.kolikoOtpustenih=0;
			}
			curr=curr->next;
		}
		asm int 60h;
		tick();
		//printf("brojac=%d\n",Timer::brojac);
	} 
	if (!Timer::zahtevana_promena_konteksta && Timer::brojac>0 && !Timer::pozvan_dispatch) 
	{	
		Timer::brojac--;
	} 
	if (Timer::brojac == 0 || Timer::zahtevana_promena_konteksta || Timer::pozvan_dispatch)
	{
		/*printf("nes1=%d\n",Timer::zahtevana_promena_konteksta);
		printf("nesto=%d\n",Timer::pozvan_dispatch);
		printf("brojac=%d\n",Timer::brojac);*/
		//if (Timer::pozvan_dispatch) printf("pozvan dipatch\n");
		if (Timer::globalLockCnt==0 || Timer::pozvan_dispatch)
		{
				//printf("usao u promenu\n");
				//printf("test\n");
				Timer::zahtevana_promena_konteksta=0;
				asm {
					// cuva sp
					mov tsp, sp
					mov tss, ss
					mov tbp,bp
				}
				PCB::running->sp = tsp;
				PCB::running->ss = tss;
				PCB::running->bp = tbp;
				PCB::running->lockCount=Timer::globalLockCnt;
				//running= getNextPCBToExecute();	// Scheduler
				if (PCB::running->state==READY && PCB::running!=PCB::initial && PCB::running!=PCB::dummyPCB) Scheduler::put((PCB*)PCB::running);
			do
			{
				Timer::needToKill=0;
				PCB::running=Scheduler::get();
				if (PCB::running==0 && PCB::runningThreads>0) PCB::running=PCB::dummyPCB;
				else if (PCB::running==0) 
				{
					PCB::running=PCB::initial;
				}
				tsp = PCB::running->sp;
				tss = PCB::running->ss;
				tbp = PCB::running->bp;
				Timer::globalLockCnt=PCB::running->lockCount;
				Timer::brojac = PCB::running->kvant;
				//printf("id=%d\n",Thread::getRunningId());
				asm {
					mov sp, tsp   // restore sp
					mov ss, tss
					mov bp, tbp
				}
				PCB::running->doSignals();
				//printf("Timerneed=%d\n",Timer::needToKill);
			} while (Timer::needToKill==1);
		}
		//else Timer::zahtevana_promena_konteksta=1;
	}
	// poziv stare prekidne rutine koja se 
     // nalazila na 08h, a sad je na 60h
     // poziva se samo kada nije zahtevana promena
     // konteksta – tako se da se stara
     // rutina poziva samo kada je stvarno doslo do prekida	
                                             
	//zahtevana_promena_konteksta = 0;
}


void Timer::init()
{
	asm{
		cli
		push es
		push ax

		mov ax,0   //  ; inicijalizuje rutinu za tajmer
		mov es,ax

		mov ax, word ptr es:0022h //; pamti staru rutinu
		mov word ptr oldTimerSEG, ax	
		mov ax, word ptr es:0020h	
		mov word ptr oldTimerOFF, ax	

		mov word ptr es:0022h, seg timer	 //postavlja 
		mov word ptr es:0020h, offset timer //novu rutinu

		mov ax, oldTimerSEG	 //	postavlja staru rutinu	
		mov word ptr es:0182h, ax //; na int 60h
		mov ax, oldTimerOFF
		mov word ptr es:0180h, ax

		pop ax
		pop es
		sti
	}
}

void Timer::restore()
{
	asm {
		cli
		push es
		push ax

		mov ax,0
		mov es,ax


		mov ax, word ptr oldTimerSEG
		mov word ptr es:0022h, ax
		mov ax, word ptr oldTimerOFF
		mov word ptr es:0020h, ax

		pop ax
		pop es
		sti
	}
}
	
