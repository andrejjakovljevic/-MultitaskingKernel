#include "timer.h"
#include "thread.h"
#include "semaphor.h"
#include "event.h"
#include "IVTEntry.h"
#include <stdio.h>
#include <dos.h>
#include <stdarg.h>
#include <iostream.h>
#include <stdlib.h>
#include <conio.h>
#include "pcb.h"
#include "macros.h"

int syncPrintf(const char *format, ...)
{
    int res;
    va_list args;
    hardlock;
        va_start(args, format);
    res = vprintf(format, args);
    va_end(args);
    hardunlock;
        return res;
}

extern int userMain(int argc, char** argv);

int res=-1;
int flag=0;
int global_argc;
char** global_argv;

class UserThread : public Thread
{
public:
    UserThread() : Thread() {};
    void run();
    ~UserThread();
};

UserThread::~UserThread()
{
    waitToComplete();
}


void UserThread::run()
{
    res=userMain(global_argc,global_argv);
}

int main(int argc, char** argv)
{
    //system("cls");
    softlock;
    Timer::init();
    global_argc=argc;
    global_argv=argv;
    UserThread ut;
    ut.start();
    softunlock;
    dispatch();
    /*softlock;
    printf("Happy End\n");
    softunlock;*/
    /*while(1)
    {
        softlock;
        int dummy=0;
        if (Timer::globalLockCnt>0) dummy++;
        else dummy--;
        softunlock;
    }*/
    //while(flag==0);
    hardlock;
    //printf("res=%d\n",res);
    Timer::restore();
    delete PCB::dummyPCB;
    delete PCB::initial;
    hardunlock;
    //while(1);
    //while(1);
    return res;
}