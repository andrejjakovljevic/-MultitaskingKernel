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
	?debug	S "kersem.cpp"
	?debug	C E9E0AC93500A6B657273656D2E637070
	?debug	C E99A7683500D2E2E5C685C6B657273656D2E68
	?debug	C E9D99B7D500F2E2E5C685C73656D6170686F722E68
	?debug	C E9E27AA5500C2E2E5C685C6C697374612E68
	?debug	C E94029CA1817633A5C626333315C696E636C7564655C737464696F+
	?debug	C 2E68
	?debug	C E94029CA1817633A5C626333315C696E636C7564655C5F64656673+
	?debug	C 2E68
	?debug	C E94029CA1818633A5C626333315C696E636C7564655C5F6E66696C+
	?debug	C 652E68
	?debug	C E94029CA1817633A5C626333315C696E636C7564655C5F6E756C6C+
	?debug	C 2E68
	?debug	C E970B1A2500A2E2E5C685C7063622E68
	?debug	C E97B70A2500D2E2E5C685C7468726561642E68
	?debug	C E9E27AA5500C2E2E5C685C6C697374612E68
	?debug	C E9C19894500C2E2E5C685C74696D65722E68
	?debug	C E9A58983500E2E2E5C685C50434274696D652E68
	?debug	C E970B1A2500A2E2E5C685C7063622E68
	?debug	C E94A7DA5500D2E2E5C685C6C69737461322E68
	?debug	C E94A7DA5500D2E2E5C685C6C69737461322E68
	?debug	C E94A72A2500D2E2E5C685C6D6163726F732E68
	?debug	C E970B1A2500A2E2E5C685C7063622E68
	?debug	C E9DB767A400F2E2E5C685C5343484544554C452E48
	?debug	C E94029CA1817633A5C626333315C696E636C7564655C737464696F+
	?debug	C 2E68
	?debug	C E94029CA181A633A5C626333315C696E636C7564655C696F737472+
	?debug	C 65616D2E68
	?debug	C E94029CA1815633A5C626333315C696E636C7564655C6D656D2E68
KERSEM_TEXT	segment byte public 'CODE'
KERSEM_TEXT	ends
	assume	cs:KERSEM_TEXT,ds:KERSEM_DATA
KERSEM_DATA	segment word public 'FAR_DATA'
d@	label	byte
d@w	label	word
b@	label	byte
b@w	label	word
KERSEM_DATA	ends
KERSEM5_DATA	segment para public 'FAR_DATA'
@KernelSem@0allSemaphores	label	word
	db	6 dup (?)
KERSEM5_DATA	ends
KERSEM_TEXT	segment byte public 'CODE'
	?debug	C E8010A6B657273656D2E637070E0AC9350
   ;	
   ;	KernelSem::KernelSem(Semaphore* sem, int init)
   ;	
	?debug	L 10
	assume	cs:KERSEM_TEXT
@KernelSem@0$bctr$qn9Semaphorei	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,KERSEM_DATA
	mov	ds,ax
	?debug	C F81F404B65726E656C53656D4030246263747224+
	?debug	C 716E3953656D6170686F726569
	?debug	C E318000400161900
	?debug	C E31A000400161B00
	?debug	C E604696E6974040A0E00000373656D1A0A0A0000+
	?debug	C 04746869731802060000
	?debug	B
   ;	
   ;	{
   ;	
	?debug	L 11
	mov	ax,word ptr [bp+6]
	or	ax,word ptr [bp+8]
	jne	short @1@86
	mov	ax,14
	push	ax
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp+8],dx
	mov	word ptr [bp+6],ax
	or	ax,dx
	je	short @1@254
@1@86:
	mov	ax,word ptr [bp+6]
	add	ax,8
	push	word ptr [bp+8]
	push	ax
	call	far ptr @@%ListVal$t12PCBtime@Elem%@$bctr$qv
	pop	cx
	pop	cx
   ;	
   ;	    softlock;
   ;	
	?debug	L 12
 	pushf	
 	cli	
   ;	
   ;	    mySem=sem;
   ;	
	?debug	L 13
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp+12]
	mov	dx,word ptr [bp+10]
	mov	word ptr es:[bx+4],ax
	mov	word ptr es:[bx+2],dx
   ;	
   ;	    val=init;
   ;	
	?debug	L 14
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp+14]
	mov	word ptr es:[bx],ax
   ;	
   ;	    if (val<0) val=0;
   ;	
	?debug	L 15
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx],0
	jge	short @1@226
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx],0
@1@226:
   ;	
   ;	    softunlock;
   ;	
	?debug	L 16
 	popf	
@1@254:
   ;	
   ;	}
   ;	
	?debug	L 17
	mov	dx,word ptr [bp+8]
	mov	ax,word ptr [bp+6]
	jmp	short @1@282
@1@282:
	pop	ds
	pop	bp
	ret	
	?debug	C E6047468697318020600000373656D1A0A0A0000+
	?debug	C 04696E6974040A0E0000
	?debug	E
	?debug	E
@KernelSem@0$bctr$qn9Semaphorei	endp
   ;	
   ;	void KernelSem::block(Time maxTimeToWait)
   ;	
	?debug	L 19
	assume	cs:KERSEM_TEXT
@KernelSem@0block$qui	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,KERSEM_DATA
	mov	ds,ax
	?debug	C F815404B65726E656C53656D4030626C6F636B24+
	?debug	C 717569
	?debug	C E60D6D617854696D65546F576169740A0A0A0000+
	?debug	C 04746869731802060000
	?debug	B
   ;	
   ;	{
   ;	    softlock;
   ;	
	?debug	L 21
 	pushf	
 	cli	
   ;	
   ;	    PCB::running->state=BLOCKED;
   ;	
	?debug	L 22
	mov	ax,seg @PCB@0running
	mov	es,ax
	les	bx,dword ptr es:@PCB@0running
	mov	word ptr es:[bx+18],3
   ;	
   ;	    blocked.addPCB((PCB*)PCB::running,maxTimeToWait);
   ;	
	?debug	L 23
	push	word ptr [bp+10]
	mov	ax,seg @PCB@0running
	mov	es,ax
	push	word ptr es:@PCB@0running+2
	push	word ptr es:@PCB@0running
	mov	ax,word ptr [bp+6]
	add	ax,6
	push	word ptr [bp+8]
	push	ax
	call	far ptr @PCBtime@0addPCB$qn3PCBui
	add	sp,10
   ;	
   ;	    dispatch();
   ;	
	?debug	L 24
	call	far ptr @dispatch$qv
   ;	
   ;	    softunlock;
   ;	
	?debug	L 25
 	popf	
   ;	
   ;	}
   ;	
	?debug	L 26
	pop	ds
	pop	bp
	ret	
	?debug	C E6047468697318020600000D6D617854696D6554+
	?debug	C 6F576169740A0A0A0000
	?debug	E
	?debug	E
@KernelSem@0block$qui	endp
   ;	
   ;	void KernelSem::unblock()
   ;	
	?debug	L 28
	assume	cs:KERSEM_TEXT
@KernelSem@0unblock$qv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,KERSEM_DATA
	mov	ds,ax
	?debug	C F816404B65726E656C53656D4030756E626C6F63+
	?debug	C 6B247176
	?debug	C E604746869731802060000
	?debug	B
   ;	
   ;	{
   ;	    /*softlock;
   ;	    printf("u unblock\n");
   ;	    softunlock;*/
   ;	    if (blocked.lista.length==0) return;
   ;	
	?debug	L 33
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+8],0
	jne	short @3@86
	jmp	short @3@198
@3@86:
   ;	
   ;	    softlock;
   ;	
	?debug	L 34
 	pushf	
 	cli	
   ;	
   ;	    blocked.signalOne();
   ;	
	?debug	L 35
	mov	ax,word ptr [bp+6]
	add	ax,6
	push	word ptr [bp+8]
	push	ax
	call	far ptr @PCBtime@0signalOne$qv
	pop	cx
	pop	cx
   ;	
   ;	    softunlock;
   ;	
	?debug	L 36
 	popf	
@3@198:
   ;	
   ;	}
   ;	
	?debug	L 37
	pop	ds
	pop	bp
	ret	
	?debug	C E604746869731802060000
	?debug	E
	?debug	E
@KernelSem@0unblock$qv	endp
   ;	
   ;	int KernelSem::wait(Time maxTimeToWait)
   ;	
	?debug	L 39
	assume	cs:KERSEM_TEXT
@KernelSem@0wait$qui	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	sub	sp,2
	push	si
	push	ds
	mov	ax,KERSEM_DATA
	mov	ds,ax
	?debug	C F814404B65726E656C53656D4030776169742471+
	?debug	C 7569
	?debug	C E60D6D617854696D65546F576169740A0A0A0000+
	?debug	C 04746869731802060000
	mov	si,word ptr [bp+10]
	?debug	B
   ;	
   ;	{
   ;	    softlock;
   ;	
	?debug	L 41
 	pushf	
 	cli	
   ;	
   ;	    val--;
   ;	
	?debug	L 42
	les	bx,dword ptr [bp+6]
	dec	word ptr es:[bx]
   ;	
   ;	    if (maxTimeToWait==0) maxTimeToWait=-1;
   ;	
	?debug	L 43
	or	si,si
	jne	short @4@142
	mov	si,-1
@4@142:
   ;	
   ;	    if (val<0) block(maxTimeToWait);
   ;	
	?debug	L 44
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx],0
	jge	short @4@198
	push	si
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @KernelSem@0block$qui
	add	sp,6
@4@198:
   ;	
   ;	    /*softlock;
   ;	    printf("val=%d\n",PCB::running->timeUnblock);
   ;	    softunlock;*/
   ;	    int ret=1-PCB::running->timeUnblock;
   ;	
	?debug	L 48
	mov	ax,seg @PCB@0running
	mov	es,ax
	les	bx,dword ptr es:@PCB@0running
	mov	ax,1
	sub	ax,word ptr es:[bx+16]
	mov	word ptr [bp-2],ax
   ;	
   ;	    PCB::running->timeUnblock=0;
   ;	
	?debug	L 49
	mov	ax,seg @PCB@0running
	mov	es,ax
	les	bx,dword ptr es:@PCB@0running
	mov	word ptr es:[bx+16],0
   ;	
   ;	    softunlock;
   ;	
	?debug	L 50
 	popf	
   ;	
   ;	    return ret;
   ;	
	?debug	L 51
	mov	ax,word ptr [bp-2]
	jmp	short @4@282
@4@282:
   ;	
   ;	}
   ;	
	?debug	L 52
	pop	ds
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	?debug	C E6037265740402FEFF0004746869731802060000+
	?debug	C 0D6D617854696D65546F576169740A0C0600
	?debug	E
	?debug	E
@KernelSem@0wait$qui	endp
   ;	
   ;	int KernelSem::signal (int n)
   ;	
	?debug	L 54
	assume	cs:KERSEM_TEXT
@KernelSem@0signal$qi	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	sub	sp,2
	push	si
	push	di
	push	ds
	mov	ax,KERSEM_DATA
	mov	ds,ax
	?debug	C F815404B65726E656C53656D40307369676E616C+
	?debug	C 247169
	?debug	C E6016E040A0A000004746869731802060000
	mov	si,word ptr [bp+10]
	?debug	B
   ;	
   ;	{
   ;	    /*softlock;
   ;	    printf("n=%d\n",blocked.lista.length);
   ;	    softunlock;*/
   ;	    if (n<0) return n;
   ;	
	?debug	L 59
	or	si,si
	jge	short @5@142
	mov	ax,si
@5@86:
	jmp	short @5@590
	jmp	short @5@590
@5@142:
   ;	
   ;	    else if (n==0) 
   ;	
	?debug	L 60
	or	si,si
	jne	short @5@338
   ;	
   ;	    {
   ;	        if (val++<0) 
   ;	
	?debug	L 62
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx]
	inc	word ptr es:[bx]
	or	ax,ax
	jge	short @5@282
   ;	
   ;	        {
   ;	            if (blocked.lista.length>0) 
   ;	
	?debug	L 64
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+8],0
	jle	short @5@254
   ;	
   ;	            {
   ;	                unblock();
   ;	
	?debug	L 66
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @KernelSem@0unblock$qv
	pop	cx
	pop	cx
@5@254:
   ;	
   ;	            }
   ;	            return 1;
   ;	
	?debug	L 68
	mov	ax,1
	jmp	short @5@86
@5@282:
   ;	
   ;	        }
   ;	        return 0;
   ;	
	?debug	L 70
	xor	ax,ax
	jmp	short @5@86
   ;	
   ;	    }
   ;	
	?debug	L 71
	jmp	short @5@590
@5@338:
	?debug	B
   ;	
   ;	    else
   ;	    {
   ;	        int k=n;
   ;	
	?debug	L 74
	mov	di,si
   ;	
   ;	        int ret=0;
   ;	
	?debug	L 75
	mov	word ptr [bp-2],0
	jmp	short @5@534
@5@366:
   ;	
   ;	        while (k>0)
   ;	        {
   ;	            if (blocked.lista.length>0)
   ;	
	?debug	L 78
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+8],0
	jle	short @5@478
   ;	
   ;	            {
   ;	                if (val++<0) unblock();
   ;	
	?debug	L 80
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx]
	inc	word ptr es:[bx]
	or	ax,ax
	jge	short @5@450
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @KernelSem@0unblock$qv
	pop	cx
	pop	cx
@5@450:
   ;	
   ;	                ret++;
   ;	
	?debug	L 81
	inc	word ptr [bp-2]
   ;	
   ;	            }
   ;	
	?debug	L 82
	jmp	short @5@506
@5@478:
   ;	
   ;	            else val++;
   ;	
	?debug	L 83
	les	bx,dword ptr [bp+6]
	inc	word ptr es:[bx]
@5@506:
   ;	
   ;	            k--;
   ;	
	?debug	L 84
	dec	di
@5@534:
	?debug	L 76
	or	di,di
	jg	short @5@366
   ;	
   ;	        }
   ;	        return ret;
   ;	
	?debug	L 86
	mov	ax,word ptr [bp-2]
	jmp	short @5@86
@5@590:
	?debug	C E6037265740402FEFF00016B04040700
	?debug	E
   ;	
   ;	    }
   ;	}
   ;	
	?debug	L 88
	pop	ds
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	?debug	C E604746869731802060000016E040C0600
	?debug	E
	?debug	E
@KernelSem@0signal$qi	endp
   ;	
   ;	void KernelSem::passTime()
   ;	
	?debug	L 90
	assume	cs:KERSEM_TEXT
@KernelSem@0passTime$qv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,KERSEM_DATA
	mov	ds,ax
	?debug	C F817404B65726E656C53656D4030706173735469+
	?debug	C 6D65247176
	?debug	C E604746869731802060000
	?debug	B
   ;	
   ;	{
   ;	    softlock;
   ;	
	?debug	L 92
 	pushf	
 	cli	
   ;	
   ;	    blocked.passTime();
   ;	
	?debug	L 93
	mov	ax,word ptr [bp+6]
	add	ax,6
	push	word ptr [bp+8]
	push	ax
	call	far ptr @PCBtime@0passTime$qv
	pop	cx
	pop	cx
   ;	
   ;	    softunlock;
   ;	
	?debug	L 94
 	popf	
   ;	
   ;	}
   ;	
	?debug	L 95
	pop	ds
	pop	bp
	ret	
	?debug	C E604746869731802060000
	?debug	E
	?debug	E
@KernelSem@0passTime$qv	endp
   ;	
   ;	KernelSem::~KernelSem()
   ;	
	?debug	L 97
	assume	cs:KERSEM_TEXT
@KernelSem@0$bdtr$qv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	si
	push	ds
	mov	ax,KERSEM_DATA
	mov	ds,ax
	?debug	C F814404B65726E656C53656D4030246264747224+
	?debug	C 7176
	?debug	C E60664656C657465040A0A000004746869731802+
	?debug	C 060000
	mov	si,word ptr [bp+10]
	?debug	B
   ;	
   ;	{
   ;	
	?debug	L 98
	mov	ax,word ptr [bp+6]
	or	ax,word ptr [bp+8]
	je	short @7@226
   ;	
   ;	    softlock;
   ;	
	?debug	L 99
 	pushf	
 	cli	
   ;	
   ;	    allSemaphores.deleteval(this);
   ;	
	?debug	L 100
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	mov	ax,seg @KernelSem@0allSemaphores
	push	ax
	mov	ax,offset @KernelSem@0allSemaphores
	push	ax
	call	far ptr @@%List$tn9KernelSem%@deleteval$wqn9KernelSem
	add	sp,8
   ;	
   ;	    softunlock;
   ;	
	?debug	L 101
 	popf	
	mov	ax,2
	push	ax
	mov	ax,word ptr [bp+6]
	add	ax,8
	push	word ptr [bp+8]
	push	ax
	call	far ptr @@%ListVal$t12PCBtime@Elem%@$bdtr$qv
	add	sp,6
	test	si,1
	je	short @7@226
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @$bdele$qnv
	pop	cx
	pop	cx
@7@226:
   ;	
   ;	}
   ;	
	?debug	L 102
	pop	ds
	pop	si
	pop	bp
	ret	
	?debug	C E6047468697318020600000664656C657465040C+
	?debug	C 0600
	?debug	E
	?debug	E
@KernelSem@0$bdtr$qv	endp
KERSEM_TEXT	ends
KERSEM_TEXT	segment byte public 'CODE'
@%List$tn9KernelSem%@$bctr$qv	segment	virtual
	?debug	C E8020C2E2E5C685C6C697374612E68E27AA550
	?debug	L 124
	assume	cs:@%List$tn9KernelSem%@$bctr$qv
@@%List$tn9KernelSem%@$bctr$qv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,KERSEM_DATA
	mov	ds,ax
	?debug	C F81D40254C69737424746E394B65726E656C5365+
	?debug	C 6D25402462637472247176
	?debug	C E31C000400161D00
	?debug	C E604746869731C02060000
	?debug	B
	?debug	L 125
	mov	ax,word ptr [bp+6]
	or	ax,word ptr [bp+8]
	jne	short @8@86
	mov	ax,6
	push	ax
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp+8],dx
	mov	word ptr [bp+6],ax
	or	ax,dx
	je	short @8@114
@8@86:
	?debug	L 126
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+4],0
	mov	word ptr es:[bx+2],0
	?debug	L 127
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx],0
@8@114:
	?debug	L 128
	mov	dx,word ptr [bp+8]
	mov	ax,word ptr [bp+6]
	jmp	short @8@142
@8@142:
	pop	ds
	pop	bp
	ret	
	?debug	C E604746869731C02060000
	?debug	E
	?debug	E
@@%List$tn9KernelSem%@$bctr$qv	endp
@%List$tn9KernelSem%@$bctr$qv	ends
KERSEM_TEXT	ends
KERSEM_TEXT	segment byte public 'CODE'
@%List$tn9KernelSem%@$bdtr$qv	segment	virtual
	?debug	C E802
	?debug	L 78
	assume	cs:@%List$tn9KernelSem%@$bdtr$qv
@@%List$tn9KernelSem%@$bdtr$qv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	si
	push	ds
	mov	ax,KERSEM_DATA
	mov	ds,ax
	?debug	C F81D40254C69737424746E394B65726E656C5365+
	?debug	C 6D25402462647472247176
	?debug	C E60664656C657465040A0A000004746869731C02+
	?debug	C 060000
	mov	si,word ptr [bp+10]
	?debug	B
	?debug	L 79
	mov	ax,word ptr [bp+6]
	or	ax,word ptr [bp+8]
	je	short @9@142
	?debug	L 80
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @@%List$tn9KernelSem%@erase$wqv
	pop	cx
	pop	cx
	test	si,1
	je	short @9@142
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @$bdele$qnv
	pop	cx
	pop	cx
@9@142:
	?debug	L 81
	pop	ds
	pop	si
	pop	bp
	ret	
	?debug	C E604746869731C020600000664656C657465040C+
	?debug	C 0600
	?debug	E
	?debug	E
@@%List$tn9KernelSem%@$bdtr$qv	endp
@%List$tn9KernelSem%@$bdtr$qv	ends
KERSEM_TEXT	ends
KERSEM_TEXT	segment byte public 'CODE'
@%ListVal$t12PCBtime@Elem%@$bctr$qv	segment	virtual
	?debug	C E8030D2E2E5C685C6C69737461322E684A7DA550
	?debug	L 91
	assume	cs:@%ListVal$t12PCBtime@Elem%@$bctr$qv
@@%ListVal$t12PCBtime@Elem%@$bctr$qv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,KERSEM_DATA
	mov	ds,ax
	?debug	C F82340254C69737456616C247431325043427469+
	?debug	C 6D6540456C656D25402462637472247176
	?debug	C E31E000400161F00
	?debug	C E604746869731E02060000
	?debug	B
	?debug	L 92
	mov	ax,word ptr [bp+6]
	or	ax,word ptr [bp+8]
	jne	short @10@86
	mov	ax,6
	push	ax
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp+8],dx
	mov	word ptr [bp+6],ax
	or	ax,dx
	je	short @10@114
@10@86:
	?debug	L 93
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+4],0
	mov	word ptr es:[bx+2],0
	?debug	L 94
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx],0
@10@114:
	?debug	L 95
	mov	dx,word ptr [bp+8]
	mov	ax,word ptr [bp+6]
	jmp	short @10@142
@10@142:
	pop	ds
	pop	bp
	ret	
	?debug	C E604746869731E02060000
	?debug	E
	?debug	E
@@%ListVal$t12PCBtime@Elem%@$bctr$qv	endp
@%ListVal$t12PCBtime@Elem%@$bctr$qv	ends
KERSEM_TEXT	ends
KERSEM_TEXT	segment byte public 'CODE'
@%List$tn9KernelSem%@deleteval$wqn9KernelSem	segment	virtual
	?debug	C E802
	?debug	L 83
	assume	cs:@%List$tn9KernelSem%@deleteval$wqn9KernelSem
@@%List$tn9KernelSem%@deleteval$wqn9KernelSem	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	sub	sp,8
	push	ds
	mov	ax,KERSEM_DATA
	mov	ds,ax
	?debug	C F82C40254C69737424746E394B65726E656C5365+
	?debug	C 6D254064656C65746576616C2477716E394B6572+
	?debug	C 6E656C53656D
	?debug	C E320000400161D00
	?debug	C E60364656C180A0A000004746869732002060000
	?debug	B
	?debug	L 85
	mov	ax,seg @Timer@0globalLockCnt
	mov	es,ax
	inc	word ptr es:@Timer@0globalLockCnt
	?debug	L 86
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+4]
	mov	dx,word ptr es:[bx+2]
	mov	word ptr [bp-2],ax
	mov	word ptr [bp-4],dx
	?debug	L 87
	mov	word ptr [bp-6],0
	mov	word ptr [bp-8],0
	jmp	@11@282
@11@58:
	?debug	L 90
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx+2]
	mov	dx,word ptr es:[bx]
	cmp	ax,word ptr [bp+12]
	jne	short @11@254
	cmp	dx,word ptr [bp+10]
	jne	short @11@254
	?debug	L 92
	mov	ax,word ptr [bp-8]
	or	ax,word ptr [bp-6]
	jne	short @11@170
	?debug	L 94
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+2]
	mov	ax,word ptr es:[bx+6]
	mov	dx,word ptr es:[bx+4]
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+4],ax
	mov	word ptr es:[bx+2],dx
	jmp	short @11@198
@11@170:
	?debug	L 100
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx+6]
	mov	dx,word ptr es:[bx+4]
	les	bx,dword ptr [bp-8]
	mov	word ptr es:[bx+6],ax
	mov	word ptr es:[bx+4],dx
@11@198:
	?debug	L 101
	les	bx,dword ptr [bp+6]
	dec	word ptr es:[bx]
	?debug	L 102
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @$bdele$qnv
	pop	cx
	pop	cx
	?debug	L 104
	jmp	short @11@310
@11@254:
	?debug	L 106
	mov	ax,word ptr [bp-2]
	mov	dx,word ptr [bp-4]
	mov	word ptr [bp-6],ax
	mov	word ptr [bp-8],dx
	?debug	L 107
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx+6]
	mov	dx,word ptr es:[bx+4]
	mov	word ptr [bp-2],ax
	mov	word ptr [bp-4],dx
@11@282:
	?debug	L 88
	mov	ax,word ptr [bp-4]
	or	ax,word ptr [bp-2]
	je	@@0
	jmp	@11@58
@@0:
@11@310:
	?debug	L 109
	mov	ax,seg @Timer@0globalLockCnt
	mov	es,ax
	dec	word ptr es:@Timer@0globalLockCnt
	jne	short @11@366
	mov	ax,seg @Timer@0zahtevana_promena_konteksta
	mov	es,ax
	cmp	word ptr es:@Timer@0zahtevana_promena_konteksta,0
	je	short @11@366
@11@366:
	?debug	L 110
	pop	ds
	mov	sp,bp
	pop	bp
	ret	
	?debug	C E321000400162200
	?debug	C E604707265762102F8FF0001742102FCFF000474+
	?debug	C 68697320020600000364656C180A0A0000
	?debug	E
	?debug	E
@@%List$tn9KernelSem%@deleteval$wqn9KernelSem	endp
@%List$tn9KernelSem%@deleteval$wqn9KernelSem	ends
KERSEM_TEXT	ends
KERSEM_TEXT	segment byte public 'CODE'
@%ListVal$t12PCBtime@Elem%@$bdtr$qv	segment	virtual
	?debug	C E803
	?debug	L 57
	assume	cs:@%ListVal$t12PCBtime@Elem%@$bdtr$qv
@@%ListVal$t12PCBtime@Elem%@$bdtr$qv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	si
	push	ds
	mov	ax,KERSEM_DATA
	mov	ds,ax
	?debug	C F82340254C69737456616C247431325043427469+
	?debug	C 6D6540456C656D25402462647472247176
	?debug	C E60664656C657465040A0A000004746869731E02+
	?debug	C 060000
	mov	si,word ptr [bp+10]
	?debug	B
	?debug	L 58
	mov	ax,word ptr [bp+6]
	or	ax,word ptr [bp+8]
	je	short @12@142
	?debug	L 59
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @@%ListVal$t12PCBtime@Elem%@erase$wqv
	pop	cx
	pop	cx
	test	si,1
	je	short @12@142
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @$bdele$qnv
	pop	cx
	pop	cx
@12@142:
	?debug	L 60
	pop	ds
	pop	si
	pop	bp
	ret	
	?debug	C E604746869731E020600000664656C657465040C+
	?debug	C 0600
	?debug	E
	?debug	E
@@%ListVal$t12PCBtime@Elem%@$bdtr$qv	endp
@%ListVal$t12PCBtime@Elem%@$bdtr$qv	ends
KERSEM_TEXT	ends
KERSEM_TEXT	segment byte public 'CODE'
@%List$tn9KernelSem%@erase$wqv	segment	virtual
	?debug	C E802
	?debug	L 24
	assume	cs:@%List$tn9KernelSem%@erase$wqv
@@%List$tn9KernelSem%@erase$wqv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	sub	sp,4
	push	ds
	mov	ax,KERSEM_DATA
	mov	ds,ax
	?debug	C F81E40254C69737424746E394B65726E656C5365+
	?debug	C 6D2540657261736524777176
	?debug	C E604746869732002060000
	?debug	B
	?debug	L 26
	mov	ax,seg @Timer@0globalLockCnt
	mov	es,ax
	inc	word ptr es:@Timer@0globalLockCnt
	jmp	short @13@86
@13@58:
	?debug	B
	?debug	L 28
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+4]
	mov	dx,word ptr es:[bx+2]
	mov	word ptr [bp-2],ax
	mov	word ptr [bp-4],dx
	?debug	L 29
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+2]
	mov	ax,word ptr es:[bx+6]
	mov	dx,word ptr es:[bx+4]
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+4],ax
	mov	word ptr es:[bx+2],dx
	?debug	L 30
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @$bdele$qnv
	pop	cx
	pop	cx
@13@86:
	?debug	C E6036F6C642102FCFF00
	?debug	E
	?debug	L 27
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	or	ax,word ptr es:[bx+4]
	jne	short @13@58
	?debug	L 32
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+4],0
	mov	word ptr es:[bx+2],0
	?debug	L 33
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx],0
	?debug	L 34
	mov	ax,seg @Timer@0globalLockCnt
	mov	es,ax
	dec	word ptr es:@Timer@0globalLockCnt
	jne	short @13@170
	mov	ax,seg @Timer@0zahtevana_promena_konteksta
	mov	es,ax
	cmp	word ptr es:@Timer@0zahtevana_promena_konteksta,0
	je	short @13@170
@13@170:
	?debug	L 35
	pop	ds
	mov	sp,bp
	pop	bp
	ret	
	?debug	C E604746869732002060000
	?debug	E
	?debug	E
@@%List$tn9KernelSem%@erase$wqv	endp
@%List$tn9KernelSem%@erase$wqv	ends
KERSEM_TEXT	ends
KERSEM_TEXT	segment byte public 'CODE'
@%ListVal$t12PCBtime@Elem%@erase$wqv	segment	virtual
	?debug	C E803
	?debug	L 20
	assume	cs:@%ListVal$t12PCBtime@Elem%@erase$wqv
@@%ListVal$t12PCBtime@Elem%@erase$wqv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	sub	sp,4
	push	ds
	mov	ax,KERSEM_DATA
	mov	ds,ax
	?debug	C F82440254C69737456616C247431325043427469+
	?debug	C 6D6540456C656D2540657261736524777176
	?debug	C E323000400161F00
	?debug	C E604746869732302060000
	?debug	B
	jmp	short @14@114
@14@58:
	?debug	B
	?debug	L 23
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+4]
	mov	dx,word ptr es:[bx+2]
	mov	word ptr [bp-2],ax
	mov	word ptr [bp-4],dx
	?debug	L 24
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+2]
	mov	ax,word ptr es:[bx+8]
	mov	dx,word ptr es:[bx+6]
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+4],ax
	mov	word ptr es:[bx+2],dx
	?debug	L 25
	mov	ax,seg @Timer@0globalLockCnt
	mov	es,ax
	inc	word ptr es:@Timer@0globalLockCnt
	?debug	L 26
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @$bdele$qnv
	pop	cx
	pop	cx
	?debug	L 27
	mov	ax,seg @Timer@0globalLockCnt
	mov	es,ax
	dec	word ptr es:@Timer@0globalLockCnt
	jne	short @14@114
	mov	ax,seg @Timer@0zahtevana_promena_konteksta
	mov	es,ax
	cmp	word ptr es:@Timer@0zahtevana_promena_konteksta,0
	je	short @14@114
@14@114:
	?debug	C E324000400162500
	?debug	C E6036F6C642402FCFF00
	?debug	E
	?debug	L 22
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	or	ax,word ptr es:[bx+4]
	jne	short @14@58
	?debug	L 29
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+4],0
	mov	word ptr es:[bx+2],0
	?debug	L 30
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx],0
	?debug	L 31
	pop	ds
	mov	sp,bp
	pop	bp
	ret	
	?debug	C E604746869732302060000
	?debug	E
	?debug	E
@@%ListVal$t12PCBtime@Elem%@erase$wqv	endp
@%ListVal$t12PCBtime@Elem%@erase$wqv	ends
KERSEM_TEXT	ends
_INIT_	segment word public 'INITDATA'
	db	1
	db	32
	dd	@_STCON_$qv
_INIT_	ends
KERSEM_TEXT	segment byte public 'CODE'
@%ListVal$t12PCBtime@Elem%@erase$wqv	segment	virtual
@%ListVal$t12PCBtime@Elem%@erase$wqv	ends
KERSEM_TEXT	ends
KERSEM_TEXT	segment byte public 'CODE'
	assume	cs:KERSEM_TEXT
@_STCON_$qv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,KERSEM_DATA
	mov	ds,ax
	?debug	B
	mov	ax,seg @KernelSem@0allSemaphores
	push	ax
	mov	ax,offset @KernelSem@0allSemaphores
	push	ax
	call	far ptr @@%List$tn9KernelSem%@$bctr$qv
	pop	cx
	pop	cx
	pop	ds
	pop	bp
	ret	
	?debug	E
	?debug	E
@_STCON_$qv	endp
KERSEM_TEXT	ends
_EXIT_	segment word public 'EXITDATA'
	db	1
	db	32
	dd	@_STDES_$qv
_EXIT_	ends
KERSEM_TEXT	segment byte public 'CODE'
	assume	cs:KERSEM_TEXT
@_STDES_$qv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,KERSEM_DATA
	mov	ds,ax
	?debug	B
	mov	ax,2
	push	ax
	mov	ax,seg @KernelSem@0allSemaphores
	push	ax
	mov	ax,offset @KernelSem@0allSemaphores
	push	ax
	call	far ptr @@%List$tn9KernelSem%@$bdtr$qv
	add	sp,6
	pop	ds
	pop	bp
	ret	
	?debug	E
	?debug	E
@_STDES_$qv	endp
	?debug	C E9
	?debug	C FA00000000
KERSEM_TEXT	ends
KERSEM_DATA	segment word public 'FAR_DATA'
s@	label	byte
KERSEM_DATA	ends
KERSEM_TEXT	segment byte public 'CODE'
KERSEM_TEXT	ends
	?debug	C E31D1440254C69737424746E394B65726E656C53+
	?debug	C 656D2506002E03
	?debug	C ED00030000010E00
	?debug	C E3221940254C69737424746E394B65726E656C53+
	?debug	C 656D25404E6F646508002E05
	?debug	C ED000500000F0F00
	?debug	C E3260000002D2104092200
	?debug	C E3280000002D0104031D001E40254C6973742474+
	?debug	C 6E394B65726E656C53656D254065726173652477+
	?debug	C 7176
	?debug	C E32A0000002D0104091D00
	?debug	C E32C0000002D0104091D00
	?debug	C E32E0000002D1804091D00
	?debug	C E3300000002D0104031D001D40254C6973742474+
	?debug	C 6E394B65726E656C53656D254024626474722471+
	?debug	C 76
	?debug	C E3320000002D0104031D002C40254C6973742474+
	?debug	C 6E394B65726E656C53656D254064656C65746576+
	?debug	C 616C2477716E394B65726E656C53656D
	?debug	C E3340000002D0104091D00
	?debug	C E3360000002D2104091D00
	?debug	C E3380000002D1C04031D001D40254C6973742474+
	?debug	C 6E394B65726E656C53656D254024626374722471+
	?debug	C 76
	?debug	C E31F1A40254C69737456616C2474313250434274+
	?debug	C 696D6540456C656D2506002E04
	?debug	C ED00040000130E00
	?debug	C E33A0E4050434274696D654030456C656D06002E+
	?debug	C 07
	?debug	C ED000700001F0F00
	?debug	C E33C03504342A8002E08
	?debug	C ED00080000230E00
	?debug	C E33D000400163C00
	?debug	C E33E000400160A00
	?debug	C E33F06537461746573020022000080FF7F4C
	?debug	C E3420654687265616408002E09
	?debug	C ED00090000500E00
	?debug	C E3430000002D0104014200114054687265616440+
	?debug	C 307374617274247176
	?debug	C E3450000002D01040142001A4054687265616440+
	?debug	C 3077616974546F436F6D706C657465247176
	?debug	C E3470000002D0104014200114054687265616440+
	?debug	C 302462647472247176
	?debug	C E3490000002D0404014200114054687265616440+
	?debug	C 306765744964247176
	?debug	C E34B0000002D0404014200184054687265616440+
	?debug	C 3067657452756E6E696E674964247176
	?debug	C E34D0000002D4104014200194054687265616440+
	?debug	C 3067657454687265616442794964247169
	?debug	C E34F0000002D0104014200134054687265616440+
	?debug	C 307369676E616C24717569
	?debug	C E3510000002D0104014200214054687265616440+
	?debug	C 30726567697374657248616E646C657224717569+
	?debug	C 6E71762476
	?debug	C E3530000002D0104014200224054687265616440+
	?debug	C 30756E7265676973746572416C6C48616E646C65+
	?debug	C 727324717569
	?debug	C E3550000002D0104014200184054687265616440+
	?debug	C 3073776170247175696E717624767432
	?debug	C E3570000002D0104014200184054687265616440+
	?debug	C 30626C6F636B5369676E616C24717569
	?debug	C E3590000002D0104014200204054687265616440+
	?debug	C 30626C6F636B5369676E616C476C6F62616C6C79+
	?debug	C 24717569
	?debug	C E35B0000002D01040142001A4054687265616440+
	?debug	C 30756E626C6F636B5369676E616C24717569
	?debug	C E35D0000002D0104014200224054687265616440+
	?debug	C 30756E626C6F636B5369676E616C476C6F62616C+
	?debug	C 6C7924717569
	?debug	C E35F0000002D4104014200144054687265616440+
	?debug	C 3024626374722471756C7569
	?debug	C E3610000002D0104094202
	?debug	C E341000400164200
	?debug	C E3640E40254C69737424746E717624762506002E+
	?debug	C 0A
	?debug	C ED000A0000630E00
	?debug	C E36600000023010400
	?debug	C E365000400166600
	?debug	C E3671340254C69737424746E7176247625404E6F+
	?debug	C 646508002E0B
	?debug	C ED000B0000710F00
	?debug	C E368000400166700
	?debug	C E3690000002D6804096700
	?debug	C E36B0000002D0104096400
	?debug	C E36D0000002D0104096400
	?debug	C E36F0000002D0104096400
	?debug	C E3710000002D6504096400
	?debug	C E3730000002D0104096400
	?debug	C E3750000002D0104096400
	?debug	C E3770000002D0104096400
	?debug	C E3790000002D6804096400
	?debug	C E37B000400166400
	?debug	C E37C0000002D7B04096400
	?debug	C E3630060001A64
	?debug	C E37E0B40254C697374247475692506002E0C
	?debug	C ED000C0000750E00
	?debug	C E37F1040254C6973742474756925404E6F646506+
	?debug	C 002E0D
	?debug	C ED000D000080830F00
	?debug	C E38080000400167F00
	?debug	C E380810000002D808004097F00
	?debug	C E380830000002D0104097E00
	?debug	C E380850000002D0104097E00
	?debug	C E380870000002D0104097E00
	?debug	C E380890000002D0A04097E00
	?debug	C E3808B0000002D0104097E00
	?debug	C E3808D0000002D0104097E00
	?debug	C E3808F0000002D0104097E00
	?debug	C E380910000002D808004097E00
	?debug	C E38093000400167E00
	?debug	C E380940000002D809304097E00
	?debug	C E380960020001A04
	?debug	C E380970020001A04
	?debug	C E380980E40254C69737424746E33504342250600+
	?debug	C 2E0E
	?debug	C ED000E000080870E00
	?debug	C E380991340254C69737424746E3350434225404E+
	?debug	C 6F646508002E0F
	?debug	C ED000F000080950F00
	?debug	C E3809A00040016809900
	?debug	C E3809B0000002D809A0409809900
	?debug	C E3809D0000002D010409809800
	?debug	C E3809F0000002D010409809800
	?debug	C E380A10000002D010409809800
	?debug	C E380A30000002D3B0409809800
	?debug	C E380A50000002D010409809800
	?debug	C E380A70000002D010409809800
	?debug	C E380A90000002D010409809800
	?debug	C E380AB0000002D809A0409809800
	?debug	C E380AD00040016809800
	?debug	C E380AE0000002D80AD0409809800
	?debug	C E380B00000002D3B04013C001140504342403024+
	?debug	C 626374722471756C7569
	?debug	C E380B20000002D3B04013C001940504342403024+
	?debug	C 6263747224716E36546872656164756C7569
	?debug	C E380B40000002D0104013C001740504342403077+
	?debug	C 72617070657224716E36546872656164
	?debug	C E380B60000002D0104013C001840504342403061+
	?debug	C 6464546F416C6C50434224716E33504342
	?debug	C E380B80000002D0104013C001D40504342403064+
	?debug	C 656C65746546726F6D416C6C50434224716E3350+
	?debug	C 4342
	?debug	C E380BA0000002D0104013C001D40504342403061+
	?debug	C 6464546F426C6F636B65644C69737424716E3350+
	?debug	C 4342
	?debug	C E380BC0000002D0104013C001440504342403075+
	?debug	C 6E626C6F636B416C6C24777176
	?debug	C E380BE0000002D0104013C000E40504342403024+
	?debug	C 62647472247176
	?debug	C E380C00000002D0104013C001140504342403073+
	?debug	C 69676E616C2477717569
	?debug	C E380C20000002D0104013C001E40504342403072+
	?debug	C 6567697374657248616E646C6572247175696E71+
	?debug	C 762476
	?debug	C E380C40000002D0104013C001F40504342403075+
	?debug	C 6E7265676973746572416C6C48616E646C657273+
	?debug	C 24717569
	?debug	C E380C60000002D0104013C001540504342403073+
	?debug	C 776170247175696E717624767432
	?debug	C E380C80000002D0104013C001540504342403062+
	?debug	C 6C6F636B5369676E616C24717569
	?debug	C E380CA0000002D0104013C001D40504342403062+
	?debug	C 6C6F636B5369676E616C476C6F62616C6C792471+
	?debug	C 7569
	?debug	C E380CC0000002D0104013C001740504342403075+
	?debug	C 6E626C6F636B5369676E616C24717569
	?debug	C E380CE0000002D0104013C001F40504342403075+
	?debug	C 6E626C6F636B5369676E616C476C6F62616C6C79+
	?debug	C 24717569
	?debug	C E380D00000002D0104013C001340504342403064+
	?debug	C 6F5369676E616C7324777176
	?debug	C E33B000400163C00
	?debug	C E380D2000400163A00
	?debug	C E380D30000002D80D204093A00
	?debug	C E3251F40254C69737456616C2474313250434274+
	?debug	C 696D6540456C656D25404E6F64650A002E06
	?debug	C ED0006000080990F00
	?debug	C E380D50000002D2404092500
	?debug	C E380D70000002D0104031F002440254C69737456+
	?debug	C 616C2474313250434274696D6540456C656D2540+
	?debug	C 657261736524777176
	?debug	C E380D90000002D0104091F00
	?debug	C E380DB0000002D3A04091F00
	?debug	C E380DD0000002D0104031F002340254C69737456+
	?debug	C 616C2474313250434274696D6540456C656D2540+
	?debug	C 2462647472247176
	?debug	C E380DF0000002D0104091F00
	?debug	C E380E10000002D1E04031F002340254C69737456+
	?debug	C 616C2474313250434274696D6540456C656D2540+
	?debug	C 2462637472247176
	?debug	C E380E30000002D3A04091F00
	?debug	C E31B0953656D6170686F726508002E02
	?debug	C ED00020000809D0E00
	?debug	C E380E50000002D1A04011B00144053656D617068+
	?debug	C 6F726540302462637472247169
	?debug	C E380E70000002D0104011B00144053656D617068+
	?debug	C 6F726540302462647472247176
	?debug	C E380E90000002D0404011B02144053656D617068+
	?debug	C 6F726540307761697424717569
	?debug	C E380EB0000002D0404011B04154053656D617068+
	?debug	C 6F726540307369676E616C247169
	?debug	C E380ED0000002D0404011B00134053656D617068+
	?debug	C 6F7265403076616C24787176
	?debug	C E319094B65726E656C53656D0E002E01
	?debug	C ED0001000080A50E00
	?debug	C E380EF0750434274696D6508002E10
	?debug	C ED0010000080B10E00
	?debug	C E380F00000002D01040180EF0015405043427469+
	?debug	C 6D6540307061737354696D65247176
	?debug	C E380F20000002D01040180EF0019405043427469+
	?debug	C 6D65403061646450434224716E335043427569
	?debug	C E380F40000002D01040180EF0016405043427469+
	?debug	C 6D6540307369676E616C4F6E65247176
	?debug	C E380F60000002D040401190014404B65726E656C+
	?debug	C 53656D40307761697424717569
	?debug	C E380F80000002D040401190015404B65726E656C+
	?debug	C 53656D40307369676E616C247169
	?debug	C E380FA0000002D010401190015404B65726E656C+
	?debug	C 53656D4030626C6F636B24717569
	?debug	C E380FC0000002D010401190016404B65726E656C+
	?debug	C 53656D4030756E626C6F636B247176
	?debug	C E380FE0000002D18040119001F404B65726E656C+
	?debug	C 53656D4030246263747224716E3953656D617068+
	?debug	C 6F726569
	?debug	C E381000000002D010401190014404B65726E656C+
	?debug	C 53656D40302462647472247176
	?debug	C E381020000002D010401190017404B65726E656C+
	?debug	C 53656D40307061737354696D65247176
	public	@KernelSem@0passTime$qv
	public	@KernelSem@0$bdtr$qv
	public	@KernelSem@0$bctr$qn9Semaphorei
	public	@KernelSem@0unblock$qv
	public	@KernelSem@0block$qui
	public	@KernelSem@0signal$qi
	public	@KernelSem@0wait$qui
	public	@KernelSem@0allSemaphores
	extrn	@PCBtime@0signalOne$qv:far
	extrn	@PCBtime@0addPCB$qn3PCBui:far
	extrn	@PCBtime@0passTime$qv:far
	extrn	@PCB@0pomlist:word
	extrn	@PCB@0allPCB:word
	extrn	@PCB@0running:dword
	extrn	@Timer@0globalLockCnt:word
	extrn	@Timer@0zahtevana_promena_konteksta:word
	extrn	@dispatch$qv:far
	extrn	@$bdele$qnv:far
	extrn	@$bnew$qui:far
_s@	equ	s@
	?debug	C EA050D
	?debug	C E3810703696F732A002E14
	?debug	C ED0014000080B80E00
	?debug	C E3810808696F5F7374617465020022000080FF7F+
	?debug	C 80F6
	?debug	C E3810A096F70656E5F6D6F6465020022000080FF+
	?debug	C 7F80FB
	?debug	C E3810C087365656B5F646972020022000080FF7F+
	?debug	C 8103
	?debug	C E3810E00040016810700
	?debug	C E3810F0000002D810E04018107001840696F7340+
	?debug	C 30246263747224716E3973747265616D627566
	?debug	C E381110000002D0104018107000E40696F734030+
	?debug	C 2462647472247176
	?debug	C E381130000002D060409810700
	?debug	C E381150000002D0604018107000E40696F734030+
	?debug	C 666C61677324716C
	?debug	C E381170000002D0604018107000E40696F734030+
	?debug	C 7365746624716C6C
	?debug	C E381190000002D0604018107000D40696F734030+
	?debug	C 7365746624716C
	?debug	C E3811B0000002D0604018107000F40696F734030+
	?debug	C 756E7365746624716C
	?debug	C E3811D0000002D040409810700
	?debug	C E3811F0000002D040409810700
	?debug	C E381210000002D020409810700
	?debug	C E381230000002D020409810700
	?debug	C E381250000002D040409810700
	?debug	C E381270000002D040409810700
	?debug	C E3812A076F73747265616D30002E15
	?debug	C ED0015020081060E011480
	?debug	C E3812B0000002D81290401812A001C406F737472+
	?debug	C 65616D4030246263747224716E3973747265616D+
	?debug	C 627566
	?debug	C E3812D0000002D010401812A0012406F73747265+
	?debug	C 616D40302462647472247176
	?debug	C E3812F0000002D81290401812A0012406F737472+
	?debug	C 65616D40302462637472247169
	?debug	C E381310000002D81290401812A0015406F737472+
	?debug	C 65616D403024626374722471696E7A63
	?debug	C E381330000002D040409812A00
	?debug	C E381350000002D010409812A00
	?debug	C E3813700040035812A00
	?debug	C E381380000002D81370401812A0012406F737472+
	?debug	C 65616D4030666C757368247176
	?debug	C E3813A0000002D81370401812A0012406F737472+
	?debug	C 65616D40307365656B7024716C
	?debug	C E3813C0000002D81370401812A001B406F737472+
	?debug	C 65616D40307365656B7024716C387365656B5F64+
	?debug	C 6972
	?debug	C E3813E0000002D060401812A0012406F73747265+
	?debug	C 616D403074656C6C70247176
	?debug	C E381400000002D81370409812A00
	?debug	C E381420000002D81370401812A0016406F737472+
	?debug	C 65616D4030777269746524716E787A6369
	?debug	C E381440000002D81370409812A00
	?debug	C E381460000002D81370405812A0013406F737472+
	?debug	C 65616D403024626C736824717A63
	?debug	C E381480000002D8137040D812A00
	?debug	C E3814A0000002D8137040D812A00
	?debug	C E3814C0000002D8137040D812A00
	?debug	C E3814E0000002D8137040D812A00
	?debug	C E381500000002D8137040D812A00
	?debug	C E381520000002D81370405812A0012406F737472+
	?debug	C 65616D403024626C736824716C
	?debug	C E381540000002D81370405812A0013406F737472+
	?debug	C 65616D403024626C73682471756C
	?debug	C E381560000002D8137040D812A00
	?debug	C E381580000002D8137040D812A00
	?debug	C E3815A0000002D81370405812A0012406F737472+
	?debug	C 65616D403024626C7368247167
	?debug	C E3815C0000002D8137040D812A00
	?debug	C E3815E0000002D8137040D812A00
	?debug	C E381600000002D81370405812A0013406F737472+
	?debug	C 65616D403024626C736824716E76
	?debug	C E381620000002D81370405812A001C406F737472+
	?debug	C 65616D403024626C736824716E3973747265616D+
	?debug	C 627566
	?debug	C E381640000002D8137040D812A00
	?debug	C E381660000002D81370405812A001E406F737472+
	?debug	C 65616D403024626C736824716E716D33696F7324+
	?debug	C 6D33696F73
	?debug	C E381680000002D040401812A0014406F73747265+
	?debug	C 616D4030646F5F6F706678247176
	?debug	C E3816A0000002D010401812A0014406F73747265+
	?debug	C 616D4030646F5F6F736678247176
	?debug	C E3816C0000002D81290401812A0012406F737472+
	?debug	C 65616D40302462637472247176
	?debug	C E3816E0000002D010401812A0018406F73747265+
	?debug	C 616D40306F757473747224716E787A637431
	?debug	C E3812900040016812A00
	?debug	C E381700000002D812904018107001440696F7340+
	?debug	C 3074696524716E376F73747265616D
	?debug	C E381720000002D81290409810700
	?debug	C E381740000002D040409810700
	?debug	C E381760000002D040409810700
	?debug	C E381780000002D040409810700
	?debug	C E3817A0000002D040409810700
	?debug	C E3817C0000002D040409810700
	?debug	C E3817E0000002D0104018107000E40696F734030+
	?debug	C 636C656172247169
	?debug	C E38180000400160100
	?debug	C E381810000002D81800409810700
	?debug	C E381830000002D04040D810700
	?debug	C E381860973747265616D62756628002E16
	?debug	C ED0016000081290E00
	?debug	C E381870000002D81850401818600144073747265+
	?debug	C 616D62756640302462637472247176
	?debug	C E381890000002D81850401818600174073747265+
	?debug	C 616D6275664030246263747224716E7A6369
	?debug	C E3818B0000002D01040181860014407374726561+
	?debug	C 6D62756640302462647472247176
	?debug	C E3818D0000002D81850401818602184073747265+
	?debug	C 616D627566403073657462756624716E7A6369
	?debug	C E3818F0000002D81850409818600
	?debug	C E381910000002D81850401818600194073747265+
	?debug	C 616D627566403073657462756624716E7A636969
	?debug	C E381930000002D040409818600
	?debug	C E381950000002D040409818600
	?debug	C E381970000002D040409818600
	?debug	C E381990000002D010409818600
	?debug	C E3819B0000002D04040181860017407374726561+
	?debug	C 6D6275664030736765746E24716E7A6369
	?debug	C E3819D0000002D0404018186041A407374726561+
	?debug	C 6D6275664030646F5F736765746E24716E7A6369
	?debug	C E3819F0000002D04040181860618407374726561+
	?debug	C 6D6275664030756E646572666C6F77247176
	?debug	C E381A10000002D040409818600
	?debug	C E381A30000002D04040181860818407374726561+
	?debug	C 6D6275664030706261636B6661696C247169
	?debug	C E381A50000002D040409818600
	?debug	C E381A70000002D040409818600
	?debug	C E381A90000002D04040181860018407374726561+
	?debug	C 6D6275664030737075746E24716E787A6369
	?debug	C E381AB0000002D04040181860A1B407374726561+
	?debug	C 6D6275664030646F5F737075746E24716E787A63+
	?debug	C 69
	?debug	C E381AD0000002D04040181860C17407374726561+
	?debug	C 6D62756640306F766572666C6F77247169
	?debug	C E381AF0000002D040409818600
	?debug	C E381B10000002D06040181860E20407374726561+
	?debug	C 6D62756640307365656B6F666624716C38736565+
	?debug	C 6B5F64697269
	?debug	C E381B30000002D06040181861017407374726561+
	?debug	C 6D62756640307365656B706F7324716C69
	?debug	C E381B50000002D04040181861213407374726561+
	?debug	C 6D627566403073796E63247176
	?debug	C E381B70000002D01040181860012407374726561+
	?debug	C 6D6275664030646270247176
	?debug	C E381B9000400160200
	?debug	C E381BA0000002D81B90409818600
	?debug	C E381BC0000002D81B90409818600
	?debug	C E381BE0000002D040409818600
	?debug	C E381C00000002D81B90409818600
	?debug	C E381C20000002D81B90409818600
	?debug	C E381C40000002D81B90409818600
	?debug	C E381C60000002D81B90409818600
	?debug	C E381C80000002D81B90409818600
	?debug	C E381CA0000002D81B90409818600
	?debug	C E381CC0000002D01040181860017407374726561+
	?debug	C 6D62756640307365747024716E7A637431
	?debug	C E381CE0000002D01040181860019407374726561+
	?debug	C 6D62756640307365746724716E7A6374317431
	?debug	C E381D00000002D010409818600
	?debug	C E381D20000002D010409818600
	?debug	C E381D40000002D01040181860018407374726561+
	?debug	C 6D62756640307365746224716E7A63743169
	?debug	C E381D60000002D010409818600
	?debug	C E381D80000002D040409818600
	?debug	C E381DA0000002D040409818600
	?debug	C E381DC0000002D04040181861419407374726561+
	?debug	C 6D6275664030646F616C6C6F63617465247176
	?debug	C E381DE0000002D04040181860018407374726561+
	?debug	C 6D6275664030646F5F736E65787463247176
	?debug	C E381E00000002D818504018186001E4073747265+
	?debug	C 616D6275664030246263747224716D3973747265+
	?debug	C 616D627566
	?debug	C E381E20000002D0104058186001E407374726561+
	?debug	C 6D6275664030246261736724716D397374726561+
	?debug	C 6D627566
	?debug	C E3818500040016818600
	?debug	C E381E40000002D81850409810700
	?debug	C E381E60000002D0604018107001140696F734030+
	?debug	C 626974616C6C6F63247176
	?debug	C E381E80000002D0404018107000F40696F734030+
	?debug	C 78616C6C6F63247176
	?debug	C E381EA000400350600
	?debug	C E381EB0000002D81EA04018107000E40696F7340+
	?debug	C 3069776F7264247169
	?debug	C E381ED00040035818000
	?debug	C E381EE0000002D81ED04018107000E40696F7340+
	?debug	C 3070776F7264247169
	?debug	C E381F00000002D0104018107001840696F734030+
	?debug	C 73796E635F776974685F737464696F247176
	?debug	C E381F20000002D0404018107000D40696F734030+
	?debug	C 736B6970247169
	?debug	C E381F40000002D810E04018107000E40696F7340+
	?debug	C 302462637472247176
	?debug	C E381F60000002D0104018107001740696F734030+
	?debug	C 696E697424716E3973747265616D627566
	?debug	C E381F80000002D0104018107001140696F734030+
	?debug	C 7365747374617465247169
	?debug	C E381FB00000023010400
	?debug	C E381FA0004001681FB00
	?debug	C E381FC000400160100
	?debug	C E381FD0000002D0104018107001140696F734030+
	?debug	C 7573657273697A65247169
	?debug	C E381FF0000002D810E04018107001240696F7340+
	?debug	C 30246263747224716D33696F73
	?debug	C E382010000002D0104058107001240696F734030+
	?debug	C 246261736724716D33696F73
	?debug	C E38106076973747265616D32002E13
	?debug	C ED0013020081630E011480
	?debug	C E3820300040016810600
	?debug	C E382040000002D820304018106001C4069737472+
	?debug	C 65616D4030246263747224716E3973747265616D+
	?debug	C 627566
	?debug	C E382060000002D01040181060012406973747265+
	?debug	C 616D40302462647472247176
	?debug	C E382080000002D82030401810600264069737472+
	?debug	C 65616D4030246263747224716E3973747265616D+
	?debug	C 627566696E376F73747265616D
	?debug	C E3820A0000002D82030401810600164069737472+
	?debug	C 65616D403024626374722471696E7A6369
	?debug	C E3820C0000002D820304018106001C4069737472+
	?debug	C 65616D40302462637472247169696E376F737472+
	?debug	C 65616D
	?debug	C E3820E0000002D04040181060011406973747265+
	?debug	C 616D403069706678247169
	?debug	C E382100000002D040409810600
	?debug	C E382120000002D040409810600
	?debug	C E382140000002D010409810600
	?debug	C E3821600040035810600
	?debug	C E382170000002D82160401810600124069737472+
	?debug	C 65616D40307365656B6724716C
	?debug	C E382190000002D821604018106001B4069737472+
	?debug	C 65616D40307365656B6724716C387365656B5F64+
	?debug	C 6972
	?debug	C E3821B0000002D06040181060012406973747265+
	?debug	C 616D403074656C6C67247176
	?debug	C E3821D0000002D040409810600
	?debug	C E3821F0000002D82160401810600154069737472+
	?debug	C 65616D403067657424716E7A63697A63
	?debug	C E382210000002D82160409810600
	?debug	C E382230000002D82160401810600144069737472+
	?debug	C 65616D40307265616424716E7A6369
	?debug	C E382250000002D82160409810600
	?debug	C E382270000002D82160401810600194069737472+
	?debug	C 65616D40306765746C696E6524716E7A63697A63
	?debug	C E382290000002D82160409810600
	?debug	C E3822B0000002D821604018106001C4069737472+
	?debug	C 65616D403067657424716D3973747265616D6275+
	?debug	C 667A63
	?debug	C E3822D0000002D82160401810600124069737472+
	?debug	C 65616D403067657424716D7563
	?debug	C E3822F0000002D82160401810600124069737472+
	?debug	C 65616D403067657424716D7A63
	?debug	C E382310000002D04040181060010406973747265+
	?debug	C 616D4030676574247176
	?debug	C E382330000002D040409810600
	?debug	C E382350000002D040409810600
	?debug	C E382370000002D82160401810600154069737472+
	?debug	C 65616D40307075746261636B24717A63
	?debug	C E382390000002D82160401810600144069737472+
	?debug	C 65616D403069676E6F726524716969
	?debug	C E3823B0000002D8216040D810600
	?debug	C E3823D0000002D821604058106001E4069737472+
	?debug	C 65616D4030246272736824716E716D33696F7324+
	?debug	C 6D33696F73
	?debug	C E3823F0000002D82160405810600144069737472+
	?debug	C 65616D4030246272736824716E7A63
	?debug	C E382410000002D8216040D810600
	?debug	C E382430000002D82160405810600144069737472+
	?debug	C 65616D4030246272736824716D7563
	?debug	C E382450000002D82160405810600144069737472+
	?debug	C 65616D4030246272736824716D7A63
	?debug	C E382470000002D82160405810600134069737472+
	?debug	C 65616D4030246272736824716D73
	?debug	C E382490000002D82160405810600134069737472+
	?debug	C 65616D4030246272736824716D69
	?debug	C E3824B0000002D82160405810600134069737472+
	?debug	C 65616D4030246272736824716D6C
	?debug	C E3824D0000002D82160405810600144069737472+
	?debug	C 65616D4030246272736824716D7573
	?debug	C E3824F0000002D82160405810600144069737472+
	?debug	C 65616D4030246272736824716D7569
	?debug	C E382510000002D82160405810600144069737472+
	?debug	C 65616D4030246272736824716D756C
	?debug	C E382530000002D82160405810600134069737472+
	?debug	C 65616D4030246272736824716D66
	?debug	C E382550000002D82160405810600134069737472+
	?debug	C 65616D4030246272736824716D64
	?debug	C E382570000002D82160405810600134069737472+
	?debug	C 65616D4030246272736824716D67
	?debug	C E382590000002D821604058106001C4069737472+
	?debug	C 65616D4030246272736824716E3973747265616D+
	?debug	C 627566
	?debug	C E3825B0000002D82030401810600124069737472+
	?debug	C 65616D40302462637472247176
	?debug	C E3825D0000002D01040181060015406973747265+
	?debug	C 616D40306561747768697465247176
	?debug	C E3825F0000002D02040181060013406973747265+
	?debug	C 616D4030646F5F676574247176
	?debug	C E3810508696F73747265616D38002E12
	?debug	C ED0012020081940E0213001500
	?debug	C E3826100040016810500
	?debug	C E382620000002D826104018105001D40696F7374+
	?debug	C 7265616D4030246263747224716E397374726561+
	?debug	C 6D627566
	?debug	C E382640000002D0104018105001340696F737472+
	?debug	C 65616D40302462647472247176
	?debug	C E382660000002D826104018105001340696F7374+
	?debug	C 7265616D40302462637472247176
	?debug	C E3810413696F73747265616D5F77697468617373+
	?debug	C 69676E38002E11
	?debug	C ED0011020081980E011200
	?debug	C E3826800040016810400
	?debug	C E382690000002D826804018104001E40696F7374+
	?debug	C 7265616D5F7769746861737369676E4030246263+
	?debug	C 7472247176
	?debug	C E3826B0000002D0104018104001E40696F737472+
	?debug	C 65616D5F7769746861737369676E403024626474+
	?debug	C 72247176
	?debug	C E3826D00040035810400
	?debug	C E3826E0000002D826D04058104002240696F7374+
	?debug	C 7265616D5F7769746861737369676E4030246261+
	?debug	C 736724716D33696F73
	?debug	C E382700000002D826D04058104002840696F7374+
	?debug	C 7265616D5F7769746861737369676E4030246261+
	?debug	C 736724716E3973747265616D627566
	?debug	C E38272126F73747265616D5F7769746861737369+
	?debug	C 676E30002E17
	?debug	C ED00170200819D0E011500
	?debug	C E3827300040016827200
	?debug	C E382740000002D827304018272001D406F737472+
	?debug	C 65616D5F7769746861737369676E403024626374+
	?debug	C 72247176
	?debug	C E382760000002D0104018272001D406F73747265+
	?debug	C 616D5F7769746861737369676E40302462647472+
	?debug	C 247176
	?debug	C E3827800040035827200
	?debug	C E382790000002D8278040582720025406F737472+
	?debug	C 65616D5F7769746861737369676E403024626173+
	?debug	C 6724716D376F73747265616D
	?debug	C E3827B0000002D8278040582720027406F737472+
	?debug	C 65616D5F7769746861737369676E403024626173+
	?debug	C 6724716E3973747265616D627566
	?debug	C E3827D126973747265616D5F7769746861737369+
	?debug	C 676E32002E18
	?debug	C ED0018020081A20E011300
	?debug	C E3827E00040016827D00
	?debug	C E3827F0000002D827E0401827D001D4069737472+
	?debug	C 65616D5F7769746861737369676E403024626374+
	?debug	C 72247176
	?debug	C E382810000002D010401827D001D406973747265+
	?debug	C 616D5F7769746861737369676E40302462647472+
	?debug	C 247176
	?debug	C E3828300040035827D00
	?debug	C E382840000002D82830405827D00254069737472+
	?debug	C 65616D5F7769746861737369676E403024626173+
	?debug	C 6724716D376973747265616D
	?debug	C E382860000002D82830405827D00274069737472+
	?debug	C 65616D5F7769746861737369676E403024626173+
	?debug	C 6724716E3973747265616D627566
	?debug	C E38288095363686564756C657201002E19
	?debug	C ED0019000081A70E00
	?debug	C E382890000002D01040182880016405363686564+
	?debug	C 756C6572403070757424716E33504342
	?debug	C E3828B0000002D3B040182880012405363686564+
	?debug	C 756C65724030676574247176
	?debug	C E3828D0554696D657201002E1A
	?debug	C ED001A000081AA0E00
	?debug	C E3828E0000002D010401828D000F4054696D6572+
	?debug	C 4030696E6974247176
	?debug	C E382900000002D010401828D00124054696D6572+
	?debug	C 4030726573746F7265247176
	?debug	C E3829200000023010400
	?debug	C EB0C406469737061746368247176829200
	?debug	C E3829300000023010400
	?debug	C EB0B40246264656C6524716E76829300
	?debug	C E382940000002381800400
	?debug	C EB0A4024626E657724717569829400
	?debug	C E61452696F73747265616D5F7769746861737369+
	?debug	C 676E826D06001450696F73747265616D5F776974+
	?debug	C 6861737369676E8268060013526F73747265616D+
	?debug	C 5F7769746861737369676E8278060013506F7374+
	?debug	C 7265616D5F7769746861737369676E8273060013+
	?debug	C 526973747265616D5F7769746861737369676E82+
	?debug	C 83060013506973747265616D5F77697468617373+
	?debug	C 69676E827E06000950696F73747265616D826106+
	?debug	C 0008526F73747265616D8137060008506F737472+
	?debug	C 65616D8129060008526973747265616D82160600+
	?debug	C 08506973747265616D820306000A507374726561+
	?debug	C 6D627566818506000450696F73810E0600097374+
	?debug	C 7265616D6F66660606000973747265616D706F73+
	?debug	C 06060009707472646966665F7406060008536967+
	?debug	C 6E616C49640A06000D5369676E616C48616E646C+
	?debug	C 657265060002494404060009537461636B53697A+
	?debug	C 650C06000666706F735F740606000673697A655F+
	?debug	C 740A06000454696D650A06000E696F735F757365+
	?debug	C 725F756E696F6E01070013696F73747265616D5F+
	?debug	C 7769746861737369676E81040700126F73747265+
	?debug	C 616D5F7769746861737369676E82720700126973+
	?debug	C 747265616D5F7769746861737369676E827D0700+
	?debug	C 08696F73747265616D81050700076F7374726561+
	?debug	C 6D812A0700076973747265616D81060700097374+
	?debug	C 7265616D6275668186070003696F738107070009+
	?debug	C 5363686564756C6572828807000A3C74656D706C+
	?debug	C 6174653E1D07000A3C74656D706C6174653E1F07+
	?debug	C 000750434274696D6580EF07000A3C74656D706C+
	?debug	C 6174653E809807000A3C74656D706C6174653E7E+
	?debug	C 07000A3C74656D706C6174653E64070006537461+
	?debug	C 7465733F07000554696D6572828D070006546872+
	?debug	C 656164420700035043423C07000953656D617068+
	?debug	C 6F72651B0700094B65726E656C53656D190700
	?debug	F @_STDES_$qv 0 24 0
	?debug	F @_STCON_$qv 0 24 0
	?debug	C E27001541870044E6F64652200066C656E677468+
	?debug	C 0400046865616421481E40254C69737424746E39+
	?debug	C 4B65726E656C53656D2540657261736524777176+
	?debug	C 28482740254C69737424746E394B65726E656C53+
	?debug	C 656D2540707573682477716E394B65726E656C53+
	?debug	C 656D2A482B40254C69737424746E394B65726E65+
	?debug	C 6C53656D2540707573684261636B2477716E394B+
	?debug	C 65726E656C53656D2C481C40254C69737424746E+
	?debug	C 394B65726E656C53656D2540706F70247771762E+
	?debug	C 491D40254C69737424746E394B65726E656C5365+
	?debug	C 6D2540246264747224717630482C40254C697374+
	?debug	C 24746E394B65726E656C53656D254064656C6574+
	?debug	C 6576616C2477716E394B65726E656C53656D3248+
	?debug	C 3940254C69737424746E394B65726E656C53656D+
	?debug	C 254064656C4E6F646524716E3234254C69737424+
	?debug	C 746E394B65726E656C53656D25404E6F64653448+
	?debug	C 1F40254C69737424746E394B65726E656C53656D+
	?debug	C 254067657448656164247176364A1D40254C6973+
	?debug	C 7424746E394B65726E656C53656D254024626374+
	?debug	C 7224717638C006000000
	?debug	C E2000376616C1800046E657874214A2D40254C69+
	?debug	C 737424746E394B65726E656C53656D25404E6F64+
	?debug	C 654030246263747224716E394B65726E656C5365+
	?debug	C 6D26C008000000
	?debug	C E27001543A70044E6F64652500066C656E677468+
	?debug	C 0400046865616424482440254C69737456616C24+
	?debug	C 74313250434274696D6540456C656D2540657261+
	?debug	C 73652477717680D7483040254C69737456616C24+
	?debug	C 74313250434274696D6540456C656D2540707573+
	?debug	C 68247771313250434274696D6540456C656D80D9+
	?debug	C 482240254C69737456616C247431325043427469+
	?debug	C 6D6540456C656D2540706F702477717680DB4923+
	?debug	C 40254C69737456616C2474313250434274696D65+
	?debug	C 40456C656D2540246264747224717680DD483F40+
	?debug	C 254C69737456616C2474313250434274696D6540+
	?debug	C 456C656D254064656C4E6F646524716E3330254C+
	?debug	C 69737456616C2474313250434274696D6540456C+
	?debug	C 6F7280DF4A2340254C69737456616C2474313250+
	?debug	C 434274696D6540456C656D254024626374722471+
	?debug	C 7680E1482540254C69737456616C247431325043+
	?debug	C 4274696D6540456C656D25406865616456616C24+
	?debug	C 717680E3C006000000
	?debug	C E200037063623B000474696D650A4A1D40504342+
	?debug	C 74696D6540456C656D4030246263747224716E33+
	?debug	C 504342756980D3C006000000
	?debug	C E2600D40504342403072756E6E696E673D000573+
	?debug	C 7461636B3E000273730A000273700A000262700A+
	?debug	C 00056B76616E740A00096C6F636B436F756E7404+
	?debug	C 0002696404000B74696D65556E626C6F636B0400+
	?debug	C 0573746174653F00086D7954687265616441600B+
	?debug	C 4050434240304D4158494404000E7369676E616C+
	?debug	C 48616E646C65727363000D616374697665536967+
	?debug	C 6E616C737E000A7369676E616C4C6F636B809660+
	?debug	C 16405043424030676C6F62616C5369676E616C4C+
	?debug	C 6F636B80970006706172656E743B600C40504342+
	?debug	C 4030616C6C50434280980007626C6F636B656480+
	?debug	C 98600D405043424030696E697469616C3D600E40+
	?debug	C 504342403064756D6D795043423D601440504342+
	?debug	C 403072756E6E696E675468726561647304600D40+
	?debug	C 5043424030706F6D6C6973747E4A114050434240+
	?debug	C 3024626374722471756C756980B04A1940504342+
	?debug	C 4030246263747224716E36546872656164756C75+
	?debug	C 6980B24817405043424030777261707065722471+
	?debug	C 6E3654687265616480B448184050434240306164+
	?debug	C 64546F416C6C50434224716E3350434280B6481D+
	?debug	C 40504342403064656C65746546726F6D416C6C50+
	?debug	C 434224716E3350434280B8481D40504342403061+
	?debug	C 6464546F426C6F636B65644C69737424716E3350+
	?debug	C 434280BA4814405043424030756E626C6F636B41+
	?debug	C 6C6C2477717680BC490E40504342403024626474+
	?debug	C 7224717680BE48114050434240307369676E616C+
	?debug	C 247771756980C0481E4050434240307265676973+
	?debug	C 74657248616E646C6572247175696E7176247680+
	?debug	C C2481F405043424030756E726567697374657241+
	?debug	C 6C6C48616E646C6572732471756980C448154050+
	?debug	C 4342403073776170247175696E71762476743280+
	?debug	C C64815405043424030626C6F636B5369676E616C+
	?debug	C 2471756980C8481D405043424030626C6F636B53+
	?debug	C 69676E616C476C6F62616C6C792471756980CA48+
	?debug	C 17405043424030756E626C6F636B5369676E616C+
	?debug	C 2471756980CC481F405043424030756E626C6F63+
	?debug	C 6B5369676E616C476C6F62616C6C792471756980+
	?debug	C CE4813405043424030646F5369676E616C732477+
	?debug	C 717680D0C0A8000000
	?debug	C E40004444F4E4500000005524541445901000004+
	?debug	C 4D41444502008007424C4F434B45440300
	?debug	C E248114054687265616440307374617274247176+
	?debug	C 43481A40546872656164403077616974546F436F+
	?debug	C 6D706C657465247176454D114054687265616440+
	?debug	C 3024626474722471764748114054687265616440+
	?debug	C 3067657449642471764948184054687265616440+
	?debug	C 3067657452756E6E696E6749642471764B481940+
	?debug	C 5468726561644030676574546872656164427949+
	?debug	C 642471694D48134054687265616440307369676E+
	?debug	C 616C247175694F48214054687265616440307265+
	?debug	C 67697374657248616E646C6572247175696E7176+
	?debug	C 2476514822405468726561644030756E72656769+
	?debug	C 73746572416C6C48616E646C6572732471756953+
	?debug	C 481840546872656164403073776170247175696E+
	?debug	C 717624767432554818405468726561644030626C+
	?debug	C 6F636B5369676E616C2471756957482040546872+
	?debug	C 6561644030626C6F636B5369676E616C476C6F62+
	?debug	C 616C6C792471756959481A405468726561644030+
	?debug	C 756E626C6F636B5369676E616C247175695B4822+
	?debug	C 405468726561644030756E626C6F636B5369676E+
	?debug	C 616C476C6F62616C6C79247175695D4A14405468+
	?debug	C 72656164403024626374722471756C75695F4C0F+
	?debug	C 40546872656164403072756E2471766140040000+
	?debug	C 0000056D795043423BC008000000
	?debug	C E27001546570044E6F64656700066C656E677468+
	?debug	C 0400046865616468481840254C69737424746E71+
	?debug	C 76247625406572617365247771766B481B40254C+
	?debug	C 69737424746E717624762540707573682477716E+
	?debug	C 717624766D481F40254C69737424746E71762476+
	?debug	C 2540707573684261636B2477716E717624766F48+
	?debug	C 1640254C69737424746E717624762540706F7024+
	?debug	C 77717671491740254C69737424746E7176247625+
	?debug	C 40246264747224717673482040254C6973742474+
	?debug	C 6E71762476254064656C65746576616C2477716E+
	?debug	C 7176247675482D40254C69737424746E71762476+
	?debug	C 254064656C4E6F646524716E3138254C69737424+
	?debug	C 746E7176247625404E6F646577481940254C6973+
	?debug	C 7424746E71762476254067657448656164247176+
	?debug	C 794A1740254C69737424746E7176247625402462+
	?debug	C 6374722471767CC006000000
	?debug	C E2000376616C6500046E657874684A2140254C69+
	?debug	C 737424746E7176247625404E6F64654030246263+
	?debug	C 747224716E7176247669C008000000
	?debug	C E27001540A70044E6F64657F00066C656E677468+
	?debug	C 040004686561648080481540254C697374247475+
	?debug	C 6925406572617365247771768083481540254C69+
	?debug	C 7374247475692540707573682477717569808548+
	?debug	C 1940254C69737424747569254070757368426163+
	?debug	C 6B24777175698087481340254C69737424747569+
	?debug	C 2540706F70247771768089491440254C69737424+
	?debug	C 74756925402462647472247176808B481A40254C+
	?debug	C 69737424747569254064656C65746576616C2477+
	?debug	C 717569808D482740254C69737424747569254064+
	?debug	C 656C4E6F646524716E3135254C69737424747569+
	?debug	C 25404E6F6465808F481640254C69737424747569+
	?debug	C 25406765744865616424717680914A1440254C69+
	?debug	C 737424747569254024626374722471768094C006+
	?debug	C 000000
	?debug	C E2000376616C0A00046E65787480804A1B40254C+
	?debug	C 6973742474756925404E6F646540302462637472+
	?debug	C 247175698081C006000000
	?debug	C E27001543B70044E6F6465809900066C656E6774+
	?debug	C 6804000468656164809A481840254C6973742474+
	?debug	C 6E335043422540657261736524777176809D481B+
	?debug	C 40254C69737424746E3350434225407075736824+
	?debug	C 77716E33504342809F481F40254C69737424746E+
	?debug	C 335043422540707573684261636B2477716E3350+
	?debug	C 434280A1481640254C69737424746E3350434225+
	?debug	C 40706F702477717680A3491740254C6973742474+
	?debug	C 6E335043422540246264747224717680A5482040+
	?debug	C 254C69737424746E33504342254064656C657465+
	?debug	C 76616C2477716E3350434280A7482D40254C6973+
	?debug	C 7424746E33504342254064656C4E6F646524716E+
	?debug	C 3138254C69737424746E3350434225404E6F6465+
	?debug	C 80A9481940254C69737424746E33504342254067+
	?debug	C 65744865616424717680AB4A1740254C69737424+
	?debug	C 746E335043422540246263747224717680AEC006+
	?debug	C 000000
	?debug	C E2000376616C3B00046E657874809A4A2140254C+
	?debug	C 69737424746E3350434225404E6F646540302462+
	?debug	C 63747224716E33504342809BC008000000
	?debug	C E2000376616C3A00046E657874244A3640254C69+
	?debug	C 737456616C2474313250434274696D6540456C65+
	?debug	C 6D25404E6F646540302462637472247131325043+
	?debug	C 4274696D6540456C656D80D5C00A000000
	?debug	C E24A144053656D6170686F726540302462637472+
	?debug	C 24716980E54D144053656D6170686F7265403024+
	?debug	C 6264747224717680E74C144053656D6170686F72+
	?debug	C 654030776169742471756980E94C154053656D61+
	?debug	C 70686F726540307369676E616C24716980EB4813+
	?debug	C 4053656D6170686F7265403076616C2478717680+
	?debug	C ED400400000000066D79496D706C18C008000000
	?debug	C E26019404B65726E656C53656D4030616C6C5365+
	?debug	C 6D6170686F7265731D000376616C0400056D7953+
	?debug	C 656D1A0007626C6F636B656480EF4814404B6572+
	?debug	C 6E656C53656D4030776169742471756980F64815+
	?debug	C 404B65726E656C53656D40307369676E616C2471+
	?debug	C 6980F84815404B65726E656C53656D4030626C6F+
	?debug	C 636B2471756980FA4816404B65726E656C53656D+
	?debug	C 4030756E626C6F636B24717680FC4A1F404B6572+
	?debug	C 6E656C53656D4030246263747224716E3953656D+
	?debug	C 6170686F72656980FE4914404B65726E656C5365+
	?debug	C 6D4030246264747224717681004817404B65726E+
	?debug	C 656C53656D40307061737354696D652471768102+
	?debug	C C00E000000
	?debug	C E27004456C656D3A00106B6F6C696B6F4F747075+
	?debug	C 7374656E69680400056C697374611F4815405043+
	?debug	C 4274696D6540307061737354696D6524717680F0+
	?debug	C 48194050434274696D6540306164645043422471+
	?debug	C 6E33504342756980F248164050434274696D6540+
	?debug	C 307369676E616C4F6E6524717680F4C008000000
	?debug	C E27008696F5F7374617465810870096F70656E5F+
	?debug	C 6D6F6465810A70087365656B5F646972810C600F+
	?debug	C 40696F734030626173656669656C640660114069+
	?debug	C 6F73403061646A7573746669656C640660104069+
	?debug	C 6F734030666C6F61746669656C64064A1840696F+
	?debug	C 734030246263747224716E3973747265616D6275+
	?debug	C 66810F4D0E40696F734030246264747224717681+
	?debug	C 11480E40696F734030666C616773247176811348+
	?debug	C 0E40696F734030666C61677324716C8115480E40+
	?debug	C 696F7340307365746624716C6C8117480D40696F+
	?debug	C 7340307365746624716C8119480F40696F734030+
	?debug	C 756E7365746624716C811B480E40696F73403077+
	?debug	C 69647468247176811D480E40696F734030776964+
	?debug	C 7468247169811F480D40696F73403066696C6C24+
	?debug	C 71768121480E40696F73403066696C6C24717A63+
	?debug	C 8123481240696F734030707265636973696F6E24+
	?debug	C 71698125481240696F734030707265636973696F+
	?debug	C 6E2471768127481440696F73403074696524716E+
	?debug	C 376F73747265616D8170480C40696F7340307469+
	?debug	C 652471768172481040696F734030726473746174+
	?debug	C 652471768174480C40696F734030656F66247176+
	?debug	C 8176480D40696F7340306661696C247176817848+
	?debug	C 0C40696F734030626164247176817A480D40696F+
	?debug	C 734030676F6F64247176817C480E40696F734030+
	?debug	C 636C656172247169817E4B0D40696F734030246F+
	?debug	C 6E762471768181480E40696F73403024626E6F74+
	?debug	C 2471768183480E40696F73403072646275662471+
	?debug	C 7681E4481140696F734030626974616C6C6F6324+
	?debug	C 717681E6480F40696F73403078616C6C6F632471+
	?debug	C 7681E8480E40696F73403069776F726424716981+
	?debug	C EB480E40696F73403070776F726424716981EE48+
	?debug	C 1840696F73403073796E635F776974685F737464+
	?debug	C 696F24717681F0480D40696F734030736B697024+
	?debug	C 716981F240040000000002627081850005785F74+
	?debug	C 6965812900057374617465040008697370656369+
	?debug	C 616C0400086F7370656369616C040007785F666C+
	?debug	C 61677306000B785F707265636973696F6E040007+
	?debug	C 785F7769647468040006785F66696C6C04000C69+
	?debug	C 7366785F7370656369616C04000C6F7366785F73+
	?debug	C 70656369616C04000664656C62756604000E6173+
	?debug	C 7369676E5F70726976617465044A0E40696F7340+
	?debug	C 30246263747224717681F4481740696F73403069+
	?debug	C 6E697424716E3973747265616D62756681F64811+
	?debug	C 40696F734030736574737461746524716981F860+
	?debug	C 1040696F734030737464696F666C75736881FA60+
	?debug	C 0D40696F7340306E65787462697406600F40696F+
	?debug	C 73403075736572636F756E740400097573657277+
	?debug	C 6F72647381FC00066E776F72647304481140696F+
	?debug	C 7340307573657273697A6524716981FD4A124069+
	?debug	C 6F734030246263747224716D33696F7381FF4812+
	?debug	C 40696F734030246261736724716D33696F738201+
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
	?debug	C 6E3973747265616D627566812B4D12406F737472+
	?debug	C 65616D40302462647472247176812D4A12406F73+
	?debug	C 747265616D40302462637472247169812F4A1540+
	?debug	C 6F73747265616D403024626374722471696E7A63+
	?debug	C 81314811406F73747265616D40306F7066782471+
	?debug	C 7681334811406F73747265616D40306F73667824+
	?debug	C 717681354812406F73747265616D4030666C7573+
	?debug	C 6824717681384812406F73747265616D40307365+
	?debug	C 656B7024716C813A481B406F73747265616D4030+
	?debug	C 7365656B7024716C387365656B5F646972813C48+
	?debug	C 12406F73747265616D403074656C6C7024717681+
	?debug	C 3E4811406F73747265616D403070757424717A63+
	?debug	C 81404816406F73747265616D4030777269746524+
	?debug	C 716E787A636981424816406F73747265616D4030+
	?debug	C 777269746524716E7875636981444813406F7374+
	?debug	C 7265616D403024626C736824717A638146481340+
	?debug	C 6F73747265616D403024626C7368247175638148+
	?debug	C 4812406F73747265616D403024626C7368247173+
	?debug	C 814A4813406F73747265616D403024626C736824+
	?debug	C 717573814C4812406F73747265616D403024626C+
	?debug	C 7368247169814E4813406F73747265616D403024+
	?debug	C 626C73682471756981504812406F73747265616D+
	?debug	C 403024626C736824716C81524813406F73747265+
	?debug	C 616D403024626C73682471756C81544812406F73+
	?debug	C 747265616D403024626C73682471668156481240+
	?debug	C 6F73747265616D403024626C7368247164815848+
	?debug	C 12406F73747265616D403024626C736824716781+
	?debug	C 5A4815406F73747265616D403024626C73682471+
	?debug	C 6E787A63815C4815406F73747265616D40302462+
	?debug	C 6C736824716E787563815E4813406F7374726561+
	?debug	C 6D403024626C736824716E768160481C406F7374+
	?debug	C 7265616D403024626C736824716E397374726561+
	?debug	C 6D62756681624826406F73747265616D40302462+
	?debug	C 6C736824716E716D376F73747265616D246D376F+
	?debug	C 73747265616D8164481E406F73747265616D4030+
	?debug	C 24626C736824716E716D33696F73246D33696F73+
	?debug	C 81664814406F73747265616D4030646F5F6F7066+
	?debug	C 7824717681684814406F73747265616D4030646F+
	?debug	C 5F6F736678247176816A4A12406F73747265616D+
	?debug	C 40302462637472247176816C4818406F73747265+
	?debug	C 616D40306F757473747224716E787A637431816E+
	?debug	C C030000000
	?debug	C E24A144073747265616D62756640302462637472+
	?debug	C 24717681874A174073747265616D627566403024+
	?debug	C 6263747224716E7A636981894D14407374726561+
	?debug	C 6D62756640302462647472247176818B4C184073+
	?debug	C 747265616D627566403073657462756624716E7A+
	?debug	C 6369818D48184073747265616D62756640307365+
	?debug	C 7462756624716E756369818F4819407374726561+
	?debug	C 6D627566403073657462756624716E7A63696981+
	?debug	C 9148144073747265616D62756640307367657463+
	?debug	C 247176819348154073747265616D627566403073+
	?debug	C 6E65787463247176819548154073747265616D62+
	?debug	C 756640307362756D706324717681974815407374+
	?debug	C 7265616D627566403073746F7373632471768199+
	?debug	C 48174073747265616D6275664030736765746E24+
	?debug	C 716E7A6369819B4C1A4073747265616D62756640+
	?debug	C 30646F5F736765746E24716E7A6369819D4C1840+
	?debug	C 73747265616D6275664030756E646572666C6F77+
	?debug	C 247176819F48194073747265616D627566403073+
	?debug	C 7075746261636B6324717A6381A14C1840737472+
	?debug	C 65616D6275664030706261636B6661696C247169+
	?debug	C 81A348174073747265616D6275664030696E5F61+
	?debug	C 7661696C24717681A548144073747265616D6275+
	?debug	C 664030737075746324716981A748184073747265+
	?debug	C 616D6275664030737075746E24716E787A636981+
	?debug	C A94C1B4073747265616D6275664030646F5F7370+
	?debug	C 75746E24716E787A636981AB4C17407374726561+
	?debug	C 6D62756640306F766572666C6F7724716981AD48+
	?debug	C 1A4073747265616D62756640306F75745F776169+
	?debug	C 74696E6724717681AF4C204073747265616D6275+
	?debug	C 6640307365656B6F666624716C387365656B5F64+
	?debug	C 69726981B14C174073747265616D627566403073+
	?debug	C 65656B706F7324716C6981B34C13407374726561+
	?debug	C 6D627566403073796E6324717681B54812407374+
	?debug	C 7265616D627566403064627024717681B7481340+
	?debug	C 73747265616D62756640306261736524717681BA+
	?debug	C 48134073747265616D6275664030656275662471+
	?debug	C 7681BC48134073747265616D6275664030626C65+
	?debug	C 6E24717681BE48144073747265616D6275664030+
	?debug	C 706261736524717681C048134073747265616D62+
	?debug	C 756640307070747224717681C248144073747265+
	?debug	C 616D6275664030657070747224717681C4481440+
	?debug	C 73747265616D6275664030656261636B24717681+
	?debug	C C648134073747265616D62756640306770747224+
	?debug	C 717681C848144073747265616D62756640306567+
	?debug	C 70747224717681CA48174073747265616D627566+
	?debug	C 40307365747024716E7A63743181CC4819407374+
	?debug	C 7265616D62756640307365746724716E7A637431+
	?debug	C 743181CE48144073747265616D62756640307062+
	?debug	C 756D7024716981D048144073747265616D627566+
	?debug	C 40306762756D7024716981D24818407374726561+
	?debug	C 6D62756640307365746224716E7A6374316981D4+
	?debug	C 48194073747265616D6275664030756E62756666+
	?debug	C 6572656424716981D648194073747265616D6275+
	?debug	C 664030756E627566666572656424717681D84817+
	?debug	C 4073747265616D6275664030616C6C6F63617465+
	?debug	C 24717681DA4C194073747265616D627566403064+
	?debug	C 6F616C6C6F6361746524717681DC400400000000+
	?debug	C 06616C6C6F635F040006756E6275665F04000562+
	?debug	C 6173655F81B90005656275665F81B90006706261+
	?debug	C 73655F81B90005707074725F81B9000665707074+
	?debug	C 725F81B90006656261636B5F81B9000567707472+
	?debug	C 5F81B9000665677074725F81B948184073747265+
	?debug	C 616D6275664030646F5F736E6578746324717681+
	?debug	C DE4A1E4073747265616D62756640302462637472+
	?debug	C 24716D3973747265616D62756681E0481E407374+
	?debug	C 7265616D6275664030246261736724716D397374+
	?debug	C 7265616D62756681E2C028000000
	?debug	C E24A1C406973747265616D403024626374722471+
	?debug	C 6E3973747265616D62756682044D124069737472+
	?debug	C 65616D4030246264747224717682064A26406973+
	?debug	C 747265616D4030246263747224716E3973747265+
	?debug	C 616D627566696E376F73747265616D82084A1640+
	?debug	C 6973747265616D403024626374722471696E7A63+
	?debug	C 69820A4A1C406973747265616D40302462637472+
	?debug	C 247169696E376F73747265616D820C4811406973+
	?debug	C 747265616D403069706678247169820E48124069+
	?debug	C 73747265616D4030697066783024717682104812+
	?debug	C 406973747265616D403069706678312471768212+
	?debug	C 4811406973747265616D40306973667824717682+
	?debug	C 144812406973747265616D40307365656B672471+
	?debug	C 6C8217481B406973747265616D40307365656B67+
	?debug	C 24716C387365656B5F6469728219481240697374+
	?debug	C 7265616D403074656C6C67247176821B48114069+
	?debug	C 73747265616D403073796E63247176821D481540+
	?debug	C 6973747265616D403067657424716E7A63697A63+
	?debug	C 821F4815406973747265616D403067657424716E+
	?debug	C 7563697A6382214814406973747265616D403072+
	?debug	C 65616424716E7A63698223481440697374726561+
	?debug	C 6D40307265616424716E75636982254819406973+
	?debug	C 747265616D40306765746C696E6524716E7A6369+
	?debug	C 7A6382274819406973747265616D40306765746C+
	?debug	C 696E6524716E7563697A638229481C4069737472+
	?debug	C 65616D403067657424716D3973747265616D6275+
	?debug	C 667A63822B4812406973747265616D4030676574+
	?debug	C 24716D7563822D4812406973747265616D403067+
	?debug	C 657424716D7A63822F4810406973747265616D40+
	?debug	C 3067657424717682314811406973747265616D40+
	?debug	C 307065656B24717682334813406973747265616D+
	?debug	C 403067636F756E74247176823548154069737472+
	?debug	C 65616D40307075746261636B24717A6382374814+
	?debug	C 406973747265616D403069676E6F726524716969+
	?debug	C 82394826406973747265616D4030246272736824+
	?debug	C 716E716D376973747265616D246D376973747265+
	?debug	C 616D823B481E406973747265616D403024627273+
	?debug	C 6824716E716D33696F73246D33696F73823D4814+
	?debug	C 406973747265616D4030246272736824716E7A63+
	?debug	C 823F4814406973747265616D4030246272736824+
	?debug	C 716E756382414814406973747265616D40302462+
	?debug	C 72736824716D756382434814406973747265616D+
	?debug	C 4030246272736824716D7A638245481340697374+
	?debug	C 7265616D4030246272736824716D738247481340+
	?debug	C 6973747265616D4030246272736824716D698249+
	?debug	C 4813406973747265616D4030246272736824716D+
	?debug	C 6C824B4814406973747265616D40302462727368+
	?debug	C 24716D7573824D4814406973747265616D403024+
	?debug	C 6272736824716D7569824F481440697374726561+
	?debug	C 6D4030246272736824716D756C82514813406973+
	?debug	C 747265616D4030246272736824716D6682534813+
	?debug	C 406973747265616D4030246272736824716D6482+
	?debug	C 554813406973747265616D403024627273682471+
	?debug	C 6D678257481C406973747265616D403024627273+
	?debug	C 6824716E3973747265616D62756682594A124069+
	?debug	C 73747265616D40302462637472247176825B4815+
	?debug	C 406973747265616D403065617477686974652471+
	?debug	C 76825D4006000000000767636F756E745F044813+
	?debug	C 406973747265616D4030646F5F67657424717682+
	?debug	C 5FC032000000
	?debug	C E24A1D40696F73747265616D4030246263747224+
	?debug	C 716E3973747265616D62756682624D1340696F73+
	?debug	C 747265616D4030246264747224717682644A1340+
	?debug	C 696F73747265616D403024626374722471768266+
	?debug	C C038000000
	?debug	C E24A1E40696F73747265616D5F77697468617373+
	?debug	C 69676E4030246263747224717682694D1E40696F+
	?debug	C 73747265616D5F7769746861737369676E403024+
	?debug	C 62647472247176826B482240696F73747265616D+
	?debug	C 5F7769746861737369676E403024626173672471+
	?debug	C 6D33696F73826E482840696F73747265616D5F77+
	?debug	C 69746861737369676E4030246261736724716E39+
	?debug	C 73747265616D6275668270C038000000
	?debug	C E24A1D406F73747265616D5F7769746861737369+
	?debug	C 676E4030246263747224717682744D1D406F7374+
	?debug	C 7265616D5F7769746861737369676E4030246264+
	?debug	C 747224717682764825406F73747265616D5F7769+
	?debug	C 746861737369676E4030246261736724716D376F+
	?debug	C 73747265616D82794827406F73747265616D5F77+
	?debug	C 69746861737369676E4030246261736724716E39+
	?debug	C 73747265616D627566827BC030000000
	?debug	C E24A1D406973747265616D5F7769746861737369+
	?debug	C 676E40302462637472247176827F4D1D40697374+
	?debug	C 7265616D5F7769746861737369676E4030246264+
	?debug	C 747224717682814825406973747265616D5F7769+
	?debug	C 746861737369676E4030246261736724716D3769+
	?debug	C 73747265616D82844827406973747265616D5F77+
	?debug	C 69746861737369676E4030246261736724716E39+
	?debug	C 73747265616D6275668286C032000000
	?debug	C E24816405363686564756C657240307075742471+
	?debug	C 6E3350434282894812405363686564756C657240+
	?debug	C 30676574247176828BC001000000
	?debug	C E2600E4054696D6572403062726F6A61630A6023+
	?debug	C 4054696D657240307A6168746576616E615F7072+
	?debug	C 6F6D656E615F6B6F6E74656B7374610A60154054+
	?debug	C 696D65724030676C6F62616C4C6F636B436E7404+
	?debug	C 60174054696D65724030706F7A76616E5F646973+
	?debug	C 70617463680460124054696D657240306E656564+
	?debug	C 546F4B696C6C04480F4054696D65724030696E69+
	?debug	C 74247176828E48124054696D6572403072657374+
	?debug	C 6F72652471768290C001000000
	end
