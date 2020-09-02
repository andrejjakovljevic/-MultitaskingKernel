#ifndef _lista_
#define _lista_
#include "stdio.h"

#define softlock Timer::globalLockCnt++;
#define softunlock if(--Timer::globalLockCnt==0 && Timer::zahtevana_promena_konteksta) {  }

template<class T>
class List
{
public:
    struct Node 
    {
		T val;
		Node *next;
		Node(T data) 
        { 
            this->val=data; 
            this->next=0;
        }
	};
    int length;
    Node* head;
    void erase() volatile
    {
        softlock;
        Node* pom = head;
		while (pom != 0) 
        {
			Node* old = pom;
			pom = pom->next;
			delete old;
		}
		head = 0;
		length = 0;
		softunlock;
	}
    void push(T val) volatile
    {
		softlock;
		Node* pom = new Node(val);
        pom->next = head; 
		head = pom;
	    length++;
		softunlock;
	}

    void pushBack(T val) volatile
    {
        softlock;
		Node* novi = new Node(val);
        Node* curr=head;
        while (curr!=0 && curr->next!=0) curr=curr->next;
        if (curr!=0) curr->next=novi; 
        else head=novi;
        length++;
        softunlock;
    }

    T pop() volatile
    {
		softlock;
		T val = head->val;
		Node* old = head;
		head = head->next;
		length--;
		delete old;
		softunlock;
		return val;
	}

    ~List()
    {
        erase();
    }

    void deleteval (T del) volatile
    {
        softlock
        Node* t = head;
        Node* prev = 0;
        while (t != 0) 
        {
            if (t->val == del) 
            {
                if (prev == 0) 
                {
                    head = head->next;
                    length--;
                    delete t;
                }
                else 
                {
                    prev->next = t->next;
                    length--;
                    delete t;
                }
                break;
            }
            prev = t;
            t = t->next;
        }   
        softunlock
    }

    List()
    {
        head=0;
        length=0;
    }
};



#endif