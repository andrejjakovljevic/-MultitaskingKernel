	ifndef	??version
?debug	macro
	endm
publicdll macro	name
	public	name
	endm
$comm	macro	name,dist,size,count
	comm	dist name:BYTE:count*size
	endm
	else
$comm	macro	name,dist,size,count
	comm	dist name[size]:BYTE:count
	endm
	endif
	?debug	V 300h
	?debug	S "thread.cpp"
	?debug	C E9938499500A7468726561642E637070
	?debug	C E97B70A2500D2E2E5C685C7468726561642E68
	?debug	C E970B1A2500A2E2E5C685C7063622E68
	?debug	C E97B70A2500D2E2E5C685C7468726561642E68
	?debug	C E9E27AA5500C2E2E5C685C6C697374612E68
	?debug	C E94029CA1817633A5C626333315C696E636C7564655C737464696F+
	?debug	C 2E68
	?debug	C E94029CA1817633A5C626333315C696E636C7564655C5F64656673+
	?debug	C 2E68
	?debug	C E94029CA1818633A5C626333315C696E636C7564655C5F6E66696C+
	?debug	C 652E68
	?debug	C E94029CA1817633A5C626333315C696E636C7564655C5F6E756C6C+
	?debug	C 2E68
	?debug	C E9C19894500C2E2E5C685C74696D65722E68
	?debug	C E9DB767A400F2E2E5C685C5343484544554C452E48
	?debug	C E9E27AA5500C2E2E5C685C6C697374612E68
	?debug	C E94A72A2500D2E2E5C685C6D6163726F732E68
	?debug	C E94029CA1817633A5C626333315C696E636C7564655C737464696F+
	?debug	C 2E68
	?debug	C E94029CA181A633A5C626333315C696E636C7564655C696F737472+
	?debug	C 65616D2E68
	?debug	C E94029CA1815633A5C626333315C696E636C7564655C6D656D2E68
THREAD_TEXT	segment byte public 'CODE'
THREAD_TEXT	ends
	assume	cs:THREAD_TEXT,ds:THREAD_DATA
THREAD_DATA	segment word public 'FAR_DATA'
d@	label	byte
d@w	label	word
b@	label	byte
b@w	label	word
THREAD_DATA	ends
THREAD_TEXT	segment byte public 'CODE'
	?debug	C E8010A7468726561642E63707093849950
   ;	
   ;	Thread::Thread(StackSize stackSize, Time timeSlice)
   ;	
	?debug	L 9
	assume	cs:THREAD_TEXT
@Thread@0$bctr$qului	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,THREAD_DATA
	mov	ds,ax
	?debug	C F81440546872656164403024626374722471756C+
	?debug	C 7569
	?debug	C E318000400161900
	?debug	C E60974696D65536C6963650A0A0E000009737461+
	?debug	C 636B53697A650C0A0A0000047468697318020600+
	?debug	C 00
	?debug	B
   ;	
   ;	{
   ;	
	?debug	L 10
	mov	ax,word ptr [bp+6]
	or	ax,word ptr [bp+8]
	jne	short @1@86
	mov	ax,8
	push	ax
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp+8],dx
	mov	word ptr [bp+6],ax
	or	ax,dx
	je	short @1@226
@1@86:
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+2],seg @@Thread@0
	mov	word ptr es:[bx],offset @@Thread@0
   ;	
   ;	    softlock;
   ;	
	?debug	L 11
 	pushf	
 	cli	
   ;	
   ;	    myPCB = new PCB(this,stackSize,timeSlice);
   ;	
	?debug	L 12
	push	word ptr [bp+14]
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	xor	ax,ax
	xor	dx,dx
	push	ax
	push	dx
	call	far ptr @PCB@0$bctr$qn6Threadului
	add	sp,14
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+6],dx
	mov	word ptr es:[bx+4],ax
   ;	
   ;	    PCB::addToAllPCB(myPCB);
   ;	
	?debug	L 13
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+6]
	push	word ptr es:[bx+4]
	call	far ptr @PCB@0addToAllPCB$qn3PCB
	pop	cx
	pop	cx
   ;	
   ;	    softunlock;
   ;	
	?debug	L 14
 	popf	
@1@226:
   ;	
   ;	}
   ;	
	?debug	L 15
	mov	dx,word ptr [bp+8]
	mov	ax,word ptr [bp+6]
	jmp	short @1@254
@1@254:
	pop	ds
	pop	bp
	ret	
	?debug	C E60474686973180206000009737461636B53697A+
	?debug	C 650C0A0A00000974696D65536C6963650A0A0E00+
	?debug	C 00
	?debug	E
	?debug	E
@Thread@0$bctr$qului	endp
   ;	
   ;	Thread::~Thread()
   ;	
	?debug	L 17
	assume	cs:THREAD_TEXT
@Thread@0$bdtr$qv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	si
	push	ds
	mov	ax,THREAD_DATA
	mov	ds,ax
	?debug	C F8114054687265616440302462647472247176
	?debug	C E60664656C657465040A0A000004746869731802+
	?debug	C 060000
	mov	si,word ptr [bp+10]
	?debug	B
   ;	
   ;	{
   ;	
	?debug	L 18
	mov	ax,word ptr [bp+6]
	or	ax,word ptr [bp+8]
	je	short @2@254
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+2],seg @@Thread@0
	mov	word ptr es:[bx],offset @@Thread@0
   ;	
   ;	    softlock;
   ;	
	?debug	L 19
 	pushf	
 	cli	
   ;	
   ;	    PCB::deleteFromAllPCB(myPCB);
   ;	
	?debug	L 20
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+6]
	push	word ptr es:[bx+4]
	call	far ptr @PCB@0deleteFromAllPCB$qn3PCB
	pop	cx
	pop	cx
   ;	
   ;	    delete myPCB;
   ;	
	?debug	L 21
	mov	ax,3
	push	ax
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+6]
	push	word ptr es:[bx+4]
	call	far ptr @PCB@0$bdtr$qv
	add	sp,6
   ;	
   ;	    myPCB=0;
   ;	
	?debug	L 22
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+6],0
	mov	word ptr es:[bx+4],0
   ;	
   ;	    softunlock;
   ;	
	?debug	L 23
 	popf	
	test	si,1
	je	short @2@254
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @$bdele$qnv
	pop	cx
	pop	cx
@2@254:
   ;	
   ;	}
   ;	
	?debug	L 24
	pop	ds
	pop	si
	pop	bp
	ret	
	?debug	C E6047468697318020600000664656C657465040C+
	?debug	C 0600
	?debug	E
	?debug	E
@Thread@0$bdtr$qv	endp
   ;	
   ;	void Thread::start()
   ;	
	?debug	L 26
	assume	cs:THREAD_TEXT
@Thread@0start$qv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,THREAD_DATA
	mov	ds,ax
	?debug	C F8114054687265616440307374617274247176
	?debug	C E604746869731802060000
	?debug	B
   ;	
   ;	{
   ;	    softlock;
   ;	
	?debug	L 28
 	pushf	
 	cli	
   ;	
   ;	    if (myPCB->state==MADE)
   ;	
	?debug	L 29
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+4]
	cmp	word ptr es:[bx+18],2
	jne	short @3@142
   ;	
   ;	    {
   ;	        PCB::runningThreads++;
   ;	
	?debug	L 31
	mov	ax,seg @PCB@0runningThreads
	mov	es,ax
	inc	word ptr es:@PCB@0runningThreads
   ;	
   ;	        myPCB->state=READY;
   ;	
	?debug	L 32
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+4]
	mov	word ptr es:[bx+18],1
   ;	
   ;	        Scheduler::put(myPCB);
   ;	
	?debug	L 33
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+6]
	push	word ptr es:[bx+4]
	call	far ptr @Scheduler@0put$qn3PCB
	pop	cx
	pop	cx
@3@142:
   ;	
   ;	    }
   ;	    softunlock;
   ;	
	?debug	L 35
 	popf	
   ;	
   ;	}
   ;	
	?debug	L 36
	pop	ds
	pop	bp
	ret	
	?debug	C E604746869731802060000
	?debug	E
	?debug	E
@Thread@0start$qv	endp
   ;	
   ;	ID Thread::getId()
   ;	
	?debug	L 38
	assume	cs:THREAD_TEXT
@Thread@0getId$qv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,THREAD_DATA
	mov	ds,ax
	?debug	C F8114054687265616440306765744964247176
	?debug	C E604746869731802060000
	?debug	B
   ;	
   ;	{
   ;	    return myPCB->id;
   ;	
	?debug	L 40
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+4]
	mov	ax,word ptr es:[bx+14]
	jmp	short @4@58
@4@58:
   ;	
   ;	}
   ;	
	?debug	L 41
	pop	ds
	pop	bp
	ret	
	?debug	C E604746869731802060000
	?debug	E
	?debug	E
@Thread@0getId$qv	endp
   ;	
   ;	ID Thread::getRunningId()
   ;	
	?debug	L 43
	assume	cs:THREAD_TEXT
@Thread@0getRunningId$qv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,THREAD_DATA
	mov	ds,ax
	?debug	C F81840546872656164403067657452756E6E696E+
	?debug	C 674964247176
	?debug	B
   ;	
   ;	{
   ;	    return PCB::running->id;
   ;	
	?debug	L 45
	mov	ax,seg @PCB@0running
	mov	es,ax
	les	bx,dword ptr es:@PCB@0running
	mov	ax,word ptr es:[bx+14]
	jmp	short @5@58
@5@58:
   ;	
   ;	}
   ;	
	?debug	L 46
	pop	ds
	pop	bp
	ret	
	?debug	E
	?debug	E
@Thread@0getRunningId$qv	endp
   ;	
   ;	Thread* Thread::getThreadById(ID id)
   ;	
	?debug	L 48
	assume	cs:THREAD_TEXT
@Thread@0getThreadById$qi	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	sub	sp,4
	push	ds
	mov	ax,THREAD_DATA
	mov	ds,ax
	?debug	C F819405468726561644030676574546872656164+
	?debug	C 42794964247169
	?debug	C E6026964040A060000
	?debug	B
   ;	
   ;	{
   ;	    List<PCB*>::Node* curr=(List<PCB*>::Node*)PCB::allPCB.head;
   ;	
	?debug	L 50
	mov	ax,seg @PCB@0allPCB
	mov	es,ax
	mov	ax,word ptr es:@PCB@0allPCB+4
	mov	dx,word ptr es:@PCB@0allPCB+2
	mov	word ptr [bp-2],ax
	mov	word ptr [bp-4],dx
   ;	
   ;	    softlock;
   ;	
	?debug	L 51
 	pushf	
 	cli	
	jmp	short @6@226
@6@142:
   ;	
   ;	    while (curr!=0)
   ;	    {
   ;	        if (curr->val->id==id) break;
   ;	
	?debug	L 54
	les	bx,dword ptr [bp-4]
	les	bx,dword ptr es:[bx]
	mov	ax,word ptr es:[bx+14]
	cmp	ax,word ptr [bp+6]
	jne	short @6@198
	jmp	short @6@254
@6@198:
   ;	
   ;	        curr=curr->next;
   ;	
	?debug	L 55
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx+6]
	mov	dx,word ptr es:[bx+4]
	mov	word ptr [bp-2],ax
	mov	word ptr [bp-4],dx
@6@226:
	?debug	L 52
	mov	ax,word ptr [bp-4]
	or	ax,word ptr [bp-2]
	jne	short @6@142
@6@254:
   ;	
   ;	    }
   ;	    softunlock;
   ;	
	?debug	L 57
 	popf	
   ;	
   ;	    return curr->val->myThread;
   ;	
	?debug	L 58
	les	bx,dword ptr [bp-4]
	les	bx,dword ptr es:[bx]
	mov	dx,word ptr es:[bx+22]
	mov	ax,word ptr es:[bx+20]
	jmp	short @6@310
@6@310:
   ;	
   ;	}
   ;	
	?debug	L 59
	pop	ds
	mov	sp,bp
	pop	bp
	ret	
	?debug	C E31A000400161B00
	?debug	C E604637572721A02FCFF00026964040A060000
	?debug	E
	?debug	E
@Thread@0getThreadById$qi	endp
   ;	
   ;	void dispatch(){ // sinhrona promena konteksta 
   ;	
	?debug	L 61
	assume	cs:THREAD_TEXT
@dispatch$qv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,THREAD_DATA
	mov	ds,ax
	?debug	B
   ;	
   ;		hardlock;
   ;	
	?debug	L 62
 	pushf	
 	cli	
   ;	
   ;		Timer::pozvan_dispatch = 1;
   ;	
	?debug	L 63
	mov	ax,seg @Timer@0pozvan_dispatch
	mov	es,ax
	mov	word ptr es:@Timer@0pozvan_dispatch,1
   ;	
   ;		asm int 8h;
   ;	
	?debug	L 64
 	int	 8h
   ;	
   ;		hardunlock;
   ;	
	?debug	L 65
 	popf	
   ;	
   ;	}
   ;	
	?debug	L 66
	pop	ds
	pop	bp
	ret	
	?debug	E
	?debug	E
@dispatch$qv	endp
   ;	
   ;	void Thread::waitToComplete()
   ;	
	?debug	L 68
	assume	cs:THREAD_TEXT
@Thread@0waitToComplete$qv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,THREAD_DATA
	mov	ds,ax
	?debug	C F81A40546872656164403077616974546F436F6D+
	?debug	C 706C657465247176
	?debug	C E604746869731802060000
	?debug	B
   ;	
   ;	{
   ;	    softlock;
   ;	
	?debug	L 70
 	pushf	
 	cli	
   ;	
   ;	    if (PCB::running!=myPCB && myPCB->state!=DONE)
   ;	
	?debug	L 71
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+6]
	mov	dx,word ptr es:[bx+4]
	mov	bx,seg @PCB@0running
	mov	es,bx
	cmp	ax,word ptr es:@PCB@0running+2
	jne	short @8@142
	cmp	dx,word ptr es:@PCB@0running
	je	short @8@198
@8@142:
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+4]
	cmp	word ptr es:[bx+18],0
	je	short @8@198
   ;	
   ;	    {
   ;	        PCB::running->state=BLOCKED;
   ;	
	?debug	L 73
	mov	ax,seg @PCB@0running
	mov	es,ax
	les	bx,dword ptr es:@PCB@0running
	mov	word ptr es:[bx+18],3
   ;	
   ;	        myPCB->addToBlockedList((PCB*)PCB::running);
   ;	
	?debug	L 74
	mov	ax,seg @PCB@0running
	mov	es,ax
	push	word ptr es:@PCB@0running+2
	push	word ptr es:@PCB@0running
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+6]
	push	word ptr es:[bx+4]
	call	far ptr @PCB@0addToBlockedList$qn3PCB
	add	sp,8
   ;	
   ;	        dispatch();
   ;	
	?debug	L 75
	push	cs
	call	near ptr @dispatch$qv
@8@198:
   ;	
   ;	    }
   ;	    softunlock;
   ;	
	?debug	L 77
 	popf	
   ;	
   ;	}
   ;	
	?debug	L 78
	pop	ds
	pop	bp
	ret	
	?debug	C E604746869731802060000
	?debug	E
	?debug	E
@Thread@0waitToComplete$qv	endp
   ;	
   ;	void Thread::signal(SignalId signal)
   ;	
	?debug	L 80
	assume	cs:THREAD_TEXT
@Thread@0signal$qui	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,THREAD_DATA
	mov	ds,ax
	?debug	C F8134054687265616440307369676E616C247175+
	?debug	C 69
	?debug	C E6067369676E616C0A0A0A000004746869731802+
	?debug	C 060000
	?debug	B
   ;	
   ;	{
   ;	    if (myPCB==0) return;
   ;	
	?debug	L 82
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+4]
	or	ax,word ptr es:[bx+6]
	jne	short @9@86
	jmp	short @9@114
@9@86:
   ;	
   ;	    myPCB->signal(signal);
   ;	
	?debug	L 83
	push	word ptr [bp+10]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+6]
	push	word ptr es:[bx+4]
	call	far ptr @PCB@0signal$wqui
	add	sp,6
@9@114:
   ;	
   ;	}
   ;	
	?debug	L 84
	pop	ds
	pop	bp
	ret	
	?debug	C E604746869731802060000067369676E616C0A0A+
	?debug	C 0A0000
	?debug	E
	?debug	E
@Thread@0signal$qui	endp
   ;	
   ;	void Thread::registerHandler(SignalId signal, SignalHandler handler)
   ;	
	?debug	L 86
	assume	cs:THREAD_TEXT
@Thread@0registerHandler$quinqv$v	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,THREAD_DATA
	mov	ds,ax
	?debug	C F821405468726561644030726567697374657248+
	?debug	C 616E646C6572247175696E71762476
	?debug	C E31D00000023010400
	?debug	C E31C000400161D00
	?debug	C E60768616E646C65721C0A0C0000067369676E61+
	?debug	C 6C0A0A0A000004746869731802060000
	?debug	B
   ;	
   ;	{
   ;	    if (myPCB==0) return;
   ;	
	?debug	L 88
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+4]
	or	ax,word ptr es:[bx+6]
	jne	short @10@86
	jmp	short @10@114
@10@86:
   ;	
   ;	    myPCB->registerHandler(signal,handler);
   ;	
	?debug	L 89
	push	word ptr [bp+14]
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+6]
	push	word ptr es:[bx+4]
	call	far ptr @PCB@0registerHandler$quinqv$v
	add	sp,10
@10@114:
   ;	
   ;	}
   ;	
	?debug	L 90
	pop	ds
	pop	bp
	ret	
	?debug	C E604746869731802060000067369676E616C0A0A+
	?debug	C 0A00000768616E646C65721C0A0C0000
	?debug	E
	?debug	E
@Thread@0registerHandler$quinqv$v	endp
   ;	
   ;	void Thread::unregisterAllHandlers(SignalId id)
   ;	
	?debug	L 92
	assume	cs:THREAD_TEXT
@Thread@0unregisterAllHandlers$qui	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,THREAD_DATA
	mov	ds,ax
	?debug	C F822405468726561644030756E72656769737465+
	?debug	C 72416C6C48616E646C65727324717569
	?debug	C E60269640A0A0A000004746869731802060000
	?debug	B
   ;	
   ;	{
   ;	    if (myPCB==0) return;
   ;	
	?debug	L 94
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+4]
	or	ax,word ptr es:[bx+6]
	jne	short @11@86
	jmp	short @11@114
@11@86:
   ;	
   ;	    myPCB->unregisterAllHandlers(id);
   ;	
	?debug	L 95
	push	word ptr [bp+10]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+6]
	push	word ptr es:[bx+4]
	call	far ptr @PCB@0unregisterAllHandlers$qui
	add	sp,6
@11@114:
   ;	
   ;	}
   ;	
	?debug	L 96
	pop	ds
	pop	bp
	ret	
	?debug	C E6047468697318020600000269640A0A0A0000
	?debug	E
	?debug	E
@Thread@0unregisterAllHandlers$qui	endp
   ;	
   ;	void Thread::swap(SignalId id, SignalHandler hand1, SignalHandler hand2)
   ;	
	?debug	L 98
	assume	cs:THREAD_TEXT
@Thread@0swap$quinqv$vt2	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,THREAD_DATA
	mov	ds,ax
	?debug	C F81840546872656164403073776170247175696E+
	?debug	C 717624767432
	?debug	C E60568616E64321C0A1000000568616E64311C0A+
	?debug	C 0C00000269640A0A0A0000047468697318020600+
	?debug	C 00
	?debug	B
   ;	
   ;	{
   ;	    if (myPCB==0) return;
   ;	
	?debug	L 100
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+4]
	or	ax,word ptr es:[bx+6]
	jne	short @12@86
	jmp	short @12@114
@12@86:
   ;	
   ;	    myPCB->swap(id,hand1,hand2);
   ;	
	?debug	L 101
	push	word ptr [bp+18]
	push	word ptr [bp+16]
	push	word ptr [bp+14]
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+6]
	push	word ptr es:[bx+4]
	call	far ptr @PCB@0swap$quinqv$vt2
	add	sp,14
@12@114:
   ;	
   ;	}
   ;	
	?debug	L 102
	pop	ds
	pop	bp
	ret	
	?debug	C E6047468697318020600000269640A0A0A000005+
	?debug	C 68616E64311C0A0C00000568616E64321C0A1000+
	?debug	C 00
	?debug	E
	?debug	E
@Thread@0swap$quinqv$vt2	endp
   ;	
   ;	void Thread::blockSignal(SignalId signal)
   ;	
	?debug	L 104
	assume	cs:THREAD_TEXT
@Thread@0blockSignal$qui	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,THREAD_DATA
	mov	ds,ax
	?debug	C F818405468726561644030626C6F636B5369676E+
	?debug	C 616C24717569
	?debug	C E6067369676E616C0A0A0A000004746869731802+
	?debug	C 060000
	?debug	B
   ;	
   ;	{
   ;	    if (myPCB==0) return;
   ;	
	?debug	L 106
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+4]
	or	ax,word ptr es:[bx+6]
	jne	short @13@86
	jmp	short @13@114
@13@86:
   ;	
   ;	    myPCB->blockSignal(signal);
   ;	
	?debug	L 107
	push	word ptr [bp+10]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+6]
	push	word ptr es:[bx+4]
	call	far ptr @PCB@0blockSignal$qui
	add	sp,6
@13@114:
   ;	
   ;	}
   ;	
	?debug	L 108
	pop	ds
	pop	bp
	ret	
	?debug	C E604746869731802060000067369676E616C0A0A+
	?debug	C 0A0000
	?debug	E
	?debug	E
@Thread@0blockSignal$qui	endp
   ;	
   ;	void Thread::blockSignalGlobally(SignalId signal)
   ;	
	?debug	L 110
	assume	cs:THREAD_TEXT
@Thread@0blockSignalGlobally$qui	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,THREAD_DATA
	mov	ds,ax
	?debug	C F820405468726561644030626C6F636B5369676E+
	?debug	C 616C476C6F62616C6C7924717569
	?debug	C E6067369676E616C0A0A060000
	?debug	B
   ;	
   ;	{
   ;	    PCB::blockSignalGlobally(signal);
   ;	
	?debug	L 112
	push	word ptr [bp+6]
	call	far ptr @PCB@0blockSignalGlobally$qui
	pop	cx
   ;	
   ;	}
   ;	
	?debug	L 113
	pop	ds
	pop	bp
	ret	
	?debug	C E6067369676E616C0A0A060000
	?debug	E
	?debug	E
@Thread@0blockSignalGlobally$qui	endp
   ;	
   ;	void Thread::unblockSignal(SignalId signal)
   ;	
	?debug	L 115
	assume	cs:THREAD_TEXT
@Thread@0unblockSignal$qui	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,THREAD_DATA
	mov	ds,ax
	?debug	C F81A405468726561644030756E626C6F636B5369+
	?debug	C 676E616C24717569
	?debug	C E6067369676E616C0A0A0A000004746869731802+
	?debug	C 060000
	?debug	B
   ;	
   ;	{
   ;	    if (myPCB==0) return;
   ;	
	?debug	L 117
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+4]
	or	ax,word ptr es:[bx+6]
	jne	short @15@86
	jmp	short @15@114
@15@86:
   ;	
   ;	    myPCB->unblockSignal(signal);
   ;	
	?debug	L 118
	push	word ptr [bp+10]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+6]
	push	word ptr es:[bx+4]
	call	far ptr @PCB@0unblockSignal$qui
	add	sp,6
@15@114:
   ;	
   ;	}
   ;	
	?debug	L 119
	pop	ds
	pop	bp
	ret	
	?debug	C E604746869731802060000067369676E616C0A0A+
	?debug	C 0A0000
	?debug	E
	?debug	E
@Thread@0unblockSignal$qui	endp
   ;	
   ;	void Thread::unblockSignalGlobally(SignalId signal)
   ;	
	?debug	L 121
	assume	cs:THREAD_TEXT
@Thread@0unblockSignalGlobally$qui	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,THREAD_DATA
	mov	ds,ax
	?debug	C F822405468726561644030756E626C6F636B5369+
	?debug	C 676E616C476C6F62616C6C7924717569
	?debug	C E6067369676E616C0A0A060000
	?debug	B
   ;	
   ;	{
   ;	    PCB::unblockSignalGlobally(signal);
   ;	
	?debug	L 123
	push	word ptr [bp+6]
	call	far ptr @PCB@0unblockSignalGlobally$qui
	pop	cx
   ;	
   ;	}
   ;	
	?debug	L 124
	pop	ds
	pop	bp
	ret	
	?debug	C E6067369676E616C0A0A060000
	?debug	E
	?debug	E
@Thread@0unblockSignalGlobally$qui	endp
THREAD_TEXT	ends
THREAD_TEXT	segment byte public 'CODE'
@Thread@0	segment	virtual
@@Thread@0	label	byte
	dd	@Thread@0$bdtr$qv
	dd	@@Thread@0run$qv
@Thread@0	ends
THREAD_TEXT	ends
THREAD_TEXT	segment byte public 'CODE'
@Thread@0run$qv	segment	virtual
	?debug	C E8020D2E2E5C685C7468726561642E687B70A250
	?debug	L 40
	assume	cs:@Thread@0run$qv
@@Thread@0run$qv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,THREAD_DATA
	mov	ds,ax
	?debug	C F80F40546872656164403072756E247176
	?debug	C E604746869731802060000
	?debug	B
	pop	ds
	pop	bp
	ret	
	?debug	C E604746869731802060000
	?debug	E
	?debug	E
@@Thread@0run$qv	endp
	?debug	C E9
	?debug	C FA00000000
@Thread@0run$qv	ends
THREAD_TEXT	ends
THREAD_DATA	segment word public 'FAR_DATA'
s@	label	byte
THREAD_DATA	ends
THREAD_TEXT	segment byte public 'CODE'
THREAD_TEXT	ends
	?debug	C E3190654687265616408002E01
	?debug	C ED00010000010E00
	?debug	C E31E0000002D0104011900114054687265616440+
	?debug	C 307374617274247176
	?debug	C E3200000002D01040119001A4054687265616440+
	?debug	C 3077616974546F436F6D706C657465247176
	?debug	C E3220000002D0104011900114054687265616440+
	?debug	C 302462647472247176
	?debug	C E3240000002D0404011900114054687265616440+
	?debug	C 306765744964247176
	?debug	C E3260000002D0404011900184054687265616440+
	?debug	C 3067657452756E6E696E674964247176
	?debug	C E3280000002D1804011900194054687265616440+
	?debug	C 3067657454687265616442794964247169
	?debug	C E32A0000002D0104011900134054687265616440+
	?debug	C 307369676E616C24717569
	?debug	C E32C0000002D0104011900214054687265616440+
	?debug	C 30726567697374657248616E646C657224717569+
	?debug	C 6E71762476
	?debug	C E32E0000002D0104011900224054687265616440+
	?debug	C 30756E7265676973746572416C6C48616E646C65+
	?debug	C 727324717569
	?debug	C E3300000002D0104011900184054687265616440+
	?debug	C 3073776170247175696E717624767432
	?debug	C E3320000002D0104011900184054687265616440+
	?debug	C 30626C6F636B5369676E616C24717569
	?debug	C E3340000002D0104011900204054687265616440+
	?debug	C 30626C6F636B5369676E616C476C6F62616C6C79+
	?debug	C 24717569
	?debug	C E3360000002D01040119001A4054687265616440+
	?debug	C 30756E626C6F636B5369676E616C24717569
	?debug	C E3380000002D0104011900224054687265616440+
	?debug	C 30756E626C6F636B5369676E616C476C6F62616C+
	?debug	C 6C7924717569
	?debug	C E33A0000002D1804011900144054687265616440+
	?debug	C 3024626374722471756C7569
	?debug	C E33C0000002D01040319020F4054687265616440+
	?debug	C 3072756E247176
	?debug	C E33F03504342A8002E03
	?debug	C ED00030000140E00
	?debug	C E340000400163F00
	?debug	C E341000400160A00
	?debug	C E34206537461746573020022000080FF7F3D
	?debug	C E3450E40254C69737424746E717624762506002E+
	?debug	C 04
	?debug	C ED00040000410E00
	?debug	C E3461340254C69737424746E7176247625404E6F+
	?debug	C 646508002E05
	?debug	C ED000500004F0F00
	?debug	C E347000400164600
	?debug	C E3480000002D4704094600
	?debug	C E34A0000002D0104094500
	?debug	C E34C0000002D0104094500
	?debug	C E34E0000002D0104094500
	?debug	C E3500000002D1C04094500
	?debug	C E3520000002D0104094500
	?debug	C E3540000002D0104094500
	?debug	C E3560000002D0104094500
	?debug	C E3580000002D4704094500
	?debug	C E35A000400164500
	?debug	C E35B0000002D5A04094500
	?debug	C E3440060001A45
	?debug	C E35D0B40254C697374247475692506002E06
	?debug	C ED00060000530E00
	?debug	C E35E1040254C6973742474756925404E6F646506+
	?debug	C 002E07
	?debug	C ED00070000610F00
	?debug	C E35F000400165E00
	?debug	C E3600000002D5F04095E00
	?debug	C E3620000002D0104095D00
	?debug	C E3640000002D0104095D00
	?debug	C E3660000002D0104095D00
	?debug	C E3680000002D0A04095D00
	?debug	C E36A0000002D0104095D00
	?debug	C E36C0000002D0104095D00
	?debug	C E36E0000002D0104095D00
	?debug	C E3700000002D5F04095D00
	?debug	C E372000400165D00
	?debug	C E3730000002D7204095D00
	?debug	C E3750020001A04
	?debug	C E3760020001A04
	?debug	C E3770E40254C69737424746E335043422506002E+
	?debug	C 08
	?debug	C ED00080000650E00
	?debug	C E31B1340254C69737424746E3350434225404E6F+
	?debug	C 646508002E02
	?debug	C ED00020000730F00
	?debug	C E3780000002D1A04091B00
	?debug	C E37A0000002D0104097700
	?debug	C E37C0000002D0104097700
	?debug	C E37E0000002D0104097700
	?debug	C E380800000002D3E04097700
	?debug	C E380820000002D0104097700
	?debug	C E380840000002D0104097700
	?debug	C E380860000002D0104097700
	?debug	C E380880000002D1A04097700
	?debug	C E3808A000400167700
	?debug	C E3808B0000002D808A04097700
	?debug	C E3808D0000002D3E04013F001140504342403024+
	?debug	C 626374722471756C7569
	?debug	C E3808F0000002D3E04013F001940504342403024+
	?debug	C 6263747224716E36546872656164756C7569
	?debug	C E380910000002D0104013F001740504342403077+
	?debug	C 72617070657224716E36546872656164
	?debug	C E380930000002D0104013F001840504342403061+
	?debug	C 6464546F416C6C50434224716E33504342
	?debug	C E380950000002D0104013F001D40504342403064+
	?debug	C 656C65746546726F6D416C6C50434224716E3350+
	?debug	C 4342
	?debug	C E380970000002D0104013F001D40504342403061+
	?debug	C 6464546F426C6F636B65644C69737424716E3350+
	?debug	C 4342
	?debug	C E380990000002D0104013F001440504342403075+
	?debug	C 6E626C6F636B416C6C24777176
	?debug	C E3809B0000002D0104013F000E40504342403024+
	?debug	C 62647472247176
	?debug	C E3809D0000002D0104013F001140504342403073+
	?debug	C 69676E616C2477717569
	?debug	C E3809F0000002D0104013F001E40504342403072+
	?debug	C 6567697374657248616E646C6572247175696E71+
	?debug	C 762476
	?debug	C E380A10000002D0104013F001F40504342403075+
	?debug	C 6E7265676973746572416C6C48616E646C657273+
	?debug	C 24717569
	?debug	C E380A30000002D0104013F001540504342403073+
	?debug	C 776170247175696E717624767432
	?debug	C E380A50000002D0104013F001540504342403062+
	?debug	C 6C6F636B5369676E616C24717569
	?debug	C E380A70000002D0104013F001D40504342403062+
	?debug	C 6C6F636B5369676E616C476C6F62616C6C792471+
	?debug	C 7569
	?debug	C E380A90000002D0104013F001740504342403075+
	?debug	C 6E626C6F636B5369676E616C24717569
	?debug	C E380AB0000002D0104013F001F40504342403075+
	?debug	C 6E626C6F636B5369676E616C476C6F62616C6C79+
	?debug	C 24717569
	?debug	C E380AD0000002D0104013F001340504342403064+
	?debug	C 6F5369676E616C7324777176
	?debug	C E33E000400163F00
	extrn	@Scheduler@0put$qn3PCB:far
	extrn	@PCB@0unblockSignalGlobally$qui:far
	extrn	@PCB@0unblockSignal$qui:far
	extrn	@PCB@0blockSignalGlobally$qui:far
	extrn	@PCB@0blockSignal$qui:far
	extrn	@PCB@0swap$quinqv$vt2:far
	extrn	@PCB@0unregisterAllHandlers$qui:far
	extrn	@PCB@0registerHandler$quinqv$v:far
	extrn	@PCB@0signal$wqui:far
	extrn	@PCB@0$bdtr$qv:far
	extrn	@PCB@0addToBlockedList$qn3PCB:far
	extrn	@PCB@0deleteFromAllPCB$qn3PCB:far
	extrn	@PCB@0addToAllPCB$qn3PCB:far
	extrn	@PCB@0$bctr$qn6Threadului:far
	extrn	@PCB@0pomlist:word
	extrn	@PCB@0runningThreads:word
	extrn	@PCB@0allPCB:word
	extrn	@PCB@0running:dword
	extrn	@Timer@0pozvan_dispatch:word
	public	@dispatch$qv
	public	@Thread@0$bctr$qului
	public	@Thread@0unblockSignalGlobally$qui
	public	@Thread@0unblockSignal$qui
	public	@Thread@0blockSignalGlobally$qui
	public	@Thread@0blockSignal$qui
	public	@Thread@0swap$quinqv$vt2
	public	@Thread@0unregisterAllHandlers$qui
	public	@Thread@0registerHandler$quinqv$v
	public	@Thread@0signal$qui
	public	@Thread@0getThreadById$qi
	public	@Thread@0getRunningId$qv
	public	@Thread@0getId$qv
	public	@Thread@0$bdtr$qv
	public	@Thread@0waitToComplete$qv
	public	@Thread@0start$qv
	extrn	@$bdele$qnv:far
	extrn	@$bnew$qui:far
_s@	equ	s@
	?debug	C EA050D
	?debug	C E380B203696F732A002E0C
	?debug	C ED000C0000770E00
	?debug	C E380B308696F5F7374617465020022000080FF7F+
	?debug	C 80B5
	?debug	C E380B5096F70656E5F6D6F6465020022000080FF+
	?debug	C 7F80BA
	?debug	C E380B7087365656B5F646972020022000080FF7F+
	?debug	C 80C2
	?debug	C E380B90004001680B200
	?debug	C E380BA0000002D80B9040180B2001840696F7340+
	?debug	C 30246263747224716E3973747265616D627566
	?debug	C E380BC0000002D01040180B2000E40696F734030+
	?debug	C 2462647472247176
	?debug	C E380BE0000002D06040980B200
	?debug	C E380C00000002D06040180B2000E40696F734030+
	?debug	C 666C61677324716C
	?debug	C E380C20000002D06040180B2000E40696F734030+
	?debug	C 7365746624716C6C
	?debug	C E380C40000002D06040180B2000D40696F734030+
	?debug	C 7365746624716C
	?debug	C E380C60000002D06040180B2000F40696F734030+
	?debug	C 756E7365746624716C
	?debug	C E380C80000002D04040980B200
	?debug	C E380CA0000002D04040980B200
	?debug	C E380CC0000002D02040980B200
	?debug	C E380CE0000002D02040980B200
	?debug	C E380D00000002D04040980B200
	?debug	C E380D20000002D04040980B200
	?debug	C E380D5076F73747265616D30002E0D
	?debug	C ED000D020080C50E010C80
	?debug	C E380D60000002D80D4040180D5001C406F737472+
	?debug	C 65616D4030246263747224716E3973747265616D+
	?debug	C 627566
	?debug	C E380D80000002D01040180D50012406F73747265+
	?debug	C 616D40302462647472247176
	?debug	C E380DA0000002D80D4040180D50012406F737472+
	?debug	C 65616D40302462637472247169
	?debug	C E380DC0000002D80D4040180D50015406F737472+
	?debug	C 65616D403024626374722471696E7A63
	?debug	C E380DE0000002D04040980D500
	?debug	C E380E00000002D01040980D500
	?debug	C E380E20004003580D500
	?debug	C E380E30000002D80E2040180D50012406F737472+
	?debug	C 65616D4030666C757368247176
	?debug	C E380E50000002D80E2040180D50012406F737472+
	?debug	C 65616D40307365656B7024716C
	?debug	C E380E70000002D80E2040180D5001B406F737472+
	?debug	C 65616D40307365656B7024716C387365656B5F64+
	?debug	C 6972
	?debug	C E380E90000002D06040180D50012406F73747265+
	?debug	C 616D403074656C6C70247176
	?debug	C E380EB0000002D80E2040980D500
	?debug	C E380ED0000002D80E2040180D50016406F737472+
	?debug	C 65616D4030777269746524716E787A6369
	?debug	C E380EF0000002D80E2040980D500
	?debug	C E380F10000002D80E2040580D50013406F737472+
	?debug	C 65616D403024626C736824717A63
	?debug	C E380F30000002D80E2040D80D500
	?debug	C E380F50000002D80E2040D80D500
	?debug	C E380F70000002D80E2040D80D500
	?debug	C E380F90000002D80E2040D80D500
	?debug	C E380FB0000002D80E2040D80D500
	?debug	C E380FD0000002D80E2040580D50012406F737472+
	?debug	C 65616D403024626C736824716C
	?debug	C E380FF0000002D80E2040580D50013406F737472+
	?debug	C 65616D403024626C73682471756C
	?debug	C E381010000002D80E2040D80D500
	?debug	C E381030000002D80E2040D80D500
	?debug	C E381050000002D80E2040580D50012406F737472+
	?debug	C 65616D403024626C7368247167
	?debug	C E381070000002D80E2040D80D500
	?debug	C E381090000002D80E2040D80D500
	?debug	C E3810B0000002D80E2040580D50013406F737472+
	?debug	C 65616D403024626C736824716E76
	?debug	C E3810D0000002D80E2040580D5001C406F737472+
	?debug	C 65616D403024626C736824716E3973747265616D+
	?debug	C 627566
	?debug	C E3810F0000002D80E2040D80D500
	?debug	C E381110000002D80E2040580D5001E406F737472+
	?debug	C 65616D403024626C736824716E716D33696F7324+
	?debug	C 6D33696F73
	?debug	C E381130000002D04040180D50014406F73747265+
	?debug	C 616D4030646F5F6F706678247176
	?debug	C E381150000002D01040180D50014406F73747265+
	?debug	C 616D4030646F5F6F736678247176
	?debug	C E381170000002D80D4040180D50012406F737472+
	?debug	C 65616D40302462637472247176
	?debug	C E381190000002D01040180D50018406F73747265+
	?debug	C 616D40306F757473747224716E787A637431
	?debug	C E380D40004001680D500
	?debug	C E3811B0000002D80D4040180B2001440696F7340+
	?debug	C 3074696524716E376F73747265616D
	?debug	C E3811D0000002D80D4040980B200
	?debug	C E3811F0000002D04040980B200
	?debug	C E381210000002D04040980B200
	?debug	C E381230000002D04040980B200
	?debug	C E381250000002D04040980B200
	?debug	C E381270000002D04040980B200
	?debug	C E381290000002D01040180B2000E40696F734030+
	?debug	C 636C656172247169
	?debug	C E3812B000400160100
	?debug	C E3812C0000002D812B040980B200
	?debug	C E3812E0000002D04040D80B200
	?debug	C E381310973747265616D62756628002E0E
	?debug	C ED000E000080E80E00
	?debug	C E381320000002D81300401813100144073747265+
	?debug	C 616D62756640302462637472247176
	?debug	C E381340000002D81300401813100174073747265+
	?debug	C 616D6275664030246263747224716E7A6369
	?debug	C E381360000002D01040181310014407374726561+
	?debug	C 6D62756640302462647472247176
	?debug	C E381380000002D81300401813102184073747265+
	?debug	C 616D627566403073657462756624716E7A6369
	?debug	C E3813A0000002D81300409813100
	?debug	C E3813C0000002D81300401813100194073747265+
	?debug	C 616D627566403073657462756624716E7A636969
	?debug	C E3813E0000002D040409813100
	?debug	C E381400000002D040409813100
	?debug	C E381420000002D040409813100
	?debug	C E381440000002D010409813100
	?debug	C E381460000002D04040181310017407374726561+
	?debug	C 6D6275664030736765746E24716E7A6369
	?debug	C E381480000002D0404018131041A407374726561+
	?debug	C 6D6275664030646F5F736765746E24716E7A6369
	?debug	C E3814A0000002D04040181310618407374726561+
	?debug	C 6D6275664030756E646572666C6F77247176
	?debug	C E3814C0000002D040409813100
	?debug	C E3814E0000002D04040181310818407374726561+
	?debug	C 6D6275664030706261636B6661696C247169
	?debug	C E381500000002D040409813100
	?debug	C E381520000002D040409813100
	?debug	C E381540000002D04040181310018407374726561+
	?debug	C 6D6275664030737075746E24716E787A6369
	?debug	C E381560000002D04040181310A1B407374726561+
	?debug	C 6D6275664030646F5F737075746E24716E787A63+
	?debug	C 69
	?debug	C E381580000002D04040181310C17407374726561+
	?debug	C 6D62756640306F766572666C6F77247169
	?debug	C E3815A0000002D040409813100
	?debug	C E3815C0000002D06040181310E20407374726561+
	?debug	C 6D62756640307365656B6F666624716C38736565+
	?debug	C 6B5F64697269
	?debug	C E3815E0000002D06040181311017407374726561+
	?debug	C 6D62756640307365656B706F7324716C69
	?debug	C E381600000002D04040181311213407374726561+
	?debug	C 6D627566403073796E63247176
	?debug	C E381620000002D01040181310012407374726561+
	?debug	C 6D6275664030646270247176
	?debug	C E38164000400160200
	?debug	C E381650000002D81640409813100
	?debug	C E381670000002D81640409813100
	?debug	C E381690000002D040409813100
	?debug	C E3816B0000002D81640409813100
	?debug	C E3816D0000002D81640409813100
	?debug	C E3816F0000002D81640409813100
	?debug	C E381710000002D81640409813100
	?debug	C E381730000002D81640409813100
	?debug	C E381750000002D81640409813100
	?debug	C E381770000002D01040181310017407374726561+
	?debug	C 6D62756640307365747024716E7A637431
	?debug	C E381790000002D01040181310019407374726561+
	?debug	C 6D62756640307365746724716E7A6374317431
	?debug	C E3817B0000002D010409813100
	?debug	C E3817D0000002D010409813100
	?debug	C E3817F0000002D01040181310018407374726561+
	?debug	C 6D62756640307365746224716E7A63743169
	?debug	C E381810000002D010409813100
	?debug	C E381830000002D040409813100
	?debug	C E381850000002D040409813100
	?debug	C E381870000002D04040181311419407374726561+
	?debug	C 6D6275664030646F616C6C6F63617465247176
	?debug	C E381890000002D04040181310018407374726561+
	?debug	C 6D6275664030646F5F736E65787463247176
	?debug	C E3818B0000002D813004018131001E4073747265+
	?debug	C 616D6275664030246263747224716D3973747265+
	?debug	C 616D627566
	?debug	C E3818D0000002D0104058131001E407374726561+
	?debug	C 6D6275664030246261736724716D397374726561+
	?debug	C 6D627566
	?debug	C E3813000040016813100
	?debug	C E3818F0000002D8130040980B200
	?debug	C E381910000002D06040180B2001140696F734030+
	?debug	C 626974616C6C6F63247176
	?debug	C E381930000002D04040180B2000F40696F734030+
	?debug	C 78616C6C6F63247176
	?debug	C E38195000400350600
	?debug	C E381960000002D8195040180B2000E40696F7340+
	?debug	C 3069776F7264247169
	?debug	C E3819800040035812B00
	?debug	C E381990000002D8198040180B2000E40696F7340+
	?debug	C 3070776F7264247169
	?debug	C E3819B0000002D01040180B2001840696F734030+
	?debug	C 73796E635F776974685F737464696F247176
	?debug	C E3819D0000002D04040180B2000D40696F734030+
	?debug	C 736B6970247169
	?debug	C E3819F0000002D80B9040180B2000E40696F7340+
	?debug	C 302462637472247176
	?debug	C E381A10000002D01040180B2001740696F734030+
	?debug	C 696E697424716E3973747265616D627566
	?debug	C E381A30000002D01040180B2001140696F734030+
	?debug	C 7365747374617465247169
	?debug	C E381A600000023010400
	?debug	C E381A50004001681A600
	?debug	C E381A7000400160100
	?debug	C E381A80000002D01040180B2001140696F734030+
	?debug	C 7573657273697A65247169
	?debug	C E381AA0000002D80B9040180B2001240696F7340+
	?debug	C 30246263747224716D33696F73
	?debug	C E381AC0000002D01040580B2001240696F734030+
	?debug	C 246261736724716D33696F73
	?debug	C E380B1076973747265616D32002E0B
	?debug	C ED000B020081220E010C80
	?debug	C E381AE0004001680B100
	?debug	C E381AF0000002D81AE040180B1001C4069737472+
	?debug	C 65616D4030246263747224716E3973747265616D+
	?debug	C 627566
	?debug	C E381B10000002D01040180B10012406973747265+
	?debug	C 616D40302462647472247176
	?debug	C E381B30000002D81AE040180B100264069737472+
	?debug	C 65616D4030246263747224716E3973747265616D+
	?debug	C 627566696E376F73747265616D
	?debug	C E381B50000002D81AE040180B100164069737472+
	?debug	C 65616D403024626374722471696E7A6369
	?debug	C E381B70000002D81AE040180B1001C4069737472+
	?debug	C 65616D40302462637472247169696E376F737472+
	?debug	C 65616D
	?debug	C E381B90000002D04040180B10011406973747265+
	?debug	C 616D403069706678247169
	?debug	C E381BB0000002D04040980B100
	?debug	C E381BD0000002D04040980B100
	?debug	C E381BF0000002D01040980B100
	?debug	C E381C10004003580B100
	?debug	C E381C20000002D81C1040180B100124069737472+
	?debug	C 65616D40307365656B6724716C
	?debug	C E381C40000002D81C1040180B1001B4069737472+
	?debug	C 65616D40307365656B6724716C387365656B5F64+
	?debug	C 6972
	?debug	C E381C60000002D06040180B10012406973747265+
	?debug	C 616D403074656C6C67247176
	?debug	C E381C80000002D04040980B100
	?debug	C E381CA0000002D81C1040180B100154069737472+
	?debug	C 65616D403067657424716E7A63697A63
	?debug	C E381CC0000002D81C1040980B100
	?debug	C E381CE0000002D81C1040180B100144069737472+
	?debug	C 65616D40307265616424716E7A6369
	?debug	C E381D00000002D81C1040980B100
	?debug	C E381D20000002D81C1040180B100194069737472+
	?debug	C 65616D40306765746C696E6524716E7A63697A63
	?debug	C E381D40000002D81C1040980B100
	?debug	C E381D60000002D81C1040180B1001C4069737472+
	?debug	C 65616D403067657424716D3973747265616D6275+
	?debug	C 667A63
	?debug	C E381D80000002D81C1040180B100124069737472+
	?debug	C 65616D403067657424716D7563
	?debug	C E381DA0000002D81C1040180B100124069737472+
	?debug	C 65616D403067657424716D7A63
	?debug	C E381DC0000002D04040180B10010406973747265+
	?debug	C 616D4030676574247176
	?debug	C E381DE0000002D04040980B100
	?debug	C E381E00000002D04040980B100
	?debug	C E381E20000002D81C1040180B100154069737472+
	?debug	C 65616D40307075746261636B24717A63
	?debug	C E381E40000002D81C1040180B100144069737472+
	?debug	C 65616D403069676E6F726524716969
	?debug	C E381E60000002D81C1040D80B100
	?debug	C E381E80000002D81C1040580B1001E4069737472+
	?debug	C 65616D4030246272736824716E716D33696F7324+
	?debug	C 6D33696F73
	?debug	C E381EA0000002D81C1040580B100144069737472+
	?debug	C 65616D4030246272736824716E7A63
	?debug	C E381EC0000002D81C1040D80B100
	?debug	C E381EE0000002D81C1040580B100144069737472+
	?debug	C 65616D4030246272736824716D7563
	?debug	C E381F00000002D81C1040580B100144069737472+
	?debug	C 65616D4030246272736824716D7A63
	?debug	C E381F20000002D81C1040580B100134069737472+
	?debug	C 65616D4030246272736824716D73
	?debug	C E381F40000002D81C1040580B100134069737472+
	?debug	C 65616D4030246272736824716D69
	?debug	C E381F60000002D81C1040580B100134069737472+
	?debug	C 65616D4030246272736824716D6C
	?debug	C E381F80000002D81C1040580B100144069737472+
	?debug	C 65616D4030246272736824716D7573
	?debug	C E381FA0000002D81C1040580B100144069737472+
	?debug	C 65616D4030246272736824716D7569
	?debug	C E381FC0000002D81C1040580B100144069737472+
	?debug	C 65616D4030246272736824716D756C
	?debug	C E381FE0000002D81C1040580B100134069737472+
	?debug	C 65616D4030246272736824716D66
	?debug	C E382000000002D81C1040580B100134069737472+
	?debug	C 65616D4030246272736824716D64
	?debug	C E382020000002D81C1040580B100134069737472+
	?debug	C 65616D4030246272736824716D67
	?debug	C E382040000002D81C1040580B1001C4069737472+
	?debug	C 65616D4030246272736824716E3973747265616D+
	?debug	C 627566
	?debug	C E382060000002D81AE040180B100124069737472+
	?debug	C 65616D40302462637472247176
	?debug	C E382080000002D01040180B10015406973747265+
	?debug	C 616D40306561747768697465247176
	?debug	C E3820A0000002D02040180B10013406973747265+
	?debug	C 616D4030646F5F676574247176
	?debug	C E380B008696F73747265616D38002E0A
	?debug	C ED000A020081530E020B000D00
	?debug	C E3820C0004001680B000
	?debug	C E3820D0000002D820C040180B0001D40696F7374+
	?debug	C 7265616D4030246263747224716E397374726561+
	?debug	C 6D627566
	?debug	C E3820F0000002D01040180B0001340696F737472+
	?debug	C 65616D40302462647472247176
	?debug	C E382110000002D820C040180B0001340696F7374+
	?debug	C 7265616D40302462637472247176
	?debug	C E380AF13696F73747265616D5F77697468617373+
	?debug	C 69676E38002E09
	?debug	C ED0009020081570E010A00
	?debug	C E382130004001680AF00
	?debug	C E382140000002D8213040180AF001E40696F7374+
	?debug	C 7265616D5F7769746861737369676E4030246263+
	?debug	C 7472247176
	?debug	C E382160000002D01040180AF001E40696F737472+
	?debug	C 65616D5F7769746861737369676E403024626474+
	?debug	C 72247176
	?debug	C E382180004003580AF00
	?debug	C E382190000002D8218040580AF002240696F7374+
	?debug	C 7265616D5F7769746861737369676E4030246261+
	?debug	C 736724716D33696F73
	?debug	C E3821B0000002D8218040580AF002840696F7374+
	?debug	C 7265616D5F7769746861737369676E4030246261+
	?debug	C 736724716E3973747265616D627566
	?debug	C E3821D126F73747265616D5F7769746861737369+
	?debug	C 676E30002E0F
	?debug	C ED000F0200815C0E010D00
	?debug	C E3821E00040016821D00
	?debug	C E3821F0000002D821E0401821D001D406F737472+
	?debug	C 65616D5F7769746861737369676E403024626374+
	?debug	C 72247176
	?debug	C E382210000002D010401821D001D406F73747265+
	?debug	C 616D5F7769746861737369676E40302462647472+
	?debug	C 247176
	?debug	C E3822300040035821D00
	?debug	C E382240000002D82230405821D0025406F737472+
	?debug	C 65616D5F7769746861737369676E403024626173+
	?debug	C 6724716D376F73747265616D
	?debug	C E382260000002D82230405821D0027406F737472+
	?debug	C 65616D5F7769746861737369676E403024626173+
	?debug	C 6724716E3973747265616D627566
	?debug	C E38228126973747265616D5F7769746861737369+
	?debug	C 676E32002E10
	?debug	C ED0010020081610E010B00
	?debug	C E3822900040016822800
	?debug	C E3822A0000002D822904018228001D4069737472+
	?debug	C 65616D5F7769746861737369676E403024626374+
	?debug	C 72247176
	?debug	C E3822C0000002D0104018228001D406973747265+
	?debug	C 616D5F7769746861737369676E40302462647472+
	?debug	C 247176
	?debug	C E3822E00040035822800
	?debug	C E3822F0000002D822E0405822800254069737472+
	?debug	C 65616D5F7769746861737369676E403024626173+
	?debug	C 6724716D376973747265616D
	?debug	C E382310000002D822E0405822800274069737472+
	?debug	C 65616D5F7769746861737369676E403024626173+
	?debug	C 6724716E3973747265616D627566
	?debug	C E38233095363686564756C657201002E11
	?debug	C ED0011000081660E00
	?debug	C E382340000002D01040182330016405363686564+
	?debug	C 756C6572403070757424716E33504342
	?debug	C E382360000002D3E040182330012405363686564+
	?debug	C 756C65724030676574247176
	?debug	C E382380554696D657201002E12
	?debug	C ED0012000081690E00
	?debug	C E382390000002D0104018238000F4054696D6572+
	?debug	C 4030696E6974247176
	?debug	C E3823B0000002D010401823800124054696D6572+
	?debug	C 4030726573746F7265247176
	?debug	C E3823D00000023010400
	?debug	C EC0C406469737061746368247176823D1800
	?debug	C E3823E00000023010400
	?debug	C EB0B40246264656C6524716E76823E00
	?debug	C E3823F00000023812B0400
	?debug	C EB0A4024626E657724717569823F00
	?debug	C E61452696F73747265616D5F7769746861737369+
	?debug	C 676E821806001450696F73747265616D5F776974+
	?debug	C 6861737369676E8213060013526F73747265616D+
	?debug	C 5F7769746861737369676E8223060013506F7374+
	?debug	C 7265616D5F7769746861737369676E821E060013+
	?debug	C 526973747265616D5F7769746861737369676E82+
	?debug	C 2E060013506973747265616D5F77697468617373+
	?debug	C 69676E822906000950696F73747265616D820C06+
	?debug	C 0008526F73747265616D80E2060008506F737472+
	?debug	C 65616D80D4060008526973747265616D81C10600+
	?debug	C 08506973747265616D81AE06000A507374726561+
	?debug	C 6D627566813006000450696F7380B90600097374+
	?debug	C 7265616D6F66660606000973747265616D706F73+
	?debug	C 06060009707472646966665F740606000666706F+
	?debug	C 735F740606000673697A655F740A060008536967+
	?debug	C 6E616C49640A06000D5369676E616C48616E646C+
	?debug	C 65721C06000249440406000454696D650A060009+
	?debug	C 537461636B53697A650C06000E696F735F757365+
	?debug	C 725F756E696F6E01070013696F73747265616D5F+
	?debug	C 7769746861737369676E80AF0700126F73747265+
	?debug	C 616D5F7769746861737369676E821D0700126973+
	?debug	C 747265616D5F7769746861737369676E82280700+
	?debug	C 08696F73747265616D80B00700076F7374726561+
	?debug	C 6D80D50700076973747265616D80B10700097374+
	?debug	C 7265616D6275668131070003696F7380B2070009+
	?debug	C 5363686564756C6572823307000A3C74656D706C+
	?debug	C 6174653E7707000A3C74656D706C6174653E5D07+
	?debug	C 000A3C74656D706C6174653E4507000653746174+
	?debug	C 65734207000554696D6572823807000654687265+
	?debug	C 6164190700035043423F0700
	?debug	C E248114054687265616440307374617274247176+
	?debug	C 1E481A40546872656164403077616974546F436F+
	?debug	C 6D706C657465247176204D114054687265616440+
	?debug	C 3024626474722471762248114054687265616440+
	?debug	C 3067657449642471762448184054687265616440+
	?debug	C 3067657452756E6E696E67496424717626481940+
	?debug	C 5468726561644030676574546872656164427949+
	?debug	C 642471692848134054687265616440307369676E+
	?debug	C 616C247175692A48214054687265616440307265+
	?debug	C 67697374657248616E646C6572247175696E7176+
	?debug	C 24762C4822405468726561644030756E72656769+
	?debug	C 73746572416C6C48616E646C657273247175692E+
	?debug	C 481840546872656164403073776170247175696E+
	?debug	C 717624767432304818405468726561644030626C+
	?debug	C 6F636B5369676E616C2471756932482040546872+
	?debug	C 6561644030626C6F636B5369676E616C476C6F62+
	?debug	C 616C6C792471756934481A405468726561644030+
	?debug	C 756E626C6F636B5369676E616C24717569364822+
	?debug	C 405468726561644030756E626C6F636B5369676E+
	?debug	C 616C476C6F62616C6C7924717569384A14405468+
	?debug	C 72656164403024626374722471756C75693A4C0F+
	?debug	C 40546872656164403072756E2471763C40040000+
	?debug	C 0000056D795043423EC008000000
	?debug	C E2600D40504342403072756E6E696E6740000573+
	?debug	C 7461636B41000273730A000273700A000262700A+
	?debug	C 00056B76616E740A00096C6F636B436F756E7404+
	?debug	C 0002696404000B74696D65556E626C6F636B0400+
	?debug	C 0573746174654200086D7954687265616418600B+
	?debug	C 4050434240304D4158494404000E7369676E616C+
	?debug	C 48616E646C65727344000D616374697665536967+
	?debug	C 6E616C735D000A7369676E616C4C6F636B756016+
	?debug	C 405043424030676C6F62616C5369676E616C4C6F+
	?debug	C 636B760006706172656E743E600C405043424030+
	?debug	C 616C6C504342770007626C6F636B656477600D40+
	?debug	C 5043424030696E697469616C40600E4050434240+
	?debug	C 3064756D6D795043424060144050434240307275+
	?debug	C 6E6E696E675468726561647304600D4050434240+
	?debug	C 30706F6D6C6973745D4A11405043424030246263+
	?debug	C 74722471756C7569808D4A194050434240302462+
	?debug	C 63747224716E36546872656164756C7569808F48+
	?debug	C 174050434240307772617070657224716E365468+
	?debug	C 7265616480914818405043424030616464546F41+
	?debug	C 6C6C50434224716E335043428093481D40504342+
	?debug	C 403064656C65746546726F6D416C6C5043422471+
	?debug	C 6E335043428095481D405043424030616464546F+
	?debug	C 426C6F636B65644C69737424716E335043428097+
	?debug	C 4814405043424030756E626C6F636B416C6C2477+
	?debug	C 71768099490E4050434240302462647472247176+
	?debug	C 809B48114050434240307369676E616C24777175+
	?debug	C 69809D481E405043424030726567697374657248+
	?debug	C 616E646C6572247175696E71762476809F481F40+
	?debug	C 5043424030756E7265676973746572416C6C4861+
	?debug	C 6E646C6572732471756980A14815405043424030+
	?debug	C 73776170247175696E71762476743280A3481540+
	?debug	C 5043424030626C6F636B5369676E616C24717569+
	?debug	C 80A5481D405043424030626C6F636B5369676E61+
	?debug	C 6C476C6F62616C6C792471756980A74817405043+
	?debug	C 424030756E626C6F636B5369676E616C24717569+
	?debug	C 80A9481F405043424030756E626C6F636B536967+
	?debug	C 6E616C476C6F62616C6C792471756980AB481340+
	?debug	C 5043424030646F5369676E616C732477717680AD+
	?debug	C C0A8000000
	?debug	C E40004444F4E4500000005524541445901000004+
	?debug	C 4D41444502008007424C4F434B45440300
	?debug	C E27001541C70044E6F64654600066C656E677468+
	?debug	C 0400046865616447481840254C69737424746E71+
	?debug	C 76247625406572617365247771764A481B40254C+
	?debug	C 69737424746E717624762540707573682477716E+
	?debug	C 717624764C481F40254C69737424746E71762476+
	?debug	C 2540707573684261636B2477716E717624764E48+
	?debug	C 1640254C69737424746E717624762540706F7024+
	?debug	C 77717650491740254C69737424746E7176247625+
	?debug	C 40246264747224717652482040254C6973742474+
	?debug	C 6E71762476254064656C65746576616C2477716E+
	?debug	C 7176247654482D40254C69737424746E71762476+
	?debug	C 254064656C4E6F646524716E3138254C69737424+
	?debug	C 746E7176247625404E6F646556481940254C6973+
	?debug	C 7424746E71762476254067657448656164247176+
	?debug	C 584A1740254C69737424746E7176247625402462+
	?debug	C 6374722471765BC006000000
	?debug	C E2000376616C1C00046E657874474A2140254C69+
	?debug	C 737424746E7176247625404E6F64654030246263+
	?debug	C 747224716E7176247648C008000000
	?debug	C E27001540A70044E6F64655E00066C656E677468+
	?debug	C 040004686561645F481540254C69737424747569+
	?debug	C 254065726173652477717662481540254C697374+
	?debug	C 2474756925407075736824777175696448194025+
	?debug	C 4C697374247475692540707573684261636B2477+
	?debug	C 71756966481340254C697374247475692540706F+
	?debug	C 702477717668491440254C697374247475692540+
	?debug	C 24626474722471766A481A40254C697374247475+
	?debug	C 69254064656C65746576616C24777175696C4827+
	?debug	C 40254C69737424747569254064656C4E6F646524+
	?debug	C 716E3135254C6973742474756925404E6F64656E+
	?debug	C 481640254C697374247475692540676574486561+
	?debug	C 64247176704A1440254C69737424747569254024+
	?debug	C 6263747224717673C006000000
	?debug	C E2000376616C0A00046E6578745F4A1B40254C69+
	?debug	C 73742474756925404E6F64654030246263747224+
	?debug	C 71756960C006000000
	?debug	C E27001543E70044E6F64651B00066C656E677468+
	?debug	C 040004686561641A481840254C69737424746E33+
	?debug	C 50434225406572617365247771767A481B40254C+
	?debug	C 69737424746E335043422540707573682477716E+
	?debug	C 335043427C481F40254C69737424746E33504342+
	?debug	C 2540707573684261636B2477716E335043427E48+
	?debug	C 1640254C69737424746E335043422540706F7024+
	?debug	C 7771768080491740254C69737424746E33504342+
	?debug	C 254024626474722471768082482040254C697374+
	?debug	C 24746E33504342254064656C65746576616C2477+
	?debug	C 716E335043428084482D40254C69737424746E33+
	?debug	C 504342254064656C4E6F646524716E3138254C69+
	?debug	C 737424746E3350434225404E6F64658086481940+
	?debug	C 254C69737424746E335043422540676574486561+
	?debug	C 6424717680884A1740254C69737424746E335043+
	?debug	C 4225402462637472247176808BC006000000
	?debug	C E2000376616C3E00046E6578741A4A2140254C69+
	?debug	C 737424746E3350434225404E6F64654030246263+
	?debug	C 747224716E3350434278C008000000
	?debug	C E27008696F5F737461746580B370096F70656E5F+
	?debug	C 6D6F646580B570087365656B5F64697280B7600F+
	?debug	C 40696F734030626173656669656C640660114069+
	?debug	C 6F73403061646A7573746669656C640660104069+
	?debug	C 6F734030666C6F61746669656C64064A1840696F+
	?debug	C 734030246263747224716E3973747265616D6275+
	?debug	C 6680BA4D0E40696F734030246264747224717680+
	?debug	C BC480E40696F734030666C61677324717680BE48+
	?debug	C 0E40696F734030666C61677324716C80C0480E40+
	?debug	C 696F7340307365746624716C6C80C2480D40696F+
	?debug	C 7340307365746624716C80C4480F40696F734030+
	?debug	C 756E7365746624716C80C6480E40696F73403077+
	?debug	C 6964746824717680C8480E40696F734030776964+
	?debug	C 746824716980CA480D40696F73403066696C6C24+
	?debug	C 717680CC480E40696F73403066696C6C24717A63+
	?debug	C 80CE481240696F734030707265636973696F6E24+
	?debug	C 716980D0481240696F734030707265636973696F+
	?debug	C 6E24717680D2481440696F73403074696524716E+
	?debug	C 376F73747265616D811B480C40696F7340307469+
	?debug	C 65247176811D481040696F734030726473746174+
	?debug	C 65247176811F480C40696F734030656F66247176+
	?debug	C 8121480D40696F7340306661696C247176812348+
	?debug	C 0C40696F7340306261642471768125480D40696F+
	?debug	C 734030676F6F642471768127480E40696F734030+
	?debug	C 636C65617224716981294B0D40696F734030246F+
	?debug	C 6E76247176812C480E40696F73403024626E6F74+
	?debug	C 247176812E480E40696F73403072646275662471+
	?debug	C 76818F481140696F734030626974616C6C6F6324+
	?debug	C 71768191480F40696F73403078616C6C6F632471+
	?debug	C 768193480E40696F73403069776F726424716981+
	?debug	C 96480E40696F73403070776F7264247169819948+
	?debug	C 1840696F73403073796E635F776974685F737464+
	?debug	C 696F247176819B480D40696F734030736B697024+
	?debug	C 7169819D40040000000002627081300005785F74+
	?debug	C 696580D400057374617465040008697370656369+
	?debug	C 616C0400086F7370656369616C040007785F666C+
	?debug	C 61677306000B785F707265636973696F6E040007+
	?debug	C 785F7769647468040006785F66696C6C04000C69+
	?debug	C 7366785F7370656369616C04000C6F7366785F73+
	?debug	C 70656369616C04000664656C62756604000E6173+
	?debug	C 7369676E5F70726976617465044A0E40696F7340+
	?debug	C 302462637472247176819F481740696F73403069+
	?debug	C 6E697424716E3973747265616D62756681A14811+
	?debug	C 40696F734030736574737461746524716981A360+
	?debug	C 1040696F734030737464696F666C75736881A560+
	?debug	C 0D40696F7340306E65787462697406600F40696F+
	?debug	C 73403075736572636F756E740400097573657277+
	?debug	C 6F72647381A700066E776F72647304481140696F+
	?debug	C 7340307573657273697A6524716981A84A124069+
	?debug	C 6F734030246263747224716D33696F7381AA4812+
	?debug	C 40696F734030246261736724716D33696F7381AC+
	?debug	C C02A000000
	?debug	C E4000D40696F734030676F6F646269740000000C+
	?debug	C 40696F734030656F666269740100000D40696F73+
	?debug	C 40306661696C6269740200000C40696F73403062+
	?debug	C 61646269740400800E40696F7340306861726466+
	?debug	C 61696C8000
	?debug	C E4000840696F734030696E0100000940696F7340+
	?debug	C 306F75740200000940696F734030617465040000+
	?debug	C 0940696F7340306170700800000B40696F734030+
	?debug	C 7472756E631000000E40696F7340306E6F637265+
	?debug	C 6174652000000F40696F7340306E6F7265706C61+
	?debug	C 63654000800C40696F73403062696E6172798000
	?debug	C E4000940696F7340306265670000000940696F73+
	?debug	C 40306375720100800940696F734030656E640200
	?debug	C E24A1C406F73747265616D403024626374722471+
	?debug	C 6E3973747265616D62756680D64D12406F737472+
	?debug	C 65616D4030246264747224717680D84A12406F73+
	?debug	C 747265616D4030246263747224716980DA4A1540+
	?debug	C 6F73747265616D403024626374722471696E7A63+
	?debug	C 80DC4811406F73747265616D40306F7066782471+
	?debug	C 7680DE4811406F73747265616D40306F73667824+
	?debug	C 717680E04812406F73747265616D4030666C7573+
	?debug	C 6824717680E34812406F73747265616D40307365+
	?debug	C 656B7024716C80E5481B406F73747265616D4030+
	?debug	C 7365656B7024716C387365656B5F64697280E748+
	?debug	C 12406F73747265616D403074656C6C7024717680+
	?debug	C E94811406F73747265616D403070757424717A63+
	?debug	C 80EB4816406F73747265616D4030777269746524+
	?debug	C 716E787A636980ED4816406F73747265616D4030+
	?debug	C 777269746524716E7875636980EF4813406F7374+
	?debug	C 7265616D403024626C736824717A6380F1481340+
	?debug	C 6F73747265616D403024626C73682471756380F3+
	?debug	C 4812406F73747265616D403024626C7368247173+
	?debug	C 80F54813406F73747265616D403024626C736824+
	?debug	C 71757380F74812406F73747265616D403024626C+
	?debug	C 736824716980F94813406F73747265616D403024+
	?debug	C 626C73682471756980FB4812406F73747265616D+
	?debug	C 403024626C736824716C80FD4813406F73747265+
	?debug	C 616D403024626C73682471756C80FF4812406F73+
	?debug	C 747265616D403024626C73682471668101481240+
	?debug	C 6F73747265616D403024626C7368247164810348+
	?debug	C 12406F73747265616D403024626C736824716781+
	?debug	C 054815406F73747265616D403024626C73682471+
	?debug	C 6E787A6381074815406F73747265616D40302462+
	?debug	C 6C736824716E78756381094813406F7374726561+
	?debug	C 6D403024626C736824716E76810B481C406F7374+
	?debug	C 7265616D403024626C736824716E397374726561+
	?debug	C 6D627566810D4826406F73747265616D40302462+
	?debug	C 6C736824716E716D376F73747265616D246D376F+
	?debug	C 73747265616D810F481E406F73747265616D4030+
	?debug	C 24626C736824716E716D33696F73246D33696F73+
	?debug	C 81114814406F73747265616D4030646F5F6F7066+
	?debug	C 7824717681134814406F73747265616D4030646F+
	?debug	C 5F6F73667824717681154A12406F73747265616D+
	?debug	C 4030246263747224717681174818406F73747265+
	?debug	C 616D40306F757473747224716E787A6374318119+
	?debug	C C030000000
	?debug	C E24A144073747265616D62756640302462637472+
	?debug	C 24717681324A174073747265616D627566403024+
	?debug	C 6263747224716E7A636981344D14407374726561+
	?debug	C 6D6275664030246264747224717681364C184073+
	?debug	C 747265616D627566403073657462756624716E7A+
	?debug	C 6369813848184073747265616D62756640307365+
	?debug	C 7462756624716E756369813A4819407374726561+
	?debug	C 6D627566403073657462756624716E7A63696981+
	?debug	C 3C48144073747265616D62756640307367657463+
	?debug	C 247176813E48154073747265616D627566403073+
	?debug	C 6E65787463247176814048154073747265616D62+
	?debug	C 756640307362756D706324717681424815407374+
	?debug	C 7265616D627566403073746F7373632471768144+
	?debug	C 48174073747265616D6275664030736765746E24+
	?debug	C 716E7A636981464C1A4073747265616D62756640+
	?debug	C 30646F5F736765746E24716E7A636981484C1840+
	?debug	C 73747265616D6275664030756E646572666C6F77+
	?debug	C 247176814A48194073747265616D627566403073+
	?debug	C 7075746261636B6324717A63814C4C1840737472+
	?debug	C 65616D6275664030706261636B6661696C247169+
	?debug	C 814E48174073747265616D6275664030696E5F61+
	?debug	C 7661696C247176815048144073747265616D6275+
	?debug	C 6640307370757463247169815248184073747265+
	?debug	C 616D6275664030737075746E24716E787A636981+
	?debug	C 544C1B4073747265616D6275664030646F5F7370+
	?debug	C 75746E24716E787A636981564C17407374726561+
	?debug	C 6D62756640306F766572666C6F77247169815848+
	?debug	C 1A4073747265616D62756640306F75745F776169+
	?debug	C 74696E67247176815A4C204073747265616D6275+
	?debug	C 6640307365656B6F666624716C387365656B5F64+
	?debug	C 697269815C4C174073747265616D627566403073+
	?debug	C 65656B706F7324716C69815E4C13407374726561+
	?debug	C 6D627566403073796E6324717681604812407374+
	?debug	C 7265616D62756640306462702471768162481340+
	?debug	C 73747265616D6275664030626173652471768165+
	?debug	C 48134073747265616D6275664030656275662471+
	?debug	C 76816748134073747265616D6275664030626C65+
	?debug	C 6E247176816948144073747265616D6275664030+
	?debug	C 7062617365247176816B48134073747265616D62+
	?debug	C 7566403070707472247176816D48144073747265+
	?debug	C 616D62756640306570707472247176816F481440+
	?debug	C 73747265616D6275664030656261636B24717681+
	?debug	C 7148134073747265616D62756640306770747224+
	?debug	C 7176817348144073747265616D62756640306567+
	?debug	C 707472247176817548174073747265616D627566+
	?debug	C 40307365747024716E7A63743181774819407374+
	?debug	C 7265616D62756640307365746724716E7A637431+
	?debug	C 7431817948144073747265616D62756640307062+
	?debug	C 756D70247169817B48144073747265616D627566+
	?debug	C 40306762756D70247169817D4818407374726561+
	?debug	C 6D62756640307365746224716E7A63743169817F+
	?debug	C 48194073747265616D6275664030756E62756666+
	?debug	C 65726564247169818148194073747265616D6275+
	?debug	C 664030756E627566666572656424717681834817+
	?debug	C 4073747265616D6275664030616C6C6F63617465+
	?debug	C 24717681854C194073747265616D627566403064+
	?debug	C 6F616C6C6F636174652471768187400400000000+
	?debug	C 06616C6C6F635F040006756E6275665F04000562+
	?debug	C 6173655F81640005656275665F81640006706261+
	?debug	C 73655F81640005707074725F8164000665707074+
	?debug	C 725F81640006656261636B5F8164000567707472+
	?debug	C 5F8164000665677074725F816448184073747265+
	?debug	C 616D6275664030646F5F736E6578746324717681+
	?debug	C 894A1E4073747265616D62756640302462637472+
	?debug	C 24716D3973747265616D627566818B481E407374+
	?debug	C 7265616D6275664030246261736724716D397374+
	?debug	C 7265616D627566818DC028000000
	?debug	C E24A1C406973747265616D403024626374722471+
	?debug	C 6E3973747265616D62756681AF4D124069737472+
	?debug	C 65616D4030246264747224717681B14A26406973+
	?debug	C 747265616D4030246263747224716E3973747265+
	?debug	C 616D627566696E376F73747265616D81B34A1640+
	?debug	C 6973747265616D403024626374722471696E7A63+
	?debug	C 6981B54A1C406973747265616D40302462637472+
	?debug	C 247169696E376F73747265616D81B74811406973+
	?debug	C 747265616D40306970667824716981B948124069+
	?debug	C 73747265616D4030697066783024717681BB4812+
	?debug	C 406973747265616D4030697066783124717681BD+
	?debug	C 4811406973747265616D40306973667824717681+
	?debug	C BF4812406973747265616D40307365656B672471+
	?debug	C 6C81C2481B406973747265616D40307365656B67+
	?debug	C 24716C387365656B5F64697281C4481240697374+
	?debug	C 7265616D403074656C6C6724717681C648114069+
	?debug	C 73747265616D403073796E6324717681C8481540+
	?debug	C 6973747265616D403067657424716E7A63697A63+
	?debug	C 81CA4815406973747265616D403067657424716E+
	?debug	C 7563697A6381CC4814406973747265616D403072+
	?debug	C 65616424716E7A636981CE481440697374726561+
	?debug	C 6D40307265616424716E75636981D04819406973+
	?debug	C 747265616D40306765746C696E6524716E7A6369+
	?debug	C 7A6381D24819406973747265616D40306765746C+
	?debug	C 696E6524716E7563697A6381D4481C4069737472+
	?debug	C 65616D403067657424716D3973747265616D6275+
	?debug	C 667A6381D64812406973747265616D4030676574+
	?debug	C 24716D756381D84812406973747265616D403067+
	?debug	C 657424716D7A6381DA4810406973747265616D40+
	?debug	C 3067657424717681DC4811406973747265616D40+
	?debug	C 307065656B24717681DE4813406973747265616D+
	?debug	C 403067636F756E7424717681E048154069737472+
	?debug	C 65616D40307075746261636B24717A6381E24814+
	?debug	C 406973747265616D403069676E6F726524716969+
	?debug	C 81E44826406973747265616D4030246272736824+
	?debug	C 716E716D376973747265616D246D376973747265+
	?debug	C 616D81E6481E406973747265616D403024627273+
	?debug	C 6824716E716D33696F73246D33696F7381E84814+
	?debug	C 406973747265616D4030246272736824716E7A63+
	?debug	C 81EA4814406973747265616D4030246272736824+
	?debug	C 716E756381EC4814406973747265616D40302462+
	?debug	C 72736824716D756381EE4814406973747265616D+
	?debug	C 4030246272736824716D7A6381F0481340697374+
	?debug	C 7265616D4030246272736824716D7381F2481340+
	?debug	C 6973747265616D4030246272736824716D6981F4+
	?debug	C 4813406973747265616D4030246272736824716D+
	?debug	C 6C81F64814406973747265616D40302462727368+
	?debug	C 24716D757381F84814406973747265616D403024+
	?debug	C 6272736824716D756981FA481440697374726561+
	?debug	C 6D4030246272736824716D756C81FC4813406973+
	?debug	C 747265616D4030246272736824716D6681FE4813+
	?debug	C 406973747265616D4030246272736824716D6482+
	?debug	C 004813406973747265616D403024627273682471+
	?debug	C 6D678202481C406973747265616D403024627273+
	?debug	C 6824716E3973747265616D62756682044A124069+
	?debug	C 73747265616D4030246263747224717682064815+
	?debug	C 406973747265616D403065617477686974652471+
	?debug	C 7682084006000000000767636F756E745F044813+
	?debug	C 406973747265616D4030646F5F67657424717682+
	?debug	C 0AC032000000
	?debug	C E24A1D40696F73747265616D4030246263747224+
	?debug	C 716E3973747265616D627566820D4D1340696F73+
	?debug	C 747265616D40302462647472247176820F4A1340+
	?debug	C 696F73747265616D403024626374722471768211+
	?debug	C C038000000
	?debug	C E24A1E40696F73747265616D5F77697468617373+
	?debug	C 69676E4030246263747224717682144D1E40696F+
	?debug	C 73747265616D5F7769746861737369676E403024+
	?debug	C 626474722471768216482240696F73747265616D+
	?debug	C 5F7769746861737369676E403024626173672471+
	?debug	C 6D33696F738219482840696F73747265616D5F77+
	?debug	C 69746861737369676E4030246261736724716E39+
	?debug	C 73747265616D627566821BC038000000
	?debug	C E24A1D406F73747265616D5F7769746861737369+
	?debug	C 676E40302462637472247176821F4D1D406F7374+
	?debug	C 7265616D5F7769746861737369676E4030246264+
	?debug	C 747224717682214825406F73747265616D5F7769+
	?debug	C 746861737369676E4030246261736724716D376F+
	?debug	C 73747265616D82244827406F73747265616D5F77+
	?debug	C 69746861737369676E4030246261736724716E39+
	?debug	C 73747265616D6275668226C030000000
	?debug	C E24A1D406973747265616D5F7769746861737369+
	?debug	C 676E40302462637472247176822A4D1D40697374+
	?debug	C 7265616D5F7769746861737369676E4030246264+
	?debug	C 7472247176822C4825406973747265616D5F7769+
	?debug	C 746861737369676E4030246261736724716D3769+
	?debug	C 73747265616D822F4827406973747265616D5F77+
	?debug	C 69746861737369676E4030246261736724716E39+
	?debug	C 73747265616D6275668231C032000000
	?debug	C E24816405363686564756C657240307075742471+
	?debug	C 6E3350434282344812405363686564756C657240+
	?debug	C 306765742471768236C001000000
	?debug	C E2600E4054696D6572403062726F6A61630A6023+
	?debug	C 4054696D657240307A6168746576616E615F7072+
	?debug	C 6F6D656E615F6B6F6E74656B7374610A60154054+
	?debug	C 696D65724030676C6F62616C4C6F636B436E7404+
	?debug	C 60174054696D65724030706F7A76616E5F646973+
	?debug	C 70617463680460124054696D657240306E656564+
	?debug	C 546F4B696C6C04480F4054696D65724030696E69+
	?debug	C 74247176823948124054696D6572403072657374+
	?debug	C 6F7265247176823BC001000000
	end
