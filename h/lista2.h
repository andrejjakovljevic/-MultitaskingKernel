#ifndef _lista2_
#define _lista2_


#define softlock Timer::globalLockCnt++;
#define softunlock if(--Timer::globalLockCnt==0 && Timer::zahtevana_promena_konteksta) { }

template<class T>
class ListVal
{
public:
    struct Node 
    {
        T val;
        Node *next;
        Node(T data) : val(data), next(0) {}
    };
    int length;
    Node* head;
    void erase() volatile
    {
        while (head != 0) {
            Node* old = head;
            head = head->next;
            softlock;
            delete old;
            softunlock;
        }
        head = 0;
        length = 0;
    }
    void push(T val) volatile
    {
        softlock;
        Node* newNode = new Node(val);
        softunlock;
        if (head!=0) 
        { 
            newNode->next = head; 
        }
        head = newNode;
        length++;
    }

    T pop() volatile
    {
        T ret = head->val;
        Node* old = head;
        head = head->next;
        length--;
        softlock;
        delete old;
        softunlock;
        return ret;
    }

    ~ListVal()
    {
        erase();
    }

    void delNode(Node* cur)
    {
        softlock
        Node* t = head;
        Node* prev = 0;
        while (t != 0) 
        {
            if (t == cur) 
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

    ListVal() 
    {
        head=0;
        length=0;
    }

    T headVal()
    {
        return head->val;
    }
};



#endif