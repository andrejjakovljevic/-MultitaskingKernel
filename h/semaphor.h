#ifndef semaphor_h
#define semaphor_h

typedef unsigned int Time;

class KernelSem;

class Semaphore
{
public:
    Semaphore(int init=1);
    virtual ~Semaphore();

    virtual int wait(Time maxTimeToWait);
    virtual int signal(int n=0);

    int val() const;

private:
    KernelSem* myImpl;
};

#endif