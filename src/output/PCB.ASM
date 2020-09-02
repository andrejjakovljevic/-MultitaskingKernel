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
	?debug	S "pcb.cpp"
	?debug	C E93C57A350077063622E637070
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
	?debug	C E94029CA1815633A5C626333315C696E636C7564655C646F732E68
	?debug	C E9DB767A40102E2E5C685C5343484544554C45522E48
	?debug	C E94029CA1817633A5C626333315C696E636C7564655C737464696F+
	?debug	C 2E68
	?debug	C E94A72A2500D2E2E5C685C6D6163726F732E68
	?debug	C E94029CA181A633A5C626333315C696E636C7564655C696F737472+
	?debug	C 65616D2E68
	?debug	C E94029CA1815633A5C626333315C696E636C7564655C6D656D2E68
PCB_TEXT	segment byte public 'CODE'
PCB_TEXT	ends
	assume	cs:PCB_TEXT,ds:PCB_DATA
PCB_DATA	segment word public 'FAR_DATA'
d@	label	byte
d@w	label	word
b@	label	byte
b@w	label	word
PCB_DATA	ends
PCB5_DATA	segment para public 'FAR_DATA'
@PCB@0MAXID	label	word
	db	0
	db	0
@PCB@0allPCB	label	word
	db	6 dup (0)
@PCB@0runningThreads	label	word
	db	0
	db	0
@PCB@0pomlist	label	word
	db	6 dup (0)
PCB5_DATA	ends
PCB_TEXT	segment byte public 'CODE'
	?debug	C E801077063622E6370703C57A350
   ;	
   ;	void DummyThread::run()
   ;	
	?debug	L 20
	assume	cs:PCB_TEXT
@DummyThread@0run$qv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F8144044756D6D79546872656164403072756E24+
	?debug	C 7176
	?debug	C E318000400161900
	?debug	C E604746869731802060000
@1@30:
	?debug	B
	jmp	short @1@30
   ;	
   ;	{
   ;	    /*softlock;
   ;	    printf("dummy\n");
   ;	    softunlock;*/
   ;	    while(1)
   ;	    {
   ;	    }
   ;	}
   ;	
	?debug	L 28
	pop	ds
	pop	bp
	ret	
	?debug	C E604746869731802060000
	?debug	E
	?debug	E
@DummyThread@0run$qv	endp
PCB_TEXT	ends
PCB5_DATA	segment para public 'FAR_DATA'
@PCB@0dummyPCB	label	dword
	db	4 dup (0)
@PCB@0initial	label	dword
	db	4 dup (0)
@PCB@0running	label	dword
	db	4 dup (0)
@PCB@0globalSignalLock	label	word
	db	0
	db	0
	db	30 dup (0)
PCB5_DATA	ends
PCB_TEXT	segment byte public 'CODE'
   ;	
   ;	PCB::PCB(StackSize stackSize, Time timeSlice)
   ;	
	?debug	L 36
	assume	cs:PCB_TEXT
@PCB@0$bctr$qului	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	si
	push	di
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F81140504342403024626374722471756C7569
	?debug	C E31A000400161B00
	?debug	C E60974696D65536C6963650A0A0E000009737461+
	?debug	C 636B53697A650C0A0A000004746869731A020600+
	?debug	C 00
	?debug	B
   ;	
   ;	{
   ;	
	?debug	L 37
	mov	ax,word ptr [bp+6]
	or	ax,word ptr [bp+8]
	jne	short @2@86
	mov	ax,168
	push	ax
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp+8],dx
	mov	word ptr [bp+6],ax
	or	ax,dx
	jne	@@1
	jmp	@2@366
@@1:
@2@86:
	mov	ax,seg @@%List$tnqv$v%@$bctr$qv
	push	ax
	mov	ax,offset @@%List$tnqv$v%@$bctr$qv
	push	ax
	mov	ax,5
	push	ax
	xor	ax,ax
	mov	dx,16
	push	ax
	push	dx
	mov	ax,6
	push	ax
	mov	ax,word ptr [bp+6]
	add	ax,24
	push	word ptr [bp+8]
	push	ax
	call	far ptr @_vector_new_$qnvuiuluie
	add	sp,16
	mov	ax,word ptr [bp+6]
	add	ax,120
	push	word ptr [bp+8]
	push	ax
	call	far ptr @@%List$tui%@$bctr$qv
	pop	cx
	pop	cx
	mov	ax,word ptr [bp+6]
	add	ax,162
	push	word ptr [bp+8]
	push	ax
	call	far ptr @@%List$tn3PCB%@$bctr$qv
	pop	cx
	pop	cx
   ;	
   ;	    softlock;
   ;	
	?debug	L 38
 	pushf	
 	cli	
   ;	
   ;	    myThread=0;
   ;	
	?debug	L 39
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],0
	mov	word ptr es:[bx+20],0
   ;	
   ;	    stackSize/=sizeof(unsigned);
   ;	
	?debug	L 40
	mov	cx,1
	mov	dx,word ptr [bp+12]
	mov	ax,word ptr [bp+10]
	call	far ptr F_LXURSH@
	mov	word ptr [bp+12],dx
	mov	word ptr [bp+10],ax
   ;	
   ;	    stack = new unsigned[stackSize];
   ;	
	?debug	L 41
	mov	ax,word ptr [bp+10]
	shl	ax,1
	push	ax
	call	far ptr @$bnew$qui
	pop	cx
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+2],dx
	mov	word ptr es:[bx],ax
   ;	
   ;	    stack[stackSize-1]=FP_SEG(myThread);
   ;	
	?debug	L 42
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx]
	mov	ax,word ptr [bp+10]
	dec	ax
	shl	ax,1
	add	bx,ax
	push	es
	les	si,dword ptr [bp+6]
	mov	ax,word ptr es:[si+22]
	pop	es
	mov	word ptr es:[bx],ax
   ;	
   ;	    stack[stackSize-2]=FP_OFF(myThread);
   ;	
	?debug	L 43
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx]
	mov	ax,word ptr [bp+10]
	add	ax,-2
	shl	ax,1
	add	bx,ax
	push	es
	les	si,dword ptr [bp+6]
	mov	ax,word ptr es:[si+20]
	pop	es
	mov	word ptr es:[bx],ax
   ;	
   ;	    stack[stackSize-5]=0x200;
   ;	
	?debug	L 44
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx]
	mov	ax,word ptr [bp+10]
	add	ax,-5
	shl	ax,1
	add	bx,ax
	mov	word ptr es:[bx],512
   ;	
   ;	    stack[stackSize-6]=FP_SEG(PCB::wrapper);
   ;	
	?debug	L 45
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx]
	mov	ax,word ptr [bp+10]
	add	ax,-6
	shl	ax,1
	add	bx,ax
	mov	word ptr es:[bx],seg @PCB@0wrapper$qn6Thread
   ;	
   ;	    stack[stackSize-7]=FP_OFF(PCB::wrapper);
   ;	
	?debug	L 46
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx]
	mov	ax,word ptr [bp+10]
	add	ax,-7
	shl	ax,1
	add	bx,ax
	mov	word ptr es:[bx],offset @PCB@0wrapper$qn6Thread
   ;	
   ;	    ss=FP_SEG(stack+stackSize-16);
   ;	
	?debug	L 47
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	mov	dx,word ptr es:[bx]
	mov	bx,word ptr [bp+10]
	shl	bx,1
	add	dx,bx
	add	dx,-32
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+4],ax
   ;	
   ;	    sp=FP_OFF(stack+stackSize-16);
   ;	
	?debug	L 48
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx]
	mov	dx,word ptr [bp+10]
	shl	dx,1
	add	ax,dx
	add	ax,-32
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+6],ax
   ;	
   ;	    bp=sp;
   ;	
	?debug	L 49
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+6]
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+8],ax
   ;	
   ;	    lockCount=0;
   ;	
	?debug	L 50
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+12],0
   ;	
   ;	    id=MAXID;
   ;	
	?debug	L 51
	les	bx,dword ptr [bp+6]
	mov	ax,seg @PCB@0MAXID
	push	es
	mov	es,ax
	mov	ax,word ptr es:@PCB@0MAXID
	pop	es
	mov	word ptr es:[bx+14],ax
   ;	
   ;	    MAXID++;
   ;	
	?debug	L 52
	mov	ax,seg @PCB@0MAXID
	mov	es,ax
	inc	word ptr es:@PCB@0MAXID
   ;	
   ;	    state=MADE;
   ;	
	?debug	L 53
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+18],2
   ;	
   ;	    kvant=timeSlice;
   ;	
	?debug	L 54
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp+14]
	mov	word ptr es:[bx+10],ax
   ;	
   ;	    timeUnblock=0;
   ;	
	?debug	L 55
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+16],0
   ;	
   ;	    if (kvant==0) kvant=-1;    
   ;	
	?debug	L 56
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+10],0
	jne	short @2@226
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+10],-1
@2@226:
   ;	
   ;	    parent=0;
   ;	
	?debug	L 57
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+160],0
	mov	word ptr es:[bx+158],0
   ;	
   ;	    for (int i=0;i<16;i++)
   ;	
	?debug	L 58
	xor	di,di
	jmp	short @2@310
@2@254:
   ;	
   ;	    {
   ;	        signalLock[i]=0;
   ;	
	?debug	L 60
	mov	ax,di
	shl	ax,1
	les	bx,dword ptr [bp+6]
	add	bx,ax
	mov	word ptr es:[bx+126],0
	?debug	L 58
	inc	di
@2@310:
	cmp	di,16
	jl	short @2@254
   ;	
   ;	    }
   ;	    softunlock; 
   ;	
	?debug	L 62
 	popf	
@2@366:
   ;	
   ;	}
   ;	
	?debug	L 63
	mov	dx,word ptr [bp+8]
	mov	ax,word ptr [bp+6]
	jmp	short @2@394
@2@394:
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
	?debug	C E601690404070004746869731A02060000097374+
	?debug	C 61636B53697A650C0A0A00000974696D65536C69+
	?debug	C 63650A0A0E0000
	?debug	E
	?debug	E
@PCB@0$bctr$qului	endp
   ;	
   ;	PCB::PCB(Thread* th, StackSize stackSize, Time timeSlice)
   ;	
	?debug	L 65
	assume	cs:PCB_TEXT
@PCB@0$bctr$qn6Threadului	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	sub	sp,6
	push	si
	push	di
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F819405043424030246263747224716E36546872+
	?debug	C 656164756C7569
	?debug	C E31C000400161D00
	?debug	C E60974696D65536C6963650A0A12000009737461+
	?debug	C 636B53697A650C0A0E00000274681C0A0A000004+
	?debug	C 746869731A02060000
	?debug	B
   ;	
   ;	{
   ;	
	?debug	L 66
	mov	ax,word ptr [bp+6]
	or	ax,word ptr [bp+8]
	jne	short @3@86
	mov	ax,168
	push	ax
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp+8],dx
	mov	word ptr [bp+6],ax
	or	ax,dx
	jne	@@2
	jmp	@3@786
@@2:
@3@86:
	mov	ax,seg @@%List$tnqv$v%@$bctr$qv
	push	ax
	mov	ax,offset @@%List$tnqv$v%@$bctr$qv
	push	ax
	mov	ax,5
	push	ax
	xor	ax,ax
	mov	dx,16
	push	ax
	push	dx
	mov	ax,6
	push	ax
	mov	ax,word ptr [bp+6]
	add	ax,24
	push	word ptr [bp+8]
	push	ax
	call	far ptr @_vector_new_$qnvuiuluie
	add	sp,16
	mov	ax,word ptr [bp+6]
	add	ax,120
	push	word ptr [bp+8]
	push	ax
	call	far ptr @@%List$tui%@$bctr$qv
	pop	cx
	pop	cx
	mov	ax,word ptr [bp+6]
	add	ax,162
	push	word ptr [bp+8]
	push	ax
	call	far ptr @@%List$tn3PCB%@$bctr$qv
	pop	cx
	pop	cx
   ;	
   ;	    softlock;
   ;	
	?debug	L 67
 	pushf	
 	cli	
   ;	
   ;	    if (stackSize>MAX_SIZE) stackSize=MAX_SIZE;
   ;	
	?debug	L 68
	cmp	word ptr [bp+16],1
	jb	short @3@282
	ja	short @3@254
	cmp	word ptr [bp+14],0
	jbe	short @3@282
@3@254:
	mov	word ptr [bp+16],1
	mov	word ptr [bp+14],0
@3@282:
   ;	
   ;	    if (stackSize<MIN_SIZE) stackSize=MIN_SIZE;
   ;	
	?debug	L 69
	cmp	word ptr [bp+16],0
	ja	short @3@394
	jb	short @3@366
	cmp	word ptr [bp+14],256
	jae	short @3@394
@3@366:
	mov	word ptr [bp+16],0
	mov	word ptr [bp+14],256
@3@394:
   ;	
   ;	    //printf("stack=%d\n",stackSize);
   ;	    myThread=th;
   ;	
	?debug	L 71
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp+12]
	mov	dx,word ptr [bp+10]
	mov	word ptr es:[bx+22],ax
	mov	word ptr es:[bx+20],dx
   ;	
   ;	    stackSize/=sizeof(unsigned);
   ;	
	?debug	L 72
	mov	cx,1
	mov	dx,word ptr [bp+16]
	mov	ax,word ptr [bp+14]
	call	far ptr F_LXURSH@
	mov	word ptr [bp+16],dx
	mov	word ptr [bp+14],ax
   ;	
   ;	    stack = new unsigned[stackSize];
   ;	
	?debug	L 73
	mov	ax,word ptr [bp+14]
	shl	ax,1
	push	ax
	call	far ptr @$bnew$qui
	pop	cx
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+2],dx
	mov	word ptr es:[bx],ax
   ;	
   ;	    stack[stackSize-1]=FP_SEG(myThread);
   ;	
	?debug	L 74
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx]
	mov	ax,word ptr [bp+14]
	dec	ax
	shl	ax,1
	add	bx,ax
	push	es
	les	si,dword ptr [bp+6]
	mov	ax,word ptr es:[si+22]
	pop	es
	mov	word ptr es:[bx],ax
   ;	
   ;	    stack[stackSize-2]=FP_OFF(myThread);
   ;	
	?debug	L 75
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx]
	mov	ax,word ptr [bp+14]
	add	ax,-2
	shl	ax,1
	add	bx,ax
	push	es
	les	si,dword ptr [bp+6]
	mov	ax,word ptr es:[si+20]
	pop	es
	mov	word ptr es:[bx],ax
   ;	
   ;	    stack[stackSize-5]=0x200;
   ;	
	?debug	L 76
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx]
	mov	ax,word ptr [bp+14]
	add	ax,-5
	shl	ax,1
	add	bx,ax
	mov	word ptr es:[bx],512
   ;	
   ;	    stack[stackSize-6]=FP_SEG(PCB::wrapper);
   ;	
	?debug	L 77
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx]
	mov	ax,word ptr [bp+14]
	add	ax,-6
	shl	ax,1
	add	bx,ax
	mov	word ptr es:[bx],seg @PCB@0wrapper$qn6Thread
   ;	
   ;	    stack[stackSize-7]=FP_OFF(PCB::wrapper);
   ;	
	?debug	L 78
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx]
	mov	ax,word ptr [bp+14]
	add	ax,-7
	shl	ax,1
	add	bx,ax
	mov	word ptr es:[bx],offset @PCB@0wrapper$qn6Thread
   ;	
   ;	    ss=FP_SEG(stack+stackSize-16);
   ;	
	?debug	L 79
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	mov	dx,word ptr es:[bx]
	mov	bx,word ptr [bp+14]
	shl	bx,1
	add	dx,bx
	add	dx,-32
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+4],ax
   ;	
   ;	    sp=FP_OFF(stack+stackSize-16);
   ;	
	?debug	L 80
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx]
	mov	dx,word ptr [bp+14]
	shl	dx,1
	add	ax,dx
	add	ax,-32
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+6],ax
   ;	
   ;	    bp=sp;
   ;	
	?debug	L 81
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+6]
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+8],ax
   ;	
   ;	    lockCount=0;
   ;	
	?debug	L 82
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+12],0
   ;	
   ;	    id=MAXID;
   ;	
	?debug	L 83
	les	bx,dword ptr [bp+6]
	mov	ax,seg @PCB@0MAXID
	push	es
	mov	es,ax
	mov	ax,word ptr es:@PCB@0MAXID
	pop	es
	mov	word ptr es:[bx+14],ax
   ;	
   ;	    MAXID++;
   ;	
	?debug	L 84
	mov	ax,seg @PCB@0MAXID
	mov	es,ax
	inc	word ptr es:@PCB@0MAXID
   ;	
   ;	    state=MADE;
   ;	
	?debug	L 85
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+18],2
   ;	
   ;	    kvant=timeSlice;
   ;	
	?debug	L 86
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp+18]
	mov	word ptr es:[bx+10],ax
   ;	
   ;	    timeUnblock=0;
   ;	
	?debug	L 87
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+16],0
   ;	
   ;	    if (kvant==0) kvant=-1;
   ;	
	?debug	L 88
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+10],0
	jne	short @3@450
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+10],-1
@3@450:
   ;	
   ;	    parent=(PCB*)PCB::running;
   ;	
	?debug	L 89
	les	bx,dword ptr [bp+6]
	mov	ax,seg @PCB@0running
	push	es
	mov	es,ax
	mov	ax,word ptr es:@PCB@0running+2
	mov	dx,word ptr es:@PCB@0running
	pop	es
	mov	word ptr es:[bx+160],ax
	mov	word ptr es:[bx+158],dx
   ;	
   ;	    for (int iter=0;iter<16;iter++)
   ;	
	?debug	L 90
	xor	di,di
	jmp	short @3@534
@3@478:
   ;	
   ;	    {
   ;	        signalLock[iter]=PCB::running->signalLock[iter];
   ;	
	?debug	L 92
	mov	ax,di
	shl	ax,1
	mov	dx,seg @PCB@0running
	mov	es,dx
	les	bx,dword ptr es:@PCB@0running
	add	bx,ax
	mov	ax,word ptr es:[bx+126]
	mov	dx,di
	shl	dx,1
	les	bx,dword ptr [bp+6]
	add	bx,dx
	mov	word ptr es:[bx+126],ax
	?debug	L 90
	inc	di
@3@534:
	cmp	di,16
	jl	short @3@478
   ;	
   ;	    }
   ;	    for (int i=0;i<16;i++)
   ;	
	?debug	L 94
	mov	word ptr [bp-2],0
	jmp	short @3@730
@3@590:
	?debug	B
   ;	
   ;	    {
   ;	        List<SignalHandler>::Node* curr=PCB::running->signalHandlers[i].head;
   ;	
	?debug	L 96
	mov	ax,word ptr [bp-2]
	mov	dx,6
	imul	dx
	mov	dx,seg @PCB@0running
	mov	es,dx
	les	bx,dword ptr es:@PCB@0running
	add	bx,ax
	mov	ax,word ptr es:[bx+28]
	mov	dx,word ptr es:[bx+26]
	jmp	short @3@646
@3@618:
   ;	
   ;	        while(curr!=0)
   ;	        {
   ;	            signalHandlers[i].pushBack(curr->val);
   ;	
	?debug	L 99
	les	bx,dword ptr [bp-6]
	push	word ptr es:[bx+2]
	push	word ptr es:[bx]
	mov	ax,word ptr [bp-2]
	mov	dx,6
	imul	dx
	mov	dx,word ptr [bp+6]
	add	dx,ax
	add	dx,24
	push	word ptr [bp+8]
	push	dx
	call	far ptr @@%List$tnqv$v%@pushBack$wqnqv$v
	add	sp,8
   ;	
   ;	            curr=curr->next;
   ;	
	?debug	L 100
	les	bx,dword ptr [bp-6]
	mov	ax,word ptr es:[bx+6]
	mov	dx,word ptr es:[bx+4]
@3@646:
	mov	word ptr [bp-4],ax
	mov	word ptr [bp-6],dx
	?debug	L 97
	mov	ax,word ptr [bp-6]
	or	ax,word ptr [bp-4]
	jne	short @3@618
	?debug	C E31E000400161F00
	?debug	C E604637572721E02FAFF00
	?debug	E
	?debug	L 94
	inc	word ptr [bp-2]
@3@730:
	cmp	word ptr [bp-2],16
	jl	short @3@590
   ;	
   ;	        }
   ;	    }
   ;	    softunlock;
   ;	
	?debug	L 103
 	popf	
@3@786:
   ;	
   ;	}
   ;	
	?debug	L 104
	mov	dx,word ptr [bp+8]
	mov	ax,word ptr [bp+6]
	jmp	short @3@814
@3@814:
	pop	ds
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	?debug	C E601690402FEFF00046974657204040700047468+
	?debug	C 69731A020600000274681C0A0A00000973746163+
	?debug	C 6B53697A650C0A0E00000974696D65536C696365+
	?debug	C 0A0A120000
	?debug	E
	?debug	E
@PCB@0$bctr$qn6Threadului	endp
   ;	
   ;	void PCB::wrapper(Thread* th)
   ;	
	?debug	L 106
	assume	cs:PCB_TEXT
@PCB@0wrapper$qn6Thread	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F8174050434240307772617070657224716E3654+
	?debug	C 6872656164
	?debug	C E60274681C0A060000
	?debug	B
   ;	
   ;	{
   ;	    th->run();
   ;	
	?debug	L 108
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx]
	call	dword ptr es:[bx+4]
	pop	cx
	pop	cx
   ;	
   ;	    hardlock;
   ;	
	?debug	L 109
 	pushf	
 	cli	
   ;	
   ;	    th->myPCB->state=DONE;
   ;	
	?debug	L 110
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+4]
	mov	word ptr es:[bx+18],0
   ;	
   ;	    th->myPCB->signal(2);
   ;	
	?debug	L 111
	mov	ax,2
	push	ax
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+6]
	push	word ptr es:[bx+4]
	call	far ptr @PCB@0signal$wqui
	add	sp,6
   ;	
   ;	    if (th->myPCB->parent->myThread!=0) th->myPCB->parent->signal(1);
   ;	
	?debug	L 112
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+4]
	les	bx,dword ptr es:[bx+158]
	mov	ax,word ptr es:[bx+20]
	or	ax,word ptr es:[bx+22]
	je	short @4@170
	mov	ax,1
	push	ax
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+4]
	push	word ptr es:[bx+160]
	push	word ptr es:[bx+158]
	call	far ptr @PCB@0signal$wqui
	add	sp,6
@4@170:
   ;	
   ;	    th->myPCB->doSignals();
   ;	
	?debug	L 113
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+6]
	push	word ptr es:[bx+4]
	call	far ptr @PCB@0doSignals$wqv
	pop	cx
	pop	cx
   ;	
   ;	    PCB::runningThreads--;
   ;	
	?debug	L 114
	mov	ax,seg @PCB@0runningThreads
	mov	es,ax
	dec	word ptr es:@PCB@0runningThreads
   ;	
   ;	    th->myPCB->unblockAll();
   ;	
	?debug	L 115
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+6]
	push	word ptr es:[bx+4]
	call	far ptr @PCB@0unblockAll$wqv
	pop	cx
	pop	cx
   ;	
   ;	    dispatch();
   ;	
	?debug	L 116
	call	far ptr @dispatch$qv
   ;	
   ;	    hardunlock;
   ;	
	?debug	L 117
 	popf	
   ;	
   ;	}
   ;	
	?debug	L 118
	pop	ds
	pop	bp
	ret	
	?debug	C E60274681C0A060000
	?debug	E
	?debug	E
@PCB@0wrapper$qn6Thread	endp
   ;	
   ;	void PCB::addToAllPCB(PCB* curr)
   ;	
	?debug	L 120
	assume	cs:PCB_TEXT
@PCB@0addToAllPCB$qn3PCB	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F818405043424030616464546F416C6C50434224+
	?debug	C 716E33504342
	?debug	C E604637572721A0A060000
	?debug	B
   ;	
   ;	{
   ;	    softlock;
   ;	
	?debug	L 122
 	pushf	
 	cli	
   ;	
   ;	    allPCB.push(curr);
   ;	
	?debug	L 123
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	mov	ax,seg @PCB@0allPCB
	push	ax
	mov	ax,offset @PCB@0allPCB
	push	ax
	call	far ptr @@%List$tn3PCB%@push$wqn3PCB
	add	sp,8
   ;	
   ;	    softunlock;
   ;	
	?debug	L 124
 	popf	
   ;	
   ;	}
   ;	
	?debug	L 125
	pop	ds
	pop	bp
	ret	
	?debug	C E604637572721A0A060000
	?debug	E
	?debug	E
@PCB@0addToAllPCB$qn3PCB	endp
   ;	
   ;	void PCB::deleteFromAllPCB(PCB* curr)
   ;	
	?debug	L 127
	assume	cs:PCB_TEXT
@PCB@0deleteFromAllPCB$qn3PCB	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F81D40504342403064656C65746546726F6D416C+
	?debug	C 6C50434224716E33504342
	?debug	C E604637572721A0A060000
	?debug	B
   ;	
   ;	{
   ;	    softlock;
   ;	
	?debug	L 129
 	pushf	
 	cli	
   ;	
   ;	    allPCB.deleteval(curr);
   ;	
	?debug	L 130
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	mov	ax,seg @PCB@0allPCB
	push	ax
	mov	ax,offset @PCB@0allPCB
	push	ax
	call	far ptr @@%List$tn3PCB%@deleteval$wqn3PCB
	add	sp,8
   ;	
   ;	    softunlock;
   ;	
	?debug	L 131
 	popf	
   ;	
   ;	}
   ;	
	?debug	L 132
	pop	ds
	pop	bp
	ret	
	?debug	C E604637572721A0A060000
	?debug	E
	?debug	E
@PCB@0deleteFromAllPCB$qn3PCB	endp
   ;	
   ;	void PCB::addToBlockedList(PCB* nes)
   ;	
	?debug	L 134
	assume	cs:PCB_TEXT
@PCB@0addToBlockedList$qn3PCB	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F81D405043424030616464546F426C6F636B6564+
	?debug	C 4C69737424716E33504342
	?debug	C E6036E65731A0A0A000004746869731A02060000
	?debug	B
   ;	
   ;	{
   ;	    softlock;
   ;	
	?debug	L 136
 	pushf	
 	cli	
   ;	
   ;	    blocked.push(nes);
   ;	
	?debug	L 137
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	mov	ax,word ptr [bp+6]
	add	ax,162
	push	word ptr [bp+8]
	push	ax
	call	far ptr @@%List$tn3PCB%@push$wqn3PCB
	add	sp,8
   ;	
   ;	    softunlock;
   ;	
	?debug	L 138
 	popf	
   ;	
   ;	}
   ;	
	?debug	L 139
	pop	ds
	pop	bp
	ret	
	?debug	C E604746869731A02060000036E65731A0A0A0000
	?debug	E
	?debug	E
@PCB@0addToBlockedList$qn3PCB	endp
   ;	
   ;	void PCB::unblockAll() volatile
   ;	
	?debug	L 141
	assume	cs:PCB_TEXT
@PCB@0unblockAll$wqv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	sub	sp,4
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F814405043424030756E626C6F636B416C6C2477+
	?debug	C 7176
	?debug	C E320000400161B00
	?debug	C E604746869732002060000
	?debug	B
   ;	
   ;	{
   ;	    softlock;
   ;	
	?debug	L 143
 	pushf	
 	cli	
	jmp	short @8@142
@8@114:
	?debug	B
   ;	
   ;	    while (blocked.length!=0)
   ;	    {
   ;	        PCB* pom=blocked.pop();
   ;	
	?debug	L 146
	mov	ax,word ptr [bp+6]
	add	ax,162
	push	word ptr [bp+8]
	push	ax
	call	far ptr @@%List$tn3PCB%@pop$wqv
	pop	cx
	pop	cx
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],ax
   ;	
   ;	        pom->state=READY;
   ;	
	?debug	L 147
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx+18],1
   ;	
   ;	        Scheduler::put(pom);
   ;	
	?debug	L 148
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @Scheduler@0put$qn3PCB
	pop	cx
	pop	cx
@8@142:
	?debug	C E603706F6D1A02FCFF00
	?debug	E
	?debug	L 144
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+162],0
	jne	short @8@114
   ;	
   ;	    }
   ;	    softunlock;
   ;	
	?debug	L 150
 	popf	
   ;	
   ;	}
   ;	
	?debug	L 151
	pop	ds
	mov	sp,bp
	pop	bp
	ret	
	?debug	C E604746869732002060000
	?debug	E
	?debug	E
@PCB@0unblockAll$wqv	endp
   ;	
   ;	PCB::~PCB()
   ;	
	?debug	L 153
	assume	cs:PCB_TEXT
@PCB@0$bdtr$qv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	si
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F80E4050434240302462647472247176
	?debug	C E60664656C657465040A0A000004746869731A02+
	?debug	C 060000
	mov	si,word ptr [bp+10]
	?debug	B
   ;	
   ;	{
   ;	
	?debug	L 154
	mov	ax,word ptr [bp+6]
	or	ax,word ptr [bp+8]
	jne	@@3
	jmp	@9@142
@@3:
   ;	
   ;	    Timer::globalLockCnt++;
   ;	
	?debug	L 155
	mov	ax,seg @Timer@0globalLockCnt
	mov	es,ax
	inc	word ptr es:@Timer@0globalLockCnt
   ;	
   ;	    delete[] stack;
   ;	
	?debug	L 156
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+2]
	push	word ptr es:[bx]
	call	far ptr @$bdele$qnv
	pop	cx
	pop	cx
   ;	
   ;	    Timer::globalLockCnt--;
   ;	
	?debug	L 157
	mov	ax,seg @Timer@0globalLockCnt
	mov	es,ax
	dec	word ptr es:@Timer@0globalLockCnt
	mov	ax,2
	push	ax
	mov	ax,word ptr [bp+6]
	add	ax,162
	push	word ptr [bp+8]
	push	ax
	call	far ptr @@%List$tn3PCB%@$bdtr$qv
	add	sp,6
	mov	ax,2
	push	ax
	mov	ax,word ptr [bp+6]
	add	ax,120
	push	word ptr [bp+8]
	push	ax
	call	far ptr @@%List$tui%@$bdtr$qv
	add	sp,6
	mov	ax,seg @@%List$tnqv$v%@$bdtr$qv
	push	ax
	mov	ax,offset @@%List$tnqv$v%@$bdtr$qv
	push	ax
	mov	ax,5
	push	ax
	xor	ax,ax
	mov	dx,16
	push	ax
	push	dx
	mov	ax,6
	push	ax
	mov	ax,word ptr [bp+6]
	add	ax,24
	push	word ptr [bp+8]
	push	ax
	call	far ptr @_vector_delete_$qnvuiuluie
	add	sp,16
	test	si,1
	je	short @9@142
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @$bdele$qnv
	pop	cx
	pop	cx
@9@142:
   ;	
   ;	}
   ;	
	?debug	L 158
	pop	ds
	pop	si
	pop	bp
	ret	
	?debug	C E604746869731A020600000664656C657465040C+
	?debug	C 0600
	?debug	E
	?debug	E
@PCB@0$bdtr$qv	endp
   ;	
   ;	void PCB::signal(SignalId signal) volatile
   ;	
	?debug	L 160
	assume	cs:PCB_TEXT
@PCB@0signal$wqui	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	si
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F8114050434240307369676E616C2477717569
	?debug	C E6067369676E616C0A0A0A000004746869732002+
	?debug	C 060000
	mov	si,word ptr [bp+10]
	?debug	B
   ;	
   ;	{
   ;	    if (signal>=16) return;
   ;	
	?debug	L 162
	cmp	si,16
	jb	short @10@86
	jmp	short @10@282
@10@86:
   ;	
   ;	    softlock;
   ;	
	?debug	L 163
 	pushf	
 	cli	
   ;	
   ;	    activeSignals.pushBack(signal);
   ;	
	?debug	L 164
	push	si
	mov	ax,word ptr [bp+6]
	add	ax,120
	push	word ptr [bp+8]
	push	ax
	call	far ptr @@%List$tui%@pushBack$wqui
	add	sp,6
   ;	
   ;	    if (this==PCB::running)
   ;	
	?debug	L 165
	mov	ax,seg @PCB@0running
	mov	es,ax
	mov	ax,word ptr es:@PCB@0running+2
	mov	dx,word ptr es:@PCB@0running
	cmp	ax,word ptr [bp+8]
	jne	short @10@254
	cmp	dx,word ptr [bp+6]
	jne	short @10@254
   ;	
   ;	    {
   ;	        PCB::running->doSignals();
   ;	
	?debug	L 167
	mov	ax,seg @PCB@0running
	mov	es,ax
	push	word ptr es:@PCB@0running+2
	push	word ptr es:@PCB@0running
	call	far ptr @PCB@0doSignals$wqv
	pop	cx
	pop	cx
   ;	
   ;			if (Timer::needToKill==1)
   ;	
	?debug	L 168
	mov	ax,seg @Timer@0needToKill
	mov	es,ax
	cmp	word ptr es:@Timer@0needToKill,1
	jne	short @10@254
   ;	
   ;			{	
   ;				Timer::needToKill=0;
   ;	
	?debug	L 170
	mov	ax,seg @Timer@0needToKill
	mov	es,ax
	mov	word ptr es:@Timer@0needToKill,0
   ;	
   ;	            dispatch();
   ;	
	?debug	L 171
	call	far ptr @dispatch$qv
@10@254:
   ;	
   ;			}
   ;	    }
   ;	    softunlock;
   ;	
	?debug	L 174
 	popf	
@10@282:
   ;	
   ;	}
   ;	
	?debug	L 175
	pop	ds
	pop	si
	pop	bp
	ret	
	?debug	C E604746869732002060000067369676E616C0A0C+
	?debug	C 0600
	?debug	E
	?debug	E
@PCB@0signal$wqui	endp
   ;	
   ;	void PCB::registerHandler(SignalId signal, SignalHandler handler)
   ;	
	?debug	L 177
	assume	cs:PCB_TEXT
@PCB@0registerHandler$quinqv$v	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F81E405043424030726567697374657248616E64+
	?debug	C 6C6572247175696E71762476
	?debug	C E32200000023010400
	?debug	C E321000400162200
	?debug	C E60768616E646C6572210A0C0000067369676E61+
	?debug	C 6C0A0A0A000004746869731A02060000
	?debug	B
   ;	
   ;	{
   ;	    softlock;
   ;	
	?debug	L 179
 	pushf	
 	cli	
   ;	
   ;	    signalHandlers[signal].pushBack(handler);
   ;	
	?debug	L 180
	push	word ptr [bp+14]
	push	word ptr [bp+12]
	mov	ax,word ptr [bp+10]
	mov	dx,6
	imul	dx
	mov	dx,word ptr [bp+6]
	add	dx,ax
	add	dx,24
	push	word ptr [bp+8]
	push	dx
	call	far ptr @@%List$tnqv$v%@pushBack$wqnqv$v
	add	sp,8
   ;	
   ;	    softunlock;
   ;	
	?debug	L 181
 	popf	
   ;	
   ;	}
   ;	
	?debug	L 182
	pop	ds
	pop	bp
	ret	
	?debug	C E604746869731A02060000067369676E616C0A0A+
	?debug	C 0A00000768616E646C6572210A0C0000
	?debug	E
	?debug	E
@PCB@0registerHandler$quinqv$v	endp
   ;	
   ;	void PCB::unregisterAllHandlers(SignalId id)
   ;	
	?debug	L 184
	assume	cs:PCB_TEXT
@PCB@0unregisterAllHandlers$qui	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F81F405043424030756E7265676973746572416C+
	?debug	C 6C48616E646C65727324717569
	?debug	C E60269640A0A0A000004746869731A02060000
	?debug	B
   ;	
   ;	{
   ;	    softlock;
   ;	
	?debug	L 186
 	pushf	
 	cli	
   ;	
   ;	    signalHandlers[id].erase();
   ;	
	?debug	L 187
	mov	ax,word ptr [bp+10]
	mov	dx,6
	imul	dx
	mov	dx,word ptr [bp+6]
	add	dx,ax
	add	dx,24
	push	word ptr [bp+8]
	push	dx
	call	far ptr @@%List$tnqv$v%@erase$wqv
	pop	cx
	pop	cx
   ;	
   ;	    softunlock;
   ;	
	?debug	L 188
 	popf	
   ;	
   ;	}
   ;	
	?debug	L 189
	pop	ds
	pop	bp
	ret	
	?debug	C E604746869731A020600000269640A0A0A0000
	?debug	E
	?debug	E
@PCB@0unregisterAllHandlers$qui	endp
   ;	
   ;	void PCB::swap(SignalId id, SignalHandler hand1, SignalHandler hand2)
   ;	
	?debug	L 191
	assume	cs:PCB_TEXT
@PCB@0swap$quinqv$vt2	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	sub	sp,16
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F81540504342403073776170247175696E717624+
	?debug	C 767432
	?debug	C E60568616E6432210A1000000568616E6431210A+
	?debug	C 0C00000269640A0A0A000004746869731A020600+
	?debug	C 00
	?debug	B
   ;	
   ;	{
   ;	    softlock;
   ;	
	?debug	L 193
 	pushf	
 	cli	
   ;	
   ;	    List<SignalHandler>::Node* p1=0;
   ;	
	?debug	L 194
	mov	word ptr [bp-2],0
	mov	word ptr [bp-4],0
   ;	
   ;	    List<SignalHandler>::Node* p2=0;
   ;	
	?debug	L 195
	mov	word ptr [bp-6],0
	mov	word ptr [bp-8],0
   ;	
   ;	    List<SignalHandler>::Node* curr=signalHandlers[id].head;
   ;	
	?debug	L 196
	mov	ax,word ptr [bp+10]
	mov	dx,6
	imul	dx
	les	bx,dword ptr [bp+6]
	add	bx,ax
	mov	ax,word ptr es:[bx+28]
	mov	dx,word ptr es:[bx+26]
	jmp	short @13@310
@13@114:
   ;	
   ;	    while (curr!=0)
   ;	    {
   ;	        if (curr->val==hand1) p1=curr;
   ;	
	?debug	L 199
	les	bx,dword ptr [bp-12]
	mov	ax,word ptr es:[bx+2]
	mov	dx,word ptr es:[bx]
	cmp	ax,word ptr [bp+14]
	jne	short @13@198
	cmp	dx,word ptr [bp+12]
	jne	short @13@198
	mov	ax,word ptr [bp-10]
	mov	dx,word ptr [bp-12]
	mov	word ptr [bp-2],ax
	mov	word ptr [bp-4],dx
@13@198:
   ;	
   ;	        if (curr->val==hand2) p2=curr;
   ;	
	?debug	L 200
	les	bx,dword ptr [bp-12]
	mov	ax,word ptr es:[bx+2]
	mov	dx,word ptr es:[bx]
	cmp	ax,word ptr [bp+18]
	jne	short @13@282
	cmp	dx,word ptr [bp+16]
	jne	short @13@282
	mov	ax,word ptr [bp-10]
	mov	dx,word ptr [bp-12]
	mov	word ptr [bp-6],ax
	mov	word ptr [bp-8],dx
@13@282:
   ;	
   ;	        curr=curr->next;
   ;	
	?debug	L 201
	les	bx,dword ptr [bp-12]
	mov	ax,word ptr es:[bx+6]
	mov	dx,word ptr es:[bx+4]
@13@310:
	mov	word ptr [bp-10],ax
	mov	word ptr [bp-12],dx
	?debug	L 197
	mov	ax,word ptr [bp-12]
	or	ax,word ptr [bp-10]
	jne	short @13@114
   ;	
   ;	    }
   ;	    if (p1!=0 && p2!=0)
   ;	
	?debug	L 203
	mov	ax,word ptr [bp-4]
	or	ax,word ptr [bp-2]
	je	short @13@450
	mov	ax,word ptr [bp-8]
	or	ax,word ptr [bp-6]
	je	short @13@450
	?debug	B
   ;	
   ;	    {
   ;	        SignalHandler t=p1->val;
   ;	
	?debug	L 205
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx+2]
	mov	dx,word ptr es:[bx]
	mov	word ptr [bp-14],ax
	mov	word ptr [bp-16],dx
   ;	
   ;	        p1->val=p2->val;
   ;	
	?debug	L 206
	les	bx,dword ptr [bp-8]
	mov	ax,word ptr es:[bx+2]
	mov	dx,word ptr es:[bx]
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx+2],ax
	mov	word ptr es:[bx],dx
   ;	
   ;	        p2->val=t;
   ;	
	?debug	L 207
	les	bx,dword ptr [bp-8]
	mov	ax,word ptr [bp-14]
	mov	dx,word ptr [bp-16]
	mov	word ptr es:[bx+2],ax
	mov	word ptr es:[bx],dx
@13@450:
	?debug	C E601742102F0FF00
	?debug	E
   ;	
   ;	    }
   ;	    softunlock;
   ;	
	?debug	L 209
 	popf	
   ;	
   ;	}
   ;	
	?debug	L 210
	pop	ds
	mov	sp,bp
	pop	bp
	ret	
	?debug	C E604637572721E02F4FF000270321E02F8FF0002+
	?debug	C 70311E02FCFF0004746869731A02060000026964+
	?debug	C 0A0A0A00000568616E6431210A0C00000568616E+
	?debug	C 6432210A100000
	?debug	E
	?debug	E
@PCB@0swap$quinqv$vt2	endp
   ;	
   ;	void PCB::blockSignal(SignalId signal)
   ;	
	?debug	L 212
	assume	cs:PCB_TEXT
@PCB@0blockSignal$qui	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F815405043424030626C6F636B5369676E616C24+
	?debug	C 717569
	?debug	C E6067369676E616C0A0A0A000004746869731A02+
	?debug	C 060000
	?debug	B
   ;	
   ;	{
   ;	    softlock;
   ;	
	?debug	L 214
 	pushf	
 	cli	
   ;	
   ;	    signalLock[signal]=1;
   ;	
	?debug	L 215
	mov	ax,word ptr [bp+10]
	shl	ax,1
	les	bx,dword ptr [bp+6]
	add	bx,ax
	mov	word ptr es:[bx+126],1
   ;	
   ;	    softunlock;
   ;	
	?debug	L 216
 	popf	
   ;	
   ;	}
   ;	
	?debug	L 217
	pop	ds
	pop	bp
	ret	
	?debug	C E604746869731A02060000067369676E616C0A0A+
	?debug	C 0A0000
	?debug	E
	?debug	E
@PCB@0blockSignal$qui	endp
   ;	
   ;	void PCB::blockSignalGlobally(SignalId signal)
   ;	
	?debug	L 219
	assume	cs:PCB_TEXT
@PCB@0blockSignalGlobally$qui	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F81D405043424030626C6F636B5369676E616C47+
	?debug	C 6C6F62616C6C7924717569
	?debug	C E6067369676E616C0A0A060000
	?debug	B
   ;	
   ;	{
   ;	    softlock;
   ;	
	?debug	L 221
 	pushf	
 	cli	
   ;	
   ;	    globalSignalLock[signal]=1;
   ;	
	?debug	L 222
	mov	bx,word ptr [bp+6]
	shl	bx,1
	mov	ax,seg @PCB@0globalSignalLock
	mov	es,ax
	mov	word ptr es:@PCB@0globalSignalLock[bx],1
   ;	
   ;	    softunlock;
   ;	
	?debug	L 223
 	popf	
   ;	
   ;	}
   ;	
	?debug	L 224
	pop	ds
	pop	bp
	ret	
	?debug	C E6067369676E616C0A0A060000
	?debug	E
	?debug	E
@PCB@0blockSignalGlobally$qui	endp
   ;	
   ;	void PCB::unblockSignal(SignalId signal)
   ;	
	?debug	L 226
	assume	cs:PCB_TEXT
@PCB@0unblockSignal$qui	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F817405043424030756E626C6F636B5369676E61+
	?debug	C 6C24717569
	?debug	C E6067369676E616C0A0A0A000004746869731A02+
	?debug	C 060000
	?debug	B
   ;	
   ;	{
   ;	    softlock;
   ;	
	?debug	L 228
 	pushf	
 	cli	
   ;	
   ;	    signalLock[signal]=0;
   ;	
	?debug	L 229
	mov	ax,word ptr [bp+10]
	shl	ax,1
	les	bx,dword ptr [bp+6]
	add	bx,ax
	mov	word ptr es:[bx+126],0
   ;	
   ;	    softunlock;
   ;	
	?debug	L 230
 	popf	
   ;	
   ;	}
   ;	
	?debug	L 231
	pop	ds
	pop	bp
	ret	
	?debug	C E604746869731A02060000067369676E616C0A0A+
	?debug	C 0A0000
	?debug	E
	?debug	E
@PCB@0unblockSignal$qui	endp
   ;	
   ;	void PCB::unblockSignalGlobally(SignalId signal)
   ;	
	?debug	L 233
	assume	cs:PCB_TEXT
@PCB@0unblockSignalGlobally$qui	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F81F405043424030756E626C6F636B5369676E61+
	?debug	C 6C476C6F62616C6C7924717569
	?debug	C E6067369676E616C0A0A060000
	?debug	B
   ;	
   ;	{
   ;	    softlock;
   ;	
	?debug	L 235
 	pushf	
 	cli	
   ;	
   ;	    globalSignalLock[signal]=0;
   ;	
	?debug	L 236
	mov	bx,word ptr [bp+6]
	shl	bx,1
	mov	ax,seg @PCB@0globalSignalLock
	mov	es,ax
	mov	word ptr es:@PCB@0globalSignalLock[bx],0
   ;	
   ;	    softunlock;
   ;	
	?debug	L 237
 	popf	
   ;	
   ;	}
   ;	
	?debug	L 238
	pop	ds
	pop	bp
	ret	
	?debug	C E6067369676E616C0A0A060000
	?debug	E
	?debug	E
@PCB@0unblockSignalGlobally$qui	endp
   ;	
   ;	void PCB::doSignals() volatile
   ;	
	?debug	L 240
	assume	cs:PCB_TEXT
@PCB@0doSignals$wqv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	sub	sp,8
	push	si
	push	di
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F813405043424030646F5369676E616C73247771+
	?debug	C 76
	?debug	C E604746869732002060000
	?debug	B
   ;	
   ;	{
   ;	    softlock;
   ;	
	?debug	L 242
 	pushf	
 	cli	
   ;	
   ;	    pomlist.erase();
   ;	
	?debug	L 243
	mov	ax,seg @PCB@0pomlist
	push	ax
	mov	ax,offset @PCB@0pomlist
	push	ax
	call	far ptr @@%List$tui%@erase$wqv
	pop	cx
	pop	cx
   ;	
   ;	    int needsToBeKilled=0;
   ;	
	?debug	L 244
	xor	di,di
	jmp	@18@534
@18@114:
	?debug	B
   ;	
   ;	    //printf("running=%d\n",Thread::getRunningId());
   ;	    //printf("duzina=%d %d\n",activeSignals.length,myThread->getId());
   ;	    //printf("aaa\n");
   ;	    while(activeSignals.length>0)
   ;	    {
   ;	        SignalId rdBrSignal=activeSignals.pop();
   ;	
	?debug	L 250
	mov	ax,word ptr [bp+6]
	add	ax,120
	push	word ptr [bp+8]
	push	ax
	call	far ptr @@%List$tui%@pop$wqv
	pop	cx
	pop	cx
	mov	si,ax
   ;	
   ;	        //printf("duzina=%d\n",activeSignals.length);
   ;	        if (signalLock[rdBrSignal]==0 && globalSignalLock[rdBrSignal]==0)
   ;	
	?debug	L 252
	mov	ax,si
	shl	ax,1
	les	bx,dword ptr [bp+6]
	add	bx,ax
	cmp	word ptr es:[bx+126],0
	je	@@4
	jmp	@18@506
@@4:
	mov	bx,si
	shl	bx,1
	mov	ax,seg @PCB@0globalSignalLock
	mov	es,ax
	cmp	word ptr es:@PCB@0globalSignalLock[bx],0
	jne	short @18@506
   ;	
   ;	        {
   ;	            if (rdBrSignal==0)
   ;	
	?debug	L 254
	or	si,si
	jne	short @18@254
   ;	
   ;	            {
   ;	                signal(2);
   ;	
	?debug	L 256
	mov	ax,2
	push	ax
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @PCB@0signal$wqui
	add	sp,6
   ;	
   ;	                needsToBeKilled=1;
   ;	
	?debug	L 257
	mov	di,1
   ;	
   ;	                break;
   ;	
	?debug	L 258
	jmp	short @18@562
   ;	
   ;	            }
   ;	
	?debug	L 259
	jmp	short @18@478
@18@254:
	?debug	B
   ;	
   ;	            else
   ;	            { 
   ;	                List<SignalHandler>::Node* pom=signalHandlers[rdBrSignal].head;
   ;	
	?debug	L 262
	mov	ax,si
	mov	dx,6
	imul	dx
	les	bx,dword ptr [bp+6]
	add	bx,ax
	mov	ax,word ptr es:[bx+28]
	mov	dx,word ptr es:[bx+26]
	jmp	short @18@422
@18@282:
   ;	
   ;	                while(pom!=0)
   ;	                {
   ;	                    Timer::globalLockCnt++;
   ;	
	?debug	L 265
	mov	ax,seg @Timer@0globalLockCnt
	mov	es,ax
	inc	word ptr es:@Timer@0globalLockCnt
   ;	
   ;	                    asm sti;
   ;	
	?debug	L 266
 	sti	
   ;	
   ;	                    pom->val();
   ;	
	?debug	L 267
	les	bx,dword ptr [bp-8]
	call	dword ptr es:[bx]
   ;	
   ;	                    asm cli;
   ;	
	?debug	L 268
 	cli	
   ;	
   ;	                    Timer::globalLockCnt--;
   ;	
	?debug	L 269
	mov	ax,seg @Timer@0globalLockCnt
	mov	es,ax
	dec	word ptr es:@Timer@0globalLockCnt
   ;	
   ;	                    pom=pom->next; 
   ;	
	?debug	L 270
	les	bx,dword ptr [bp-8]
	mov	ax,word ptr es:[bx+6]
	mov	dx,word ptr es:[bx+4]
@18@422:
	mov	word ptr [bp-6],ax
	mov	word ptr [bp-8],dx
	?debug	L 263
	mov	ax,word ptr [bp-8]
	or	ax,word ptr [bp-6]
	jne	short @18@282
@18@478:
	?debug	C E603706F6D1E02F8FF00
	?debug	E
   ;	
   ;	                }
   ;	            }
   ;	        }
   ;	
	?debug	L 273
	jmp	short @18@534
@18@506:
   ;	
   ;	        else pomlist.pushBack(rdBrSignal);
   ;	
	?debug	L 274
	push	si
	mov	ax,seg @PCB@0pomlist
	push	ax
	mov	ax,offset @PCB@0pomlist
	push	ax
	call	far ptr @@%List$tui%@pushBack$wqui
	add	sp,6
@18@534:
	?debug	C E60A726442725369676E616C0A040600
	?debug	E
	?debug	L 248
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+120],0
	jle	@@5
	jmp	@18@114
@@5:
@18@562:
   ;	
   ;	    }
   ;	    List<SignalId>::Node* nesto=pomlist.head;
   ;	
	?debug	L 276
	mov	ax,seg @PCB@0pomlist
	mov	es,ax
	mov	ax,word ptr es:@PCB@0pomlist+4
	mov	dx,word ptr es:@PCB@0pomlist+2
	jmp	short @18@618
@18@590:
   ;	
   ;	    while (nesto!=0)
   ;	    {
   ;	        activeSignals.pushBack(nesto->val);
   ;	
	?debug	L 279
	les	bx,dword ptr [bp-4]
	push	word ptr es:[bx]
	mov	ax,word ptr [bp+6]
	add	ax,120
	push	word ptr [bp+8]
	push	ax
	call	far ptr @@%List$tui%@pushBack$wqui
	add	sp,6
   ;	
   ;	        nesto=nesto->next;
   ;	
	?debug	L 280
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx+4]
	mov	dx,word ptr es:[bx+2]
@18@618:
	mov	word ptr [bp-2],ax
	mov	word ptr [bp-4],dx
	?debug	L 277
	mov	ax,word ptr [bp-4]
	or	ax,word ptr [bp-2]
	jne	short @18@590
   ;	
   ;	    }
   ;	    //printf("kraj zivota=%d\n",activeSignals.head->val);
   ;	    if (needsToBeKilled)
   ;	
	?debug	L 283
	or	di,di
	je	short @18@786
   ;	
   ;	    {
   ;	        if (parent->myThread!=0) parent->signal(1);
   ;	
	?debug	L 285
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+158]
	mov	ax,word ptr es:[bx+20]
	or	ax,word ptr es:[bx+22]
	je	short @18@758
	mov	ax,1
	push	ax
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+160]
	push	word ptr es:[bx+158]
	push	cs
	call	near ptr @PCB@0signal$wqui
	add	sp,6
@18@758:
   ;	
   ;	        state=DONE;
   ;	
	?debug	L 286
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+18],0
   ;	
   ;	        PCB::runningThreads--;
   ;	
	?debug	L 287
	mov	ax,seg @PCB@0runningThreads
	mov	es,ax
	dec	word ptr es:@PCB@0runningThreads
   ;	
   ;	        //cout << endl << "smrt" << endl;
   ;	        unblockAll();
   ;	
	?debug	L 289
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @PCB@0unblockAll$wqv
	pop	cx
	pop	cx
   ;	
   ;	        Timer::needToKill=1;
   ;	
	?debug	L 290
	mov	ax,seg @Timer@0needToKill
	mov	es,ax
	mov	word ptr es:@Timer@0needToKill,1
@18@786:
   ;	
   ;	    }
   ;	    softunlock;
   ;	
	?debug	L 292
 	popf	
   ;	
   ;	}
   ;	
	?debug	L 293
	pop	ds
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	?debug	C E323000400162400
	?debug	C E6056E6573746F2302FCFF000F6E65656473546F+
	?debug	C 42654B696C6C6564040407000474686973200206+
	?debug	C 0000
	?debug	E
	?debug	E
@PCB@0doSignals$wqv	endp
PCB_TEXT	ends
PCB_TEXT	segment byte public 'CODE'
@%List$tn3PCB%@$bctr$qv	segment	virtual
	?debug	C E8020C2E2E5C685C6C697374612E68E27AA550
	?debug	L 124
	assume	cs:@%List$tn3PCB%@$bctr$qv
@@%List$tn3PCB%@$bctr$qv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F81740254C69737424746E335043422540246263+
	?debug	C 7472247176
	?debug	C E325000400162600
	?debug	C E604746869732502060000
	?debug	B
	?debug	L 125
	mov	ax,word ptr [bp+6]
	or	ax,word ptr [bp+8]
	jne	short @19@86
	mov	ax,6
	push	ax
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp+8],dx
	mov	word ptr [bp+6],ax
	or	ax,dx
	je	short @19@114
@19@86:
	?debug	L 126
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+4],0
	mov	word ptr es:[bx+2],0
	?debug	L 127
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx],0
@19@114:
	?debug	L 128
	mov	dx,word ptr [bp+8]
	mov	ax,word ptr [bp+6]
	jmp	short @19@142
@19@142:
	pop	ds
	pop	bp
	ret	
	?debug	C E604746869732502060000
	?debug	E
	?debug	E
@@%List$tn3PCB%@$bctr$qv	endp
@%List$tn3PCB%@$bctr$qv	ends
PCB_TEXT	ends
PCB_TEXT	segment byte public 'CODE'
@%List$tn3PCB%@$bdtr$qv	segment	virtual
	?debug	C E802
	?debug	L 78
	assume	cs:@%List$tn3PCB%@$bdtr$qv
@@%List$tn3PCB%@$bdtr$qv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	si
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F81740254C69737424746E335043422540246264+
	?debug	C 7472247176
	?debug	C E60664656C657465040A0A000004746869732502+
	?debug	C 060000
	mov	si,word ptr [bp+10]
	?debug	B
	?debug	L 79
	mov	ax,word ptr [bp+6]
	or	ax,word ptr [bp+8]
	je	short @20@142
	?debug	L 80
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @@%List$tn3PCB%@erase$wqv
	pop	cx
	pop	cx
	test	si,1
	je	short @20@142
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @$bdele$qnv
	pop	cx
	pop	cx
@20@142:
	?debug	L 81
	pop	ds
	pop	si
	pop	bp
	ret	
	?debug	C E6047468697325020600000664656C657465040C+
	?debug	C 0600
	?debug	E
	?debug	E
@@%List$tn3PCB%@$bdtr$qv	endp
@%List$tn3PCB%@$bdtr$qv	ends
PCB_TEXT	ends
PCB_TEXT	segment byte public 'CODE'
@%List$tui%@$bctr$qv	segment	virtual
	?debug	C E802
	?debug	L 124
	assume	cs:@%List$tui%@$bctr$qv
@@%List$tui%@$bctr$qv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F81440254C697374247475692540246263747224+
	?debug	C 7176
	?debug	C E327000400162800
	?debug	C E604746869732702060000
	?debug	B
	?debug	L 125
	mov	ax,word ptr [bp+6]
	or	ax,word ptr [bp+8]
	jne	short @21@86
	mov	ax,6
	push	ax
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp+8],dx
	mov	word ptr [bp+6],ax
	or	ax,dx
	je	short @21@114
@21@86:
	?debug	L 126
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+4],0
	mov	word ptr es:[bx+2],0
	?debug	L 127
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx],0
@21@114:
	?debug	L 128
	mov	dx,word ptr [bp+8]
	mov	ax,word ptr [bp+6]
	jmp	short @21@142
@21@142:
	pop	ds
	pop	bp
	ret	
	?debug	C E604746869732702060000
	?debug	E
	?debug	E
@@%List$tui%@$bctr$qv	endp
@%List$tui%@$bctr$qv	ends
PCB_TEXT	ends
PCB_TEXT	segment byte public 'CODE'
@%List$tui%@$bdtr$qv	segment	virtual
	?debug	C E802
	?debug	L 78
	assume	cs:@%List$tui%@$bdtr$qv
@@%List$tui%@$bdtr$qv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	si
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F81440254C697374247475692540246264747224+
	?debug	C 7176
	?debug	C E60664656C657465040A0A000004746869732702+
	?debug	C 060000
	mov	si,word ptr [bp+10]
	?debug	B
	?debug	L 79
	mov	ax,word ptr [bp+6]
	or	ax,word ptr [bp+8]
	je	short @22@142
	?debug	L 80
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @@%List$tui%@erase$wqv
	pop	cx
	pop	cx
	test	si,1
	je	short @22@142
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @$bdele$qnv
	pop	cx
	pop	cx
@22@142:
	?debug	L 81
	pop	ds
	pop	si
	pop	bp
	ret	
	?debug	C E6047468697327020600000664656C657465040C+
	?debug	C 0600
	?debug	E
	?debug	E
@@%List$tui%@$bdtr$qv	endp
@%List$tui%@$bdtr$qv	ends
PCB_TEXT	ends
PCB_TEXT	segment byte public 'CODE'
@DummyThread@0$bctr$qului	segment	virtual
	?debug	C E801
	?debug	L 16
	assume	cs:@DummyThread@0$bctr$qului
@@DummyThread@0$bctr$qului	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F8194044756D6D79546872656164403024626374+
	?debug	C 722471756C7569
	?debug	C E60974696D65536C6963650A0A0E000009737461+
	?debug	C 636B53697A650C0A0A0000047468697318020600+
	?debug	C 00
	?debug	B
	mov	ax,word ptr [bp+6]
	or	ax,word ptr [bp+8]
	jne	short @23@86
	mov	ax,8
	push	ax
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp+8],dx
	mov	word ptr [bp+6],ax
	or	ax,dx
	je	short @23@114
@23@86:
	push	word ptr [bp+14]
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @Thread@0$bctr$qului
	add	sp,10
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+2],seg @@DummyThread@0
	mov	word ptr es:[bx],offset @@DummyThread@0
@23@114:
	mov	dx,word ptr [bp+8]
	mov	ax,word ptr [bp+6]
	jmp	short @23@142
@23@142:
	pop	ds
	pop	bp
	ret	
	?debug	C E60474686973180206000009737461636B53697A+
	?debug	C 650C0A0A00000974696D65536C6963650A0A0E00+
	?debug	C 00
	?debug	E
	?debug	E
@@DummyThread@0$bctr$qului	endp
@DummyThread@0$bctr$qului	ends
PCB_TEXT	ends
PCB_TEXT	segment byte public 'CODE'
@%List$tnqv$v%@$bctr$qv	segment	virtual
	?debug	C E802
	?debug	L 124
	assume	cs:@%List$tnqv$v%@$bctr$qv
@@%List$tnqv$v%@$bctr$qv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F81740254C69737424746E717624762540246263+
	?debug	C 7472247176
	?debug	C E329000400162A00
	?debug	C E604746869732902060000
	?debug	B
	?debug	L 125
	mov	ax,word ptr [bp+6]
	or	ax,word ptr [bp+8]
	jne	short @24@86
	mov	ax,6
	push	ax
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp+8],dx
	mov	word ptr [bp+6],ax
	or	ax,dx
	je	short @24@114
@24@86:
	?debug	L 126
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+4],0
	mov	word ptr es:[bx+2],0
	?debug	L 127
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx],0
@24@114:
	?debug	L 128
	mov	dx,word ptr [bp+8]
	mov	ax,word ptr [bp+6]
	jmp	short @24@142
@24@142:
	pop	ds
	pop	bp
	ret	
	?debug	C E604746869732902060000
	?debug	E
	?debug	E
@@%List$tnqv$v%@$bctr$qv	endp
@%List$tnqv$v%@$bctr$qv	ends
PCB_TEXT	ends
PCB_TEXT	segment byte public 'CODE'
@%List$tnqv$v%@pushBack$wqnqv$v	segment	virtual
	?debug	C E802
	?debug	L 49
	assume	cs:@%List$tnqv$v%@pushBack$wqnqv$v
@@%List$tnqv$v%@pushBack$wqnqv$v	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	sub	sp,8
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F81F40254C69737424746E717624762540707573+
	?debug	C 684261636B2477716E71762476
	?debug	C E32B000400162A00
	?debug	C E60376616C210A0A000004746869732B02060000
	?debug	B
	?debug	L 51
	mov	ax,seg @Timer@0globalLockCnt
	mov	es,ax
	inc	word ptr es:@Timer@0globalLockCnt
	?debug	L 53
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	xor	ax,ax
	xor	dx,dx
	push	ax
	push	dx
	call	far ptr @@%List$tnqv$v%@Node@0$bctr$qnqv$v
	add	sp,8
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],ax
	?debug	L 54
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+4]
	mov	dx,word ptr es:[bx+2]
	jmp	short @25@86
@25@58:
	?debug	L 55
	les	bx,dword ptr [bp-8]
	mov	ax,word ptr es:[bx+6]
	mov	dx,word ptr es:[bx+4]
@25@86:
	mov	word ptr [bp-6],ax
	mov	word ptr [bp-8],dx
	mov	ax,word ptr [bp-8]
	or	ax,word ptr [bp-6]
	je	short @25@170
	les	bx,dword ptr [bp-8]
	mov	ax,word ptr es:[bx+4]
	or	ax,word ptr es:[bx+6]
	jne	short @25@58
@25@170:
	?debug	L 56
	mov	ax,word ptr [bp-8]
	or	ax,word ptr [bp-6]
	jne	short @25@226
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp-2]
	mov	dx,word ptr [bp-4]
	mov	word ptr es:[bx+4],ax
	mov	word ptr es:[bx+2],dx
	jmp	short @25@254
@25@226:
	?debug	L 59
	les	bx,dword ptr [bp-8]
	mov	ax,word ptr [bp-2]
	mov	dx,word ptr [bp-4]
	mov	word ptr es:[bx+6],ax
	mov	word ptr es:[bx+4],dx
@25@254:
	?debug	L 61
	les	bx,dword ptr [bp+6]
	inc	word ptr es:[bx]
	?debug	L 63
	mov	ax,seg @Timer@0globalLockCnt
	mov	es,ax
	dec	word ptr es:@Timer@0globalLockCnt
	jne	short @25@310
	mov	ax,seg @Timer@0zahtevana_promena_konteksta
	mov	es,ax
	cmp	word ptr es:@Timer@0zahtevana_promena_konteksta,0
	je	short @25@310
@25@310:
	?debug	L 64
	pop	ds
	mov	sp,bp
	pop	bp
	ret	
	?debug	C E604637572721E02F8FF00076E65774E6F64651E+
	?debug	C 02FCFF0004746869732B020600000376616C210A+
	?debug	C 0A0000
	?debug	E
	?debug	E
@@%List$tnqv$v%@pushBack$wqnqv$v	endp
@%List$tnqv$v%@pushBack$wqnqv$v	ends
PCB_TEXT	ends
PCB_TEXT	segment byte public 'CODE'
@%List$tn3PCB%@push$wqn3PCB	segment	virtual
	?debug	C E802
	?debug	L 36
	assume	cs:@%List$tn3PCB%@push$wqn3PCB
@@%List$tn3PCB%@push$wqn3PCB	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	sub	sp,4
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F81B40254C69737424746E335043422540707573+
	?debug	C 682477716E33504342
	?debug	C E32C000400162600
	?debug	C E60376616C1A0A0A000004746869732C02060000
	?debug	B
	?debug	L 38
	mov	ax,seg @Timer@0globalLockCnt
	mov	es,ax
	inc	word ptr es:@Timer@0globalLockCnt
	?debug	L 39
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	xor	ax,ax
	xor	dx,dx
	push	ax
	push	dx
	call	far ptr @@%List$tn3PCB%@Node@0$bctr$qn3PCB
	add	sp,8
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],ax
	?debug	L 40
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	or	ax,word ptr es:[bx+4]
	je	short @26@86
	?debug	L 42
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+4]
	mov	dx,word ptr es:[bx+2]
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx+6],ax
	mov	word ptr es:[bx+4],dx
@26@86:
	?debug	L 44
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp-2]
	mov	dx,word ptr [bp-4]
	mov	word ptr es:[bx+4],ax
	mov	word ptr es:[bx+2],dx
	?debug	L 45
	les	bx,dword ptr [bp+6]
	inc	word ptr es:[bx]
	?debug	L 46
	mov	ax,seg @Timer@0globalLockCnt
	mov	es,ax
	dec	word ptr es:@Timer@0globalLockCnt
	jne	short @26@142
	mov	ax,seg @Timer@0zahtevana_promena_konteksta
	mov	es,ax
	cmp	word ptr es:@Timer@0zahtevana_promena_konteksta,0
	je	short @26@142
@26@142:
	?debug	L 47
	pop	ds
	mov	sp,bp
	pop	bp
	ret	
	?debug	C E32D000400162E00
	?debug	C E6076E65774E6F64652D02FCFF0004746869732C+
	?debug	C 020600000376616C1A0A0A0000
	?debug	E
	?debug	E
@@%List$tn3PCB%@push$wqn3PCB	endp
@%List$tn3PCB%@push$wqn3PCB	ends
PCB_TEXT	ends
PCB_TEXT	segment byte public 'CODE'
@%List$tn3PCB%@deleteval$wqn3PCB	segment	virtual
	?debug	C E802
	?debug	L 83
	assume	cs:@%List$tn3PCB%@deleteval$wqn3PCB
@@%List$tn3PCB%@deleteval$wqn3PCB	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	sub	sp,8
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F82040254C69737424746E33504342254064656C+
	?debug	C 65746576616C2477716E33504342
	?debug	C E60364656C1A0A0A000004746869732C02060000
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
	jmp	@27@282
@27@58:
	?debug	L 90
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx+2]
	mov	dx,word ptr es:[bx]
	cmp	ax,word ptr [bp+12]
	jne	short @27@254
	cmp	dx,word ptr [bp+10]
	jne	short @27@254
	?debug	L 92
	mov	ax,word ptr [bp-8]
	or	ax,word ptr [bp-6]
	jne	short @27@170
	?debug	L 94
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+2]
	mov	ax,word ptr es:[bx+6]
	mov	dx,word ptr es:[bx+4]
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+4],ax
	mov	word ptr es:[bx+2],dx
	jmp	short @27@198
@27@170:
	?debug	L 100
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx+6]
	mov	dx,word ptr es:[bx+4]
	les	bx,dword ptr [bp-8]
	mov	word ptr es:[bx+6],ax
	mov	word ptr es:[bx+4],dx
@27@198:
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
	jmp	short @27@310
@27@254:
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
@27@282:
	?debug	L 88
	mov	ax,word ptr [bp-4]
	or	ax,word ptr [bp-2]
	je	@@6
	jmp	@27@58
@@6:
@27@310:
	?debug	L 109
	mov	ax,seg @Timer@0globalLockCnt
	mov	es,ax
	dec	word ptr es:@Timer@0globalLockCnt
	jne	short @27@366
	mov	ax,seg @Timer@0zahtevana_promena_konteksta
	mov	es,ax
	cmp	word ptr es:@Timer@0zahtevana_promena_konteksta,0
	je	short @27@366
@27@366:
	?debug	L 110
	pop	ds
	mov	sp,bp
	pop	bp
	ret	
	?debug	C E604707265762D02F8FF0001742D02FCFF000474+
	?debug	C 6869732C020600000364656C1A0A0A0000
	?debug	E
	?debug	E
@@%List$tn3PCB%@deleteval$wqn3PCB	endp
@%List$tn3PCB%@deleteval$wqn3PCB	ends
PCB_TEXT	ends
PCB_TEXT	segment byte public 'CODE'
@%List$tn3PCB%@pop$wqv	segment	virtual
	?debug	C E802
	?debug	L 66
	assume	cs:@%List$tn3PCB%@pop$wqv
@@%List$tn3PCB%@pop$wqv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	sub	sp,8
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F81640254C69737424746E335043422540706F70+
	?debug	C 24777176
	?debug	C E604746869732C02060000
	?debug	B
	?debug	L 68
	mov	ax,seg @Timer@0globalLockCnt
	mov	es,ax
	inc	word ptr es:@Timer@0globalLockCnt
	?debug	L 69
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+2]
	mov	ax,word ptr es:[bx+2]
	mov	dx,word ptr es:[bx]
	mov	word ptr [bp-2],ax
	mov	word ptr [bp-4],dx
	?debug	L 70
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+4]
	mov	dx,word ptr es:[bx+2]
	mov	word ptr [bp-6],ax
	mov	word ptr [bp-8],dx
	?debug	L 71
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+2]
	mov	ax,word ptr es:[bx+6]
	mov	dx,word ptr es:[bx+4]
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+4],ax
	mov	word ptr es:[bx+2],dx
	?debug	L 72
	les	bx,dword ptr [bp+6]
	dec	word ptr es:[bx]
	?debug	L 73
	push	word ptr [bp-6]
	push	word ptr [bp-8]
	call	far ptr @$bdele$qnv
	pop	cx
	pop	cx
	?debug	L 74
	mov	ax,seg @Timer@0globalLockCnt
	mov	es,ax
	dec	word ptr es:@Timer@0globalLockCnt
	jne	short @28@86
	mov	ax,seg @Timer@0zahtevana_promena_konteksta
	mov	es,ax
	cmp	word ptr es:@Timer@0zahtevana_promena_konteksta,0
	je	short @28@86
@28@86:
	?debug	L 75
	mov	dx,word ptr [bp-2]
	mov	ax,word ptr [bp-4]
	jmp	short @28@114
@28@114:
	?debug	L 76
	pop	ds
	mov	sp,bp
	pop	bp
	ret	
	?debug	C E6036F6C642D02F8FF00037265741A02FCFF0004+
	?debug	C 746869732C02060000
	?debug	E
	?debug	E
@@%List$tn3PCB%@pop$wqv	endp
@%List$tn3PCB%@pop$wqv	ends
PCB_TEXT	ends
PCB_TEXT	segment byte public 'CODE'
@%List$tnqv$v%@$bdtr$qv	segment	virtual
	?debug	C E802
	?debug	L 78
	assume	cs:@%List$tnqv$v%@$bdtr$qv
@@%List$tnqv$v%@$bdtr$qv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	si
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F81740254C69737424746E717624762540246264+
	?debug	C 7472247176
	?debug	C E60664656C657465040A0A000004746869732902+
	?debug	C 060000
	mov	si,word ptr [bp+10]
	?debug	B
	?debug	L 79
	mov	ax,word ptr [bp+6]
	or	ax,word ptr [bp+8]
	je	short @29@142
	?debug	L 80
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @@%List$tnqv$v%@erase$wqv
	pop	cx
	pop	cx
	test	si,1
	je	short @29@142
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @$bdele$qnv
	pop	cx
	pop	cx
@29@142:
	?debug	L 81
	pop	ds
	pop	si
	pop	bp
	ret	
	?debug	C E6047468697329020600000664656C657465040C+
	?debug	C 0600
	?debug	E
	?debug	E
@@%List$tnqv$v%@$bdtr$qv	endp
@%List$tnqv$v%@$bdtr$qv	ends
PCB_TEXT	ends
PCB_TEXT	segment byte public 'CODE'
@%List$tui%@pushBack$wqui	segment	virtual
	?debug	C E802
	?debug	L 49
	assume	cs:@%List$tui%@pushBack$wqui
@@%List$tui%@pushBack$wqui	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	sub	sp,8
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F81940254C697374247475692540707573684261+
	?debug	C 636B2477717569
	?debug	C E32F000400162800
	?debug	C E60376616C0A0A0A000004746869732F02060000
	?debug	B
	?debug	L 51
	mov	ax,seg @Timer@0globalLockCnt
	mov	es,ax
	inc	word ptr es:@Timer@0globalLockCnt
	?debug	L 53
	push	word ptr [bp+10]
	xor	ax,ax
	xor	dx,dx
	push	ax
	push	dx
	call	far ptr @@%List$tui%@Node@0$bctr$qui
	add	sp,6
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],ax
	?debug	L 54
	les	bx,dword ptr [bp+6]
	jmp	short @30@86
@30@58:
	?debug	L 55
	les	bx,dword ptr [bp-8]
@30@86:
	mov	ax,word ptr es:[bx+4]
	mov	dx,word ptr es:[bx+2]
	mov	word ptr [bp-6],ax
	mov	word ptr [bp-8],dx
	mov	ax,word ptr [bp-8]
	or	ax,word ptr [bp-6]
	je	short @30@170
	les	bx,dword ptr [bp-8]
	mov	ax,word ptr es:[bx+2]
	or	ax,word ptr es:[bx+4]
	jne	short @30@58
@30@170:
	?debug	L 56
	mov	ax,word ptr [bp-8]
	or	ax,word ptr [bp-6]
	jne	short @30@226
	les	bx,dword ptr [bp+6]
	jmp	short @30@254
@30@226:
	?debug	L 59
	les	bx,dword ptr [bp-8]
@30@254:
	mov	ax,word ptr [bp-2]
	mov	dx,word ptr [bp-4]
	mov	word ptr es:[bx+4],ax
	mov	word ptr es:[bx+2],dx
	?debug	L 61
	les	bx,dword ptr [bp+6]
	inc	word ptr es:[bx]
	?debug	L 63
	mov	ax,seg @Timer@0globalLockCnt
	mov	es,ax
	dec	word ptr es:@Timer@0globalLockCnt
	jne	short @30@338
	mov	ax,seg @Timer@0zahtevana_promena_konteksta
	mov	es,ax
	cmp	word ptr es:@Timer@0zahtevana_promena_konteksta,0
	je	short @30@338
@30@338:
	?debug	L 64
	pop	ds
	mov	sp,bp
	pop	bp
	ret	
	?debug	C E604637572722302F8FF00076E65774E6F646523+
	?debug	C 02FCFF0004746869732F020600000376616C0A0A+
	?debug	C 0A0000
	?debug	E
	?debug	E
@@%List$tui%@pushBack$wqui	endp
@%List$tui%@pushBack$wqui	ends
PCB_TEXT	ends
PCB_TEXT	segment byte public 'CODE'
@%List$tnqv$v%@erase$wqv	segment	virtual
	?debug	C E802
	?debug	L 24
	assume	cs:@%List$tnqv$v%@erase$wqv
@@%List$tnqv$v%@erase$wqv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	sub	sp,4
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F81840254C69737424746E717624762540657261+
	?debug	C 736524777176
	?debug	C E604746869732B02060000
	?debug	B
	?debug	L 26
	mov	ax,seg @Timer@0globalLockCnt
	mov	es,ax
	inc	word ptr es:@Timer@0globalLockCnt
	jmp	short @31@86
@31@58:
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
@31@86:
	?debug	C E6036F6C641E02FCFF00
	?debug	E
	?debug	L 27
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	or	ax,word ptr es:[bx+4]
	jne	short @31@58
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
	jne	short @31@170
	mov	ax,seg @Timer@0zahtevana_promena_konteksta
	mov	es,ax
	cmp	word ptr es:@Timer@0zahtevana_promena_konteksta,0
	je	short @31@170
@31@170:
	?debug	L 35
	pop	ds
	mov	sp,bp
	pop	bp
	ret	
	?debug	C E604746869732B02060000
	?debug	E
	?debug	E
@@%List$tnqv$v%@erase$wqv	endp
@%List$tnqv$v%@erase$wqv	ends
PCB_TEXT	ends
PCB_TEXT	segment byte public 'CODE'
@%List$tui%@erase$wqv	segment	virtual
	?debug	C E802
	?debug	L 24
	assume	cs:@%List$tui%@erase$wqv
@@%List$tui%@erase$wqv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	sub	sp,4
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F81540254C697374247475692540657261736524+
	?debug	C 777176
	?debug	C E604746869732F02060000
	?debug	B
	?debug	L 26
	mov	ax,seg @Timer@0globalLockCnt
	mov	es,ax
	inc	word ptr es:@Timer@0globalLockCnt
	jmp	short @32@86
@32@58:
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
	mov	ax,word ptr es:[bx+4]
	mov	dx,word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+4],ax
	mov	word ptr es:[bx+2],dx
	?debug	L 30
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @$bdele$qnv
	pop	cx
	pop	cx
@32@86:
	?debug	C E6036F6C642302FCFF00
	?debug	E
	?debug	L 27
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	or	ax,word ptr es:[bx+4]
	jne	short @32@58
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
	jne	short @32@170
	mov	ax,seg @Timer@0zahtevana_promena_konteksta
	mov	es,ax
	cmp	word ptr es:@Timer@0zahtevana_promena_konteksta,0
	je	short @32@170
@32@170:
	?debug	L 35
	pop	ds
	mov	sp,bp
	pop	bp
	ret	
	?debug	C E604746869732F02060000
	?debug	E
	?debug	E
@@%List$tui%@erase$wqv	endp
@%List$tui%@erase$wqv	ends
PCB_TEXT	ends
PCB_TEXT	segment byte public 'CODE'
@%List$tui%@pop$wqv	segment	virtual
	?debug	C E802
	?debug	L 66
	assume	cs:@%List$tui%@pop$wqv
@@%List$tui%@pop$wqv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	sub	sp,6
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F81340254C697374247475692540706F70247771+
	?debug	C 76
	?debug	C E604746869732F02060000
	?debug	B
	?debug	L 68
	mov	ax,seg @Timer@0globalLockCnt
	mov	es,ax
	inc	word ptr es:@Timer@0globalLockCnt
	?debug	L 69
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+2]
	mov	ax,word ptr es:[bx]
	mov	word ptr [bp-2],ax
	?debug	L 70
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+4]
	mov	dx,word ptr es:[bx+2]
	mov	word ptr [bp-4],ax
	mov	word ptr [bp-6],dx
	?debug	L 71
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+2]
	mov	ax,word ptr es:[bx+4]
	mov	dx,word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+4],ax
	mov	word ptr es:[bx+2],dx
	?debug	L 72
	les	bx,dword ptr [bp+6]
	dec	word ptr es:[bx]
	?debug	L 73
	push	word ptr [bp-4]
	push	word ptr [bp-6]
	call	far ptr @$bdele$qnv
	pop	cx
	pop	cx
	?debug	L 74
	mov	ax,seg @Timer@0globalLockCnt
	mov	es,ax
	dec	word ptr es:@Timer@0globalLockCnt
	jne	short @33@86
	mov	ax,seg @Timer@0zahtevana_promena_konteksta
	mov	es,ax
	cmp	word ptr es:@Timer@0zahtevana_promena_konteksta,0
	je	short @33@86
@33@86:
	?debug	L 75
	mov	ax,word ptr [bp-2]
	jmp	short @33@114
@33@114:
	?debug	L 76
	pop	ds
	mov	sp,bp
	pop	bp
	ret	
	?debug	C E6036F6C642302FAFF00037265740A02FEFF0004+
	?debug	C 746869732F02060000
	?debug	E
	?debug	E
@@%List$tui%@pop$wqv	endp
@%List$tui%@pop$wqv	ends
PCB_TEXT	ends
PCB_TEXT	segment byte public 'CODE'
@%List$tn3PCB%@erase$wqv	segment	virtual
	?debug	C E802
	?debug	L 24
	assume	cs:@%List$tn3PCB%@erase$wqv
@@%List$tn3PCB%@erase$wqv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	sub	sp,4
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F81840254C69737424746E335043422540657261+
	?debug	C 736524777176
	?debug	C E604746869732C02060000
	?debug	B
	?debug	L 26
	mov	ax,seg @Timer@0globalLockCnt
	mov	es,ax
	inc	word ptr es:@Timer@0globalLockCnt
	jmp	short @34@86
@34@58:
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
@34@86:
	?debug	C E6036F6C642D02FCFF00
	?debug	E
	?debug	L 27
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	or	ax,word ptr es:[bx+4]
	jne	short @34@58
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
	jne	short @34@170
	mov	ax,seg @Timer@0zahtevana_promena_konteksta
	mov	es,ax
	cmp	word ptr es:@Timer@0zahtevana_promena_konteksta,0
	je	short @34@170
@34@170:
	?debug	L 35
	pop	ds
	mov	sp,bp
	pop	bp
	ret	
	?debug	C E604746869732C02060000
	?debug	E
	?debug	E
@@%List$tn3PCB%@erase$wqv	endp
@%List$tn3PCB%@erase$wqv	ends
PCB_TEXT	ends
PCB_TEXT	segment byte public 'CODE'
@%List$tnqv$v%@Node@0$bctr$qnqv$v	segment	virtual
	?debug	C E802
	?debug	L 16
	assume	cs:@%List$tnqv$v%@Node@0$bctr$qnqv$v
@@%List$tnqv$v%@Node@0$bctr$qnqv$v	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F82140254C69737424746E7176247625404E6F64+
	?debug	C 654030246263747224716E71762476
	?debug	C E60464617461210A0A000004746869731E020600+
	?debug	C 00
	?debug	B
	?debug	L 17
	mov	ax,word ptr [bp+6]
	or	ax,word ptr [bp+8]
	jne	short @35@86
	mov	ax,8
	push	ax
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp+8],dx
	mov	word ptr [bp+6],ax
	or	ax,dx
	je	short @35@114
@35@86:
	?debug	L 18
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp+12]
	mov	dx,word ptr [bp+10]
	mov	word ptr es:[bx+2],ax
	mov	word ptr es:[bx],dx
	?debug	L 19
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+6],0
	mov	word ptr es:[bx+4],0
@35@114:
	?debug	L 20
	mov	dx,word ptr [bp+8]
	mov	ax,word ptr [bp+6]
	jmp	short @35@142
@35@142:
	pop	ds
	pop	bp
	ret	
	?debug	C E604746869731E020600000464617461210A0A00+
	?debug	C 00
	?debug	E
	?debug	E
@@%List$tnqv$v%@Node@0$bctr$qnqv$v	endp
@%List$tnqv$v%@Node@0$bctr$qnqv$v	ends
PCB_TEXT	ends
PCB_TEXT	segment byte public 'CODE'
@%List$tn3PCB%@Node@0$bctr$qn3PCB	segment	virtual
	?debug	C E802
	?debug	L 16
	assume	cs:@%List$tn3PCB%@Node@0$bctr$qn3PCB
@@%List$tn3PCB%@Node@0$bctr$qn3PCB	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F82140254C69737424746E3350434225404E6F64+
	?debug	C 654030246263747224716E33504342
	?debug	C E604646174611A0A0A000004746869732D020600+
	?debug	C 00
	?debug	B
	?debug	L 17
	mov	ax,word ptr [bp+6]
	or	ax,word ptr [bp+8]
	jne	short @36@86
	mov	ax,8
	push	ax
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp+8],dx
	mov	word ptr [bp+6],ax
	or	ax,dx
	je	short @36@114
@36@86:
	?debug	L 18
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp+12]
	mov	dx,word ptr [bp+10]
	mov	word ptr es:[bx+2],ax
	mov	word ptr es:[bx],dx
	?debug	L 19
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+6],0
	mov	word ptr es:[bx+4],0
@36@114:
	?debug	L 20
	mov	dx,word ptr [bp+8]
	mov	ax,word ptr [bp+6]
	jmp	short @36@142
@36@142:
	pop	ds
	pop	bp
	ret	
	?debug	C E604746869732D0206000004646174611A0A0A00+
	?debug	C 00
	?debug	E
	?debug	E
@@%List$tn3PCB%@Node@0$bctr$qn3PCB	endp
@%List$tn3PCB%@Node@0$bctr$qn3PCB	ends
PCB_TEXT	ends
PCB_TEXT	segment byte public 'CODE'
@%List$tui%@Node@0$bctr$qui	segment	virtual
	?debug	C E802
	?debug	L 16
	assume	cs:@%List$tui%@Node@0$bctr$qui
@@%List$tui%@Node@0$bctr$qui	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F81B40254C6973742474756925404E6F64654030+
	?debug	C 246263747224717569
	?debug	C E604646174610A0A0A0000047468697323020600+
	?debug	C 00
	?debug	B
	?debug	L 17
	mov	ax,word ptr [bp+6]
	or	ax,word ptr [bp+8]
	jne	short @37@86
	mov	ax,6
	push	ax
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp+8],dx
	mov	word ptr [bp+6],ax
	or	ax,dx
	je	short @37@114
@37@86:
	?debug	L 18
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp+10]
	mov	word ptr es:[bx],ax
	?debug	L 19
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+4],0
	mov	word ptr es:[bx+2],0
@37@114:
	?debug	L 20
	mov	dx,word ptr [bp+8]
	mov	ax,word ptr [bp+6]
	jmp	short @37@142
@37@142:
	pop	ds
	pop	bp
	ret	
	?debug	C E60474686973230206000004646174610A0A0A00+
	?debug	C 00
	?debug	E
	?debug	E
@@%List$tui%@Node@0$bctr$qui	endp
@%List$tui%@Node@0$bctr$qui	ends
PCB_TEXT	ends
_INIT_	segment word public 'INITDATA'
	db	1
	db	32
	dd	@_STCON_$qv
_INIT_	ends
PCB_TEXT	segment byte public 'CODE'
@%List$tui%@Node@0$bctr$qui	segment	virtual
@%List$tui%@Node@0$bctr$qui	ends
PCB_TEXT	ends
PCB_TEXT	segment byte public 'CODE'
	assume	cs:PCB_TEXT
@_STCON_$qv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	B
	mov	ax,seg @PCB@0allPCB
	push	ax
	mov	ax,offset @PCB@0allPCB
	push	ax
	call	far ptr @@%List$tn3PCB%@$bctr$qv
	pop	cx
	pop	cx
	mov	ax,seg @PCB@0pomlist
	push	ax
	mov	ax,offset @PCB@0pomlist
	push	ax
	call	far ptr @@%List$tui%@$bctr$qv
	pop	cx
	pop	cx
	mov	ax,1
	push	ax
	xor	ax,ax
	mov	dx,4096
	push	ax
	push	dx
	xor	ax,ax
	xor	dx,dx
	push	ax
	push	dx
	call	far ptr @@DummyThread@0$bctr$qului
	add	sp,10
	mov	bx,ax
	mov	es,dx
	mov	ax,word ptr es:[bx+6]
	mov	dx,word ptr es:[bx+4]
	mov	bx,seg @PCB@0dummyPCB
	mov	es,bx
	mov	word ptr es:@PCB@0dummyPCB+2,ax
	mov	word ptr es:@PCB@0dummyPCB,dx
	xor	ax,ax
	push	ax
	xor	ax,ax
	mov	dx,4096
	push	ax
	push	dx
	xor	ax,ax
	xor	dx,dx
	push	ax
	push	dx
	push	cs
	call	near ptr @PCB@0$bctr$qului
	add	sp,10
	mov	bx,seg @PCB@0initial
	mov	es,bx
	mov	word ptr es:@PCB@0initial+2,dx
	mov	word ptr es:@PCB@0initial,ax
	mov	ax,seg @PCB@0initial
	mov	es,ax
	mov	ax,word ptr es:@PCB@0initial+2
	mov	dx,word ptr es:@PCB@0initial
	mov	bx,seg @PCB@0running
	mov	es,bx
	mov	word ptr es:@PCB@0running+2,ax
	mov	word ptr es:@PCB@0running,dx
	pop	ds
	pop	bp
	ret	
	?debug	E
	?debug	E
@_STCON_$qv	endp
PCB_TEXT	ends
_EXIT_	segment word public 'EXITDATA'
	db	1
	db	32
	dd	@_STDES_$qv
_EXIT_	ends
PCB_TEXT	segment byte public 'CODE'
	assume	cs:PCB_TEXT
@_STDES_$qv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	B
	mov	ax,2
	push	ax
	mov	ax,seg @PCB@0pomlist
	push	ax
	mov	ax,offset @PCB@0pomlist
	push	ax
	call	far ptr @@%List$tui%@$bdtr$qv
	add	sp,6
	mov	ax,2
	push	ax
	mov	ax,seg @PCB@0allPCB
	push	ax
	mov	ax,offset @PCB@0allPCB
	push	ax
	call	far ptr @@%List$tn3PCB%@$bdtr$qv
	add	sp,6
	pop	ds
	pop	bp
	ret	
	?debug	E
	?debug	E
@_STDES_$qv	endp
PCB_TEXT	ends
PCB_TEXT	segment byte public 'CODE'
@DummyThread@0	segment	virtual
@@DummyThread@0	label	byte
	dd	@@DummyThread@0$bdtr$qv
	dd	@DummyThread@0run$qv
@DummyThread@0	ends
PCB_TEXT	ends
PCB_TEXT	segment byte public 'CODE'
@DummyThread@0$bdtr$qv	segment	virtual
	assume	cs:@DummyThread@0$bdtr$qv
@@DummyThread@0$bdtr$qv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	si
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F8164044756D6D79546872656164403024626474+
	?debug	C 72247176
	?debug	C E60664656C657465040A0A000004746869731802+
	?debug	C 060000
	mov	si,word ptr [bp+10]
	?debug	B
	mov	ax,word ptr [bp+6]
	or	ax,word ptr [bp+8]
	je	short @40@142
	xor	ax,ax
	push	ax
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @Thread@0$bdtr$qv
	add	sp,6
	test	si,1
	je	short @40@114
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @$bdele$qnv
	pop	cx
	pop	cx
	jmp	short @40@114
@40@114:
	jmp	short @40@142
@40@142:
	jmp	short @40@170
@40@170:
	pop	ds
	pop	si
	pop	bp
	ret	
	?debug	C E6047468697318020600000664656C657465040C+
	?debug	C 0600
	?debug	E
	?debug	E
@@DummyThread@0$bdtr$qv	endp
	?debug	C E9
	?debug	C FA00000000
@DummyThread@0$bdtr$qv	ends
PCB_TEXT	ends
PCB_DATA	segment word public 'FAR_DATA'
s@	label	byte
PCB_DATA	ends
PCB_TEXT	segment byte public 'CODE'
PCB_TEXT	ends
	?debug	C E31D0654687265616408002E03
	?debug	C ED00030000010E00
	?debug	C E3300000002D0104011D00114054687265616440+
	?debug	C 307374617274247176
	?debug	C E3320000002D0104011D001A4054687265616440+
	?debug	C 3077616974546F436F6D706C657465247176
	?debug	C E3340000002D0104011D00114054687265616440+
	?debug	C 302462647472247176
	?debug	C E3360000002D0404011D00114054687265616440+
	?debug	C 306765744964247176
	?debug	C E3380000002D0404011D00184054687265616440+
	?debug	C 3067657452756E6E696E674964247176
	?debug	C E33A0000002D1C04011D00194054687265616440+
	?debug	C 3067657454687265616442794964247169
	?debug	C E33C0000002D0104011D00134054687265616440+
	?debug	C 307369676E616C24717569
	?debug	C E33E0000002D0104011D00214054687265616440+
	?debug	C 30726567697374657248616E646C657224717569+
	?debug	C 6E71762476
	?debug	C E3400000002D0104011D00224054687265616440+
	?debug	C 30756E7265676973746572416C6C48616E646C65+
	?debug	C 727324717569
	?debug	C E3420000002D0104011D00184054687265616440+
	?debug	C 3073776170247175696E717624767432
	?debug	C E3440000002D0104011D00184054687265616440+
	?debug	C 30626C6F636B5369676E616C24717569
	?debug	C E3460000002D0104011D00204054687265616440+
	?debug	C 30626C6F636B5369676E616C476C6F62616C6C79+
	?debug	C 24717569
	?debug	C E3480000002D0104011D001A4054687265616440+
	?debug	C 30756E626C6F636B5369676E616C24717569
	?debug	C E34A0000002D0104011D00224054687265616440+
	?debug	C 30756E626C6F636B5369676E616C476C6F62616C+
	?debug	C 6C7924717569
	?debug	C E34C0000002D1C04011D00144054687265616440+
	?debug	C 3024626374722471756C7569
	?debug	C E34E0000002D0104091D02
	?debug	C E3190B44756D6D7954687265616408002E01
	?debug	C ED00010000140E010300
	?debug	C E3500000002D1804031900194044756D6D795468+
	?debug	C 72656164403024626374722471756C7569
	?debug	C E3520000002D0104011902144044756D6D795468+
	?debug	C 72656164403072756E247176
	?debug	C E3260E40254C69737424746E335043422506002E+
	?debug	C 06
	?debug	C ED00060000170E00
	?debug	C E32E1340254C69737424746E3350434225404E6F+
	?debug	C 646508002E09
	?debug	C ED00090000250F00
	?debug	C E3540000002D2D04032E002140254C6973742474+
	?debug	C 6E3350434225404E6F6465403024626374722471+
	?debug	C 6E33504342
	?debug	C E3560000002D01040326001840254C6973742474+
	?debug	C 6E335043422540657261736524777176
	?debug	C E3580000002D01040326001B40254C6973742474+
	?debug	C 6E335043422540707573682477716E33504342
	?debug	C E35A0000002D0104092600
	?debug	C E35C0000002D1A040326001640254C6973742474+
	?debug	C 6E335043422540706F7024777176
	?debug	C E35E0000002D01040326001740254C6973742474+
	?debug	C 6E3350434225402462647472247176
	?debug	C E3600000002D01040326002040254C6973742474+
	?debug	C 6E33504342254064656C65746576616C2477716E+
	?debug	C 33504342
	?debug	C E3620000002D0104092600
	?debug	C E3640000002D2D04092600
	?debug	C E3660000002D25040326001740254C6973742474+
	?debug	C 6E3350434225402462637472247176
	?debug	C E3280B40254C697374247475692506002E07
	?debug	C ED00070000290E00
	?debug	C E3241040254C6973742474756925404E6F646506+
	?debug	C 002E05
	?debug	C ED00050000370F00
	?debug	C E3680000002D23040324001B40254C6973742474+
	?debug	C 756925404E6F64654030246263747224717569
	?debug	C E36A0000002D01040328001540254C6973742474+
	?debug	C 75692540657261736524777176
	?debug	C E36C0000002D0104092800
	?debug	C E36E0000002D01040328001940254C6973742474+
	?debug	C 75692540707573684261636B2477717569
	?debug	C E3700000002D0A040328001340254C6973742474+
	?debug	C 75692540706F7024777176
	?debug	C E3720000002D01040328001440254C6973742474+
	?debug	C 756925402462647472247176
	?debug	C E3740000002D0104092800
	?debug	C E3760000002D0104092800
	?debug	C E3780000002D2304092800
	?debug	C E37A0000002D27040328001440254C6973742474+
	?debug	C 756925402462637472247176
	?debug	C E32A0E40254C69737424746E717624762506002E+
	?debug	C 08
	?debug	C ED000800003B0E00
	?debug	C E31F1340254C69737424746E7176247625404E6F+
	?debug	C 646508002E04
	?debug	C ED00040000490F00
	?debug	C E37C0000002D1E04031F002140254C6973742474+
	?debug	C 6E7176247625404E6F6465403024626374722471+
	?debug	C 6E71762476
	?debug	C E37E0000002D0104032A001840254C6973742474+
	?debug	C 6E717624762540657261736524777176
	?debug	C E380800000002D0104092A00
	?debug	C E380820000002D0104032A001F40254C69737424+
	?debug	C 746E717624762540707573684261636B2477716E+
	?debug	C 71762476
	?debug	C E380840000002D2104092A00
	?debug	C E380860000002D0104032A001740254C69737424+
	?debug	C 746E7176247625402462647472247176
	?debug	C E380880000002D0104092A00
	?debug	C E3808A0000002D0104092A00
	?debug	C E3808C0000002D1E04092A00
	?debug	C E3808E0000002D2904032A001740254C69737424+
	?debug	C 746E7176247625402462637472247176
	?debug	C E31B03504342A8002E02
	?debug	C ED000200004D0E00
	?debug	C E38090000400160A00
	?debug	C E3809106537461746573020022000080FF7F76
	?debug	C E380930060001A2A
	?debug	C E380940020001A04
	?debug	C E380950020001A04
	?debug	C E380960000002D1A04011B001140504342403024+
	?debug	C 626374722471756C7569
	?debug	C E380980000002D1A04011B001940504342403024+
	?debug	C 6263747224716E36546872656164756C7569
	?debug	C E3809A0000002D0104011B001740504342403077+
	?debug	C 72617070657224716E36546872656164
	?debug	C E3809C0000002D0104011B001840504342403061+
	?debug	C 6464546F416C6C50434224716E33504342
	?debug	C E3809E0000002D0104011B001D40504342403064+
	?debug	C 656C65746546726F6D416C6C50434224716E3350+
	?debug	C 4342
	?debug	C E380A00000002D0104011B001D40504342403061+
	?debug	C 6464546F426C6F636B65644C69737424716E3350+
	?debug	C 4342
	?debug	C E380A20000002D0104011B001440504342403075+
	?debug	C 6E626C6F636B416C6C24777176
	?debug	C E380A40000002D0104011B000E40504342403024+
	?debug	C 62647472247176
	?debug	C E380A60000002D0104011B001140504342403073+
	?debug	C 69676E616C2477717569
	?debug	C E380A80000002D0104011B001E40504342403072+
	?debug	C 6567697374657248616E646C6572247175696E71+
	?debug	C 762476
	?debug	C E380AA0000002D0104011B001F40504342403075+
	?debug	C 6E7265676973746572416C6C48616E646C657273+
	?debug	C 24717569
	?debug	C E380AC0000002D0104011B001540504342403073+
	?debug	C 776170247175696E717624767432
	?debug	C E380AE0000002D0104011B001540504342403062+
	?debug	C 6C6F636B5369676E616C24717569
	?debug	C E380B00000002D0104011B001D40504342403062+
	?debug	C 6C6F636B5369676E616C476C6F62616C6C792471+
	?debug	C 7569
	?debug	C E380B20000002D0104011B001740504342403075+
	?debug	C 6E626C6F636B5369676E616C24717569
	?debug	C E380B40000002D0104011B001F40504342403075+
	?debug	C 6E626C6F636B5369676E616C476C6F62616C6C79+
	?debug	C 24717569
	?debug	C E380B60000002D0104011B001340504342403064+
	?debug	C 6F5369676E616C7324777176
	extrn	F_LXURSH@:far
	public	@DummyThread@0run$qv
	extrn	@Scheduler@0put$qn3PCB:far
_pokeb	equ	pokeb
_poke	equ	poke
_peekb	equ	peekb
_peek	equ	peek
	public	@PCB@0doSignals$wqv
	public	@PCB@0unblockSignalGlobally$qui
	public	@PCB@0unblockSignal$qui
	public	@PCB@0blockSignalGlobally$qui
	public	@PCB@0blockSignal$qui
	public	@PCB@0swap$quinqv$vt2
	public	@PCB@0unregisterAllHandlers$qui
	public	@PCB@0registerHandler$quinqv$v
	public	@PCB@0signal$wqui
	public	@PCB@0$bdtr$qv
	public	@PCB@0unblockAll$wqv
	public	@PCB@0addToBlockedList$qn3PCB
	public	@PCB@0deleteFromAllPCB$qn3PCB
	public	@PCB@0addToAllPCB$qn3PCB
	public	@PCB@0wrapper$qn6Thread
	public	@PCB@0$bctr$qn6Threadului
	public	@PCB@0$bctr$qului
	public	@PCB@0pomlist
	public	@PCB@0runningThreads
	public	@PCB@0dummyPCB
	public	@PCB@0initial
	public	@PCB@0allPCB
	public	@PCB@0globalSignalLock
	public	@PCB@0MAXID
	public	@PCB@0running
	extrn	@Timer@0needToKill:word
	extrn	@Timer@0globalLockCnt:word
	extrn	@Timer@0zahtevana_promena_konteksta:word
	extrn	@dispatch$qv:far
	extrn	@Thread@0$bctr$qului:far
	extrn	@Thread@0$bdtr$qv:far
	extrn	@_vector_delete_$qnvuiuluie:far
	extrn	@_vector_new_$qnvuiuluie:far
	extrn	@$bdele$qnv:far
	extrn	@$bnew$qui:far
_s@	equ	s@
	?debug	C EA050D
	?debug	C E380B800000023040500
	?debug	C EB09465F4C58555253484080B800
	?debug	C E380BC03696F732A002E0D
	?debug	C ED000D00007A0E00
	?debug	C E380BD08696F5F7374617465020022000080FF7F+
	?debug	C 80B8
	?debug	C E380BF096F70656E5F6D6F6465020022000080FF+
	?debug	C 7F80BD
	?debug	C E380C1087365656B5F646972020022000080FF7F+
	?debug	C 80C5
	?debug	C E380C30004001680BC00
	?debug	C E380C40000002D80C3040180BC001840696F7340+
	?debug	C 30246263747224716E3973747265616D627566
	?debug	C E380C60000002D01040180BC000E40696F734030+
	?debug	C 2462647472247176
	?debug	C E380C80000002D06040980BC00
	?debug	C E380CA0000002D06040180BC000E40696F734030+
	?debug	C 666C61677324716C
	?debug	C E380CC0000002D06040180BC000E40696F734030+
	?debug	C 7365746624716C6C
	?debug	C E380CE0000002D06040180BC000D40696F734030+
	?debug	C 7365746624716C
	?debug	C E380D00000002D06040180BC000F40696F734030+
	?debug	C 756E7365746624716C
	?debug	C E380D20000002D04040980BC00
	?debug	C E380D40000002D04040980BC00
	?debug	C E380D60000002D02040980BC00
	?debug	C E380D80000002D02040980BC00
	?debug	C E380DA0000002D04040980BC00
	?debug	C E380DC0000002D04040980BC00
	?debug	C E380DF076F73747265616D30002E0E
	?debug	C ED000E020080C80E010D80
	?debug	C E380E00000002D80DE040180DF001C406F737472+
	?debug	C 65616D4030246263747224716E3973747265616D+
	?debug	C 627566
	?debug	C E380E20000002D01040180DF0012406F73747265+
	?debug	C 616D40302462647472247176
	?debug	C E380E40000002D80DE040180DF0012406F737472+
	?debug	C 65616D40302462637472247169
	?debug	C E380E60000002D80DE040180DF0015406F737472+
	?debug	C 65616D403024626374722471696E7A63
	?debug	C E380E80000002D04040980DF00
	?debug	C E380EA0000002D01040980DF00
	?debug	C E380EC0004003580DF00
	?debug	C E380ED0000002D80EC040180DF0012406F737472+
	?debug	C 65616D4030666C757368247176
	?debug	C E380EF0000002D80EC040180DF0012406F737472+
	?debug	C 65616D40307365656B7024716C
	?debug	C E380F10000002D80EC040180DF001B406F737472+
	?debug	C 65616D40307365656B7024716C387365656B5F64+
	?debug	C 6972
	?debug	C E380F30000002D06040180DF0012406F73747265+
	?debug	C 616D403074656C6C70247176
	?debug	C E380F50000002D80EC040980DF00
	?debug	C E380F70000002D80EC040180DF0016406F737472+
	?debug	C 65616D4030777269746524716E787A6369
	?debug	C E380F90000002D80EC040980DF00
	?debug	C E380FB0000002D80EC040580DF0013406F737472+
	?debug	C 65616D403024626C736824717A63
	?debug	C E380FD0000002D80EC040D80DF00
	?debug	C E380FF0000002D80EC040D80DF00
	?debug	C E381010000002D80EC040D80DF00
	?debug	C E381030000002D80EC040D80DF00
	?debug	C E381050000002D80EC040D80DF00
	?debug	C E381070000002D80EC040580DF0012406F737472+
	?debug	C 65616D403024626C736824716C
	?debug	C E381090000002D80EC040580DF0013406F737472+
	?debug	C 65616D403024626C73682471756C
	?debug	C E3810B0000002D80EC040D80DF00
	?debug	C E3810D0000002D80EC040D80DF00
	?debug	C E3810F0000002D80EC040580DF0012406F737472+
	?debug	C 65616D403024626C7368247167
	?debug	C E381110000002D80EC040D80DF00
	?debug	C E381130000002D80EC040D80DF00
	?debug	C E381150000002D80EC040580DF0013406F737472+
	?debug	C 65616D403024626C736824716E76
	?debug	C E381170000002D80EC040580DF001C406F737472+
	?debug	C 65616D403024626C736824716E3973747265616D+
	?debug	C 627566
	?debug	C E381190000002D80EC040D80DF00
	?debug	C E3811B0000002D80EC040580DF001E406F737472+
	?debug	C 65616D403024626C736824716E716D33696F7324+
	?debug	C 6D33696F73
	?debug	C E3811D0000002D04040180DF0014406F73747265+
	?debug	C 616D4030646F5F6F706678247176
	?debug	C E3811F0000002D01040180DF0014406F73747265+
	?debug	C 616D4030646F5F6F736678247176
	?debug	C E381210000002D80DE040180DF0012406F737472+
	?debug	C 65616D40302462637472247176
	?debug	C E381230000002D01040180DF0018406F73747265+
	?debug	C 616D40306F757473747224716E787A637431
	?debug	C E380DE0004001680DF00
	?debug	C E381250000002D80DE040180BC001440696F7340+
	?debug	C 3074696524716E376F73747265616D
	?debug	C E381270000002D80DE040980BC00
	?debug	C E381290000002D04040980BC00
	?debug	C E3812B0000002D04040980BC00
	?debug	C E3812D0000002D04040980BC00
	?debug	C E3812F0000002D04040980BC00
	?debug	C E381310000002D04040980BC00
	?debug	C E381330000002D01040180BC000E40696F734030+
	?debug	C 636C656172247169
	?debug	C E38135000400160100
	?debug	C E381360000002D8135040980BC00
	?debug	C E381380000002D04040D80BC00
	?debug	C E3813B0973747265616D62756628002E0F
	?debug	C ED000F000080EB0E00
	?debug	C E3813C0000002D813A0401813B00144073747265+
	?debug	C 616D62756640302462637472247176
	?debug	C E3813E0000002D813A0401813B00174073747265+
	?debug	C 616D6275664030246263747224716E7A6369
	?debug	C E381400000002D010401813B0014407374726561+
	?debug	C 6D62756640302462647472247176
	?debug	C E381420000002D813A0401813B02184073747265+
	?debug	C 616D627566403073657462756624716E7A6369
	?debug	C E381440000002D813A0409813B00
	?debug	C E381460000002D813A0401813B00194073747265+
	?debug	C 616D627566403073657462756624716E7A636969
	?debug	C E381480000002D040409813B00
	?debug	C E3814A0000002D040409813B00
	?debug	C E3814C0000002D040409813B00
	?debug	C E3814E0000002D010409813B00
	?debug	C E381500000002D040401813B0017407374726561+
	?debug	C 6D6275664030736765746E24716E7A6369
	?debug	C E381520000002D040401813B041A407374726561+
	?debug	C 6D6275664030646F5F736765746E24716E7A6369
	?debug	C E381540000002D040401813B0618407374726561+
	?debug	C 6D6275664030756E646572666C6F77247176
	?debug	C E381560000002D040409813B00
	?debug	C E381580000002D040401813B0818407374726561+
	?debug	C 6D6275664030706261636B6661696C247169
	?debug	C E3815A0000002D040409813B00
	?debug	C E3815C0000002D040409813B00
	?debug	C E3815E0000002D040401813B0018407374726561+
	?debug	C 6D6275664030737075746E24716E787A6369
	?debug	C E381600000002D040401813B0A1B407374726561+
	?debug	C 6D6275664030646F5F737075746E24716E787A63+
	?debug	C 69
	?debug	C E381620000002D040401813B0C17407374726561+
	?debug	C 6D62756640306F766572666C6F77247169
	?debug	C E381640000002D040409813B00
	?debug	C E381660000002D060401813B0E20407374726561+
	?debug	C 6D62756640307365656B6F666624716C38736565+
	?debug	C 6B5F64697269
	?debug	C E381680000002D060401813B1017407374726561+
	?debug	C 6D62756640307365656B706F7324716C69
	?debug	C E3816A0000002D040401813B1213407374726561+
	?debug	C 6D627566403073796E63247176
	?debug	C E3816C0000002D010401813B0012407374726561+
	?debug	C 6D6275664030646270247176
	?debug	C E3816E000400160200
	?debug	C E3816F0000002D816E0409813B00
	?debug	C E381710000002D816E0409813B00
	?debug	C E381730000002D040409813B00
	?debug	C E381750000002D816E0409813B00
	?debug	C E381770000002D816E0409813B00
	?debug	C E381790000002D816E0409813B00
	?debug	C E3817B0000002D816E0409813B00
	?debug	C E3817D0000002D816E0409813B00
	?debug	C E3817F0000002D816E0409813B00
	?debug	C E381810000002D010401813B0017407374726561+
	?debug	C 6D62756640307365747024716E7A637431
	?debug	C E381830000002D010401813B0019407374726561+
	?debug	C 6D62756640307365746724716E7A6374317431
	?debug	C E381850000002D010409813B00
	?debug	C E381870000002D010409813B00
	?debug	C E381890000002D010401813B0018407374726561+
	?debug	C 6D62756640307365746224716E7A63743169
	?debug	C E3818B0000002D010409813B00
	?debug	C E3818D0000002D040409813B00
	?debug	C E3818F0000002D040409813B00
	?debug	C E381910000002D040401813B1419407374726561+
	?debug	C 6D6275664030646F616C6C6F63617465247176
	?debug	C E381930000002D040401813B0018407374726561+
	?debug	C 6D6275664030646F5F736E65787463247176
	?debug	C E381950000002D813A0401813B001E4073747265+
	?debug	C 616D6275664030246263747224716D3973747265+
	?debug	C 616D627566
	?debug	C E381970000002D010405813B001E407374726561+
	?debug	C 6D6275664030246261736724716D397374726561+
	?debug	C 6D627566
	?debug	C E3813A00040016813B00
	?debug	C E381990000002D813A040980BC00
	?debug	C E3819B0000002D06040180BC001140696F734030+
	?debug	C 626974616C6C6F63247176
	?debug	C E3819D0000002D04040180BC000F40696F734030+
	?debug	C 78616C6C6F63247176
	?debug	C E3819F000400350600
	?debug	C E381A00000002D819F040180BC000E40696F7340+
	?debug	C 3069776F7264247169
	?debug	C E381A200040035813500
	?debug	C E381A30000002D81A2040180BC000E40696F7340+
	?debug	C 3070776F7264247169
	?debug	C E381A50000002D01040180BC001840696F734030+
	?debug	C 73796E635F776974685F737464696F247176
	?debug	C E381A70000002D04040180BC000D40696F734030+
	?debug	C 736B6970247169
	?debug	C E381A90000002D80C3040180BC000E40696F7340+
	?debug	C 302462637472247176
	?debug	C E381AB0000002D01040180BC001740696F734030+
	?debug	C 696E697424716E3973747265616D627566
	?debug	C E381AD0000002D01040180BC001140696F734030+
	?debug	C 7365747374617465247169
	?debug	C E381B000000023010400
	?debug	C E381AF0004001681B000
	?debug	C E381B1000400160100
	?debug	C E381B20000002D01040180BC001140696F734030+
	?debug	C 7573657273697A65247169
	?debug	C E381B40000002D80C3040180BC001240696F7340+
	?debug	C 30246263747224716D33696F73
	?debug	C E381B60000002D01040580BC001240696F734030+
	?debug	C 246261736724716D33696F73
	?debug	C E380BB076973747265616D32002E0C
	?debug	C ED000C020081250E010D80
	?debug	C E381B80004001680BB00
	?debug	C E381B90000002D81B8040180BB001C4069737472+
	?debug	C 65616D4030246263747224716E3973747265616D+
	?debug	C 627566
	?debug	C E381BB0000002D01040180BB0012406973747265+
	?debug	C 616D40302462647472247176
	?debug	C E381BD0000002D81B8040180BB00264069737472+
	?debug	C 65616D4030246263747224716E3973747265616D+
	?debug	C 627566696E376F73747265616D
	?debug	C E381BF0000002D81B8040180BB00164069737472+
	?debug	C 65616D403024626374722471696E7A6369
	?debug	C E381C10000002D81B8040180BB001C4069737472+
	?debug	C 65616D40302462637472247169696E376F737472+
	?debug	C 65616D
	?debug	C E381C30000002D04040180BB0011406973747265+
	?debug	C 616D403069706678247169
	?debug	C E381C50000002D04040980BB00
	?debug	C E381C70000002D04040980BB00
	?debug	C E381C90000002D01040980BB00
	?debug	C E381CB0004003580BB00
	?debug	C E381CC0000002D81CB040180BB00124069737472+
	?debug	C 65616D40307365656B6724716C
	?debug	C E381CE0000002D81CB040180BB001B4069737472+
	?debug	C 65616D40307365656B6724716C387365656B5F64+
	?debug	C 6972
	?debug	C E381D00000002D06040180BB0012406973747265+
	?debug	C 616D403074656C6C67247176
	?debug	C E381D20000002D04040980BB00
	?debug	C E381D40000002D81CB040180BB00154069737472+
	?debug	C 65616D403067657424716E7A63697A63
	?debug	C E381D60000002D81CB040980BB00
	?debug	C E381D80000002D81CB040180BB00144069737472+
	?debug	C 65616D40307265616424716E7A6369
	?debug	C E381DA0000002D81CB040980BB00
	?debug	C E381DC0000002D81CB040180BB00194069737472+
	?debug	C 65616D40306765746C696E6524716E7A63697A63
	?debug	C E381DE0000002D81CB040980BB00
	?debug	C E381E00000002D81CB040180BB001C4069737472+
	?debug	C 65616D403067657424716D3973747265616D6275+
	?debug	C 667A63
	?debug	C E381E20000002D81CB040180BB00124069737472+
	?debug	C 65616D403067657424716D7563
	?debug	C E381E40000002D81CB040180BB00124069737472+
	?debug	C 65616D403067657424716D7A63
	?debug	C E381E60000002D04040180BB0010406973747265+
	?debug	C 616D4030676574247176
	?debug	C E381E80000002D04040980BB00
	?debug	C E381EA0000002D04040980BB00
	?debug	C E381EC0000002D81CB040180BB00154069737472+
	?debug	C 65616D40307075746261636B24717A63
	?debug	C E381EE0000002D81CB040180BB00144069737472+
	?debug	C 65616D403069676E6F726524716969
	?debug	C E381F00000002D81CB040D80BB00
	?debug	C E381F20000002D81CB040580BB001E4069737472+
	?debug	C 65616D4030246272736824716E716D33696F7324+
	?debug	C 6D33696F73
	?debug	C E381F40000002D81CB040580BB00144069737472+
	?debug	C 65616D4030246272736824716E7A63
	?debug	C E381F60000002D81CB040D80BB00
	?debug	C E381F80000002D81CB040580BB00144069737472+
	?debug	C 65616D4030246272736824716D7563
	?debug	C E381FA0000002D81CB040580BB00144069737472+
	?debug	C 65616D4030246272736824716D7A63
	?debug	C E381FC0000002D81CB040580BB00134069737472+
	?debug	C 65616D4030246272736824716D73
	?debug	C E381FE0000002D81CB040580BB00134069737472+
	?debug	C 65616D4030246272736824716D69
	?debug	C E382000000002D81CB040580BB00134069737472+
	?debug	C 65616D4030246272736824716D6C
	?debug	C E382020000002D81CB040580BB00144069737472+
	?debug	C 65616D4030246272736824716D7573
	?debug	C E382040000002D81CB040580BB00144069737472+
	?debug	C 65616D4030246272736824716D7569
	?debug	C E382060000002D81CB040580BB00144069737472+
	?debug	C 65616D4030246272736824716D756C
	?debug	C E382080000002D81CB040580BB00134069737472+
	?debug	C 65616D4030246272736824716D66
	?debug	C E3820A0000002D81CB040580BB00134069737472+
	?debug	C 65616D4030246272736824716D64
	?debug	C E3820C0000002D81CB040580BB00134069737472+
	?debug	C 65616D4030246272736824716D67
	?debug	C E3820E0000002D81CB040580BB001C4069737472+
	?debug	C 65616D4030246272736824716E3973747265616D+
	?debug	C 627566
	?debug	C E382100000002D81B8040180BB00124069737472+
	?debug	C 65616D40302462637472247176
	?debug	C E382120000002D01040180BB0015406973747265+
	?debug	C 616D40306561747768697465247176
	?debug	C E382140000002D02040180BB0013406973747265+
	?debug	C 616D4030646F5F676574247176
	?debug	C E380BA08696F73747265616D38002E0B
	?debug	C ED000B020081560E020C000E00
	?debug	C E382160004001680BA00
	?debug	C E382170000002D8216040180BA001D40696F7374+
	?debug	C 7265616D4030246263747224716E397374726561+
	?debug	C 6D627566
	?debug	C E382190000002D01040180BA001340696F737472+
	?debug	C 65616D40302462647472247176
	?debug	C E3821B0000002D8216040180BA001340696F7374+
	?debug	C 7265616D40302462637472247176
	?debug	C E380B913696F73747265616D5F77697468617373+
	?debug	C 69676E38002E0A
	?debug	C ED000A0200815A0E010B00
	?debug	C E3821D0004001680B900
	?debug	C E3821E0000002D821D040180B9001E40696F7374+
	?debug	C 7265616D5F7769746861737369676E4030246263+
	?debug	C 7472247176
	?debug	C E382200000002D01040180B9001E40696F737472+
	?debug	C 65616D5F7769746861737369676E403024626474+
	?debug	C 72247176
	?debug	C E382220004003580B900
	?debug	C E382230000002D8222040580B9002240696F7374+
	?debug	C 7265616D5F7769746861737369676E4030246261+
	?debug	C 736724716D33696F73
	?debug	C E382250000002D8222040580B9002840696F7374+
	?debug	C 7265616D5F7769746861737369676E4030246261+
	?debug	C 736724716E3973747265616D627566
	?debug	C E38227126F73747265616D5F7769746861737369+
	?debug	C 676E30002E10
	?debug	C ED00100200815F0E010E00
	?debug	C E3822800040016822700
	?debug	C E382290000002D822804018227001D406F737472+
	?debug	C 65616D5F7769746861737369676E403024626374+
	?debug	C 72247176
	?debug	C E3822B0000002D0104018227001D406F73747265+
	?debug	C 616D5F7769746861737369676E40302462647472+
	?debug	C 247176
	?debug	C E3822D00040035822700
	?debug	C E3822E0000002D822D040582270025406F737472+
	?debug	C 65616D5F7769746861737369676E403024626173+
	?debug	C 6724716D376F73747265616D
	?debug	C E382300000002D822D040582270027406F737472+
	?debug	C 65616D5F7769746861737369676E403024626173+
	?debug	C 6724716E3973747265616D627566
	?debug	C E38232126973747265616D5F7769746861737369+
	?debug	C 676E32002E11
	?debug	C ED0011020081640E010C00
	?debug	C E3823300040016823200
	?debug	C E382340000002D823304018232001D4069737472+
	?debug	C 65616D5F7769746861737369676E403024626374+
	?debug	C 72247176
	?debug	C E382360000002D0104018232001D406973747265+
	?debug	C 616D5F7769746861737369676E40302462647472+
	?debug	C 247176
	?debug	C E3823800040035823200
	?debug	C E382390000002D82380405823200254069737472+
	?debug	C 65616D5F7769746861737369676E403024626173+
	?debug	C 6724716D376973747265616D
	?debug	C E3823B0000002D82380405823200274069737472+
	?debug	C 65616D5F7769746861737369676E403024626173+
	?debug	C 6724716E3973747265616D627566
	?debug	C E3823D095363686564756C657201002E12
	?debug	C ED0012000081690E00
	?debug	C E3823E0000002D010401823D0016405363686564+
	?debug	C 756C6572403070757424716E33504342
	?debug	C E382400000002D1A0401823D0012405363686564+
	?debug	C 756C65724030676574247176
	?debug	C E3824200000023010400
	?debug	C E3824300000023010400
	?debug	C E3824400000023020400
	?debug	C E3824500000023040400
	?debug	C E382460666696E645F742B001E816C
	?debug	C E382470015001A02
	?debug	C E38248000D001A02
	?debug	C E38249056666626C6B2B001E8173
	?debug	C E3824A0015001A02
	?debug	C E3824B000D001A02
	?debug	C E3824C075245475041434B14001E817A
	?debug	C E3824D05535245475308001E8185
	?debug	C E3824E045245475310001F818A
	?debug	C E3824F08574F52445245475310001E818D
	?debug	C E3825008425954455245475308001E8196
	?debug	C E3825109646F73646174655F7405001E819F
	?debug	C E38252046461746504001E81A4
	?debug	C E3825309646F7374696D655F7404001E81A8
	?debug	C E382540474696D6504001E81AD
	?debug	C E382550664657668647212001E81B2
	?debug	C E382560008001A02
	?debug	C E3825707666174696E666F06001E81B8
	?debug	C E382580A6469736B667265655F7408001E81BD
	?debug	C E3825905646672656508001E81C2
	?debug	C E3825A08444F534552524F5205001E81C7
	?debug	C E3825B07434F554E54525922001E81CC
	?debug	C E3825C0005001A02
	?debug	C E3825D0002001A02
	?debug	C E3825E0002001A02
	?debug	C E3825F0002001A02
	?debug	C E382600002001A02
	?debug	C E382610002001A02
	?debug	C E38262000A001A02
	?debug	C E3826304786663622C001E81D9
	?debug	C E382640005001A02
	?debug	C E382650366636225001E81DE
	?debug	C E382660008001A02
	?debug	C E382670003001A02
	?debug	C E38268000A001A02
	?debug	C E382690554696D657201002E13
	?debug	C ED0013000081E90E00
	?debug	C E3826A0000002D0104018269000F4054696D6572+
	?debug	C 4030696E6974247176
	?debug	C E3826C0000002D010401826900124054696D6572+
	?debug	C 4030726573746F7265247176
	?debug	C E3826E00000023010400
	?debug	C EB0C406469737061746368247176826E00
	?debug	C E3826F00000023010401
	?debug	C EB1B405F766563746F725F64656C6574655F2471+
	?debug	C 6E767569756C756965826F00
	?debug	C E382700000002381350401
	?debug	C EB18405F766563746F725F6E65775F24716E7675+
	?debug	C 69756C756965827000
	?debug	C E3827100000023010400
	?debug	C EB0B40246264656C6524716E76827100
	?debug	C E382720000002381350400
	?debug	C EB0A4024626E657724717569827200
	?debug	C EC174050434240307772617070657224716E3654+
	?debug	C 6872656164809A1800
	?debug	C EC174050434240307772617070657224716E3654+
	?debug	C 6872656164809A18001452696F73747265616D5F+
	?debug	C 7769746861737369676E822206001450696F7374+
	?debug	C 7265616D5F7769746861737369676E821D060013+
	?debug	C 526F73747265616D5F7769746861737369676E82+
	?debug	C 2D060013506F73747265616D5F77697468617373+
	?debug	C 69676E8228060013526973747265616D5F776974+
	?debug	C 6861737369676E8238060013506973747265616D+
	?debug	C 5F7769746861737369676E823306000950696F73+
	?debug	C 747265616D8216060008526F73747265616D80EC+
	?debug	C 060008506F73747265616D80DE06000852697374+
	?debug	C 7265616D81CB060008506973747265616D81B806+
	?debug	C 000A5073747265616D627566813A06000450696F+
	?debug	C 7380C306000973747265616D6F66660606000973+
	?debug	C 747265616D706F7306060009707472646966665F+
	?debug	C 740606000666706F735F740606000673697A655F+
	?debug	C 740A0600085369676E616C49640A06000D536967+
	?debug	C 6E616C48616E646C657221060002494404060004+
	?debug	C 54696D650A060009537461636B53697A650C0600+
	?debug	C 0B44756D6D795468726561641907000E696F735F+
	?debug	C 757365725F756E696F6E01070013696F73747265+
	?debug	C 616D5F7769746861737369676E80B90700126F73+
	?debug	C 747265616D5F7769746861737369676E82270700+
	?debug	C 126973747265616D5F7769746861737369676E82+
	?debug	C 32070008696F73747265616D80BA0700076F7374+
	?debug	C 7265616D80DF0700076973747265616D80BB0700+
	?debug	C 0973747265616D627566813B070003696F7380BC+
	?debug	C 0700095363686564756C6572823D07000666696E+
	?debug	C 645F7482460700056666626C6B82490700075245+
	?debug	C 475041434B824C0700055352454753824D070004+
	?debug	C 52454753824E0700084259544552454753825007+
	?debug	C 0008574F524452454753824F070009646F736461+
	?debug	C 74655F748251070004646174658252070009646F+
	?debug	C 7374696D655F74825307000474696D6582540700+
	?debug	C 066465766864728255070007666174696E666F82+
	?debug	C 5707000A6469736B667265655F74825807000564+
	?debug	C 667265658259070008444F534552524F52825A07+
	?debug	C 0007434F554E545259825B070004786663628263+
	?debug	C 070003666362826507000A3C74656D706C617465+
	?debug	C 3E2607000A3C74656D706C6174653E2807000A3C+
	?debug	C 74656D706C6174653E2A07000653746174657380+
	?debug	C 9107000554696D65728269070006546872656164+
	?debug	C 1D0700035043421B0700
	?debug	F @_STDES_$qv 0 24 0
	?debug	F @_STCON_$qv 0 24 0
	?debug	F pokeb 578 24 0
	?debug	F poke 579 24 0
	?debug	F peekb 580 24 0
	?debug	F peek 581 24 0
	?debug	C E248114054687265616440307374617274247176+
	?debug	C 30481A40546872656164403077616974546F436F+
	?debug	C 6D706C657465247176324D114054687265616440+
	?debug	C 3024626474722471763448114054687265616440+
	?debug	C 3067657449642471763648184054687265616440+
	?debug	C 3067657452756E6E696E67496424717638481940+
	?debug	C 5468726561644030676574546872656164427949+
	?debug	C 642471693A48134054687265616440307369676E+
	?debug	C 616C247175693C48214054687265616440307265+
	?debug	C 67697374657248616E646C6572247175696E7176+
	?debug	C 24763E4822405468726561644030756E72656769+
	?debug	C 73746572416C6C48616E646C6572732471756940+
	?debug	C 481840546872656164403073776170247175696E+
	?debug	C 717624767432424818405468726561644030626C+
	?debug	C 6F636B5369676E616C2471756944482040546872+
	?debug	C 6561644030626C6F636B5369676E616C476C6F62+
	?debug	C 616C6C792471756946481A405468726561644030+
	?debug	C 756E626C6F636B5369676E616C24717569484822+
	?debug	C 405468726561644030756E626C6F636B5369676E+
	?debug	C 616C476C6F62616C6C79247175694A4A14405468+
	?debug	C 72656164403024626374722471756C75694C4C0F+
	?debug	C 40546872656164403072756E2471764E40040000+
	?debug	C 0000056D795043421AC008000000
	?debug	C E24A194044756D6D795468726561644030246263+
	?debug	C 74722471756C7569504C144044756D6D79546872+
	?debug	C 656164403072756E24717652C008000000
	?debug	C E27001541A70044E6F64652E00066C656E677468+
	?debug	C 040004686561642D481840254C69737424746E33+
	?debug	C 504342254065726173652477717656481B40254C+
	?debug	C 69737424746E335043422540707573682477716E+
	?debug	C 3350434258481F40254C69737424746E33504342+
	?debug	C 2540707573684261636B2477716E335043425A48+
	?debug	C 1640254C69737424746E335043422540706F7024+
	?debug	C 7771765C491740254C69737424746E3350434225+
	?debug	C 4024626474722471765E482040254C6973742474+
	?debug	C 6E33504342254064656C65746576616C2477716E+
	?debug	C 3350434260482D40254C69737424746E33504342+
	?debug	C 254064656C4E6F646524716E3138254C69737424+
	?debug	C 746E3350434225404E6F646562481940254C6973+
	?debug	C 7424746E33504342254067657448656164247176+
	?debug	C 644A1740254C69737424746E3350434225402462+
	?debug	C 63747224717666C006000000
	?debug	C E2000376616C1A00046E6578742D4A2140254C69+
	?debug	C 737424746E3350434225404E6F64654030246263+
	?debug	C 747224716E3350434254C008000000
	?debug	C E27001540A70044E6F64652400066C656E677468+
	?debug	C 0400046865616423481540254C69737424747569+
	?debug	C 25406572617365247771766A481540254C697374+
	?debug	C 2474756925407075736824777175696C48194025+
	?debug	C 4C697374247475692540707573684261636B2477+
	?debug	C 7175696E481340254C697374247475692540706F+
	?debug	C 702477717670491440254C697374247475692540+
	?debug	C 246264747224717672481A40254C697374247475+
	?debug	C 69254064656C65746576616C2477717569744827+
	?debug	C 40254C69737424747569254064656C4E6F646524+
	?debug	C 716E3135254C6973742474756925404E6F646576+
	?debug	C 481640254C697374247475692540676574486561+
	?debug	C 64247176784A1440254C69737424747569254024+
	?debug	C 626374722471767AC006000000
	?debug	C E2000376616C0A00046E657874234A1B40254C69+
	?debug	C 73742474756925404E6F64654030246263747224+
	?debug	C 71756968C006000000
	?debug	C E27001542170044E6F64651F00066C656E677468+
	?debug	C 040004686561641E481840254C69737424746E71+
	?debug	C 76247625406572617365247771767E481B40254C+
	?debug	C 69737424746E717624762540707573682477716E+
	?debug	C 717624768080481F40254C69737424746E717624+
	?debug	C 762540707573684261636B2477716E7176247680+
	?debug	C 82481640254C69737424746E717624762540706F+
	?debug	C 70247771768084491740254C69737424746E7176+
	?debug	C 2476254024626474722471768086482040254C69+
	?debug	C 737424746E71762476254064656C65746576616C+
	?debug	C 2477716E717624768088482D40254C6973742474+
	?debug	C 6E71762476254064656C4E6F646524716E313825+
	?debug	C 4C69737424746E7176247625404E6F6465808A48+
	?debug	C 1940254C69737424746E71762476254067657448+
	?debug	C 656164247176808C4A1740254C69737424746E71+
	?debug	C 76247625402462637472247176808EC006000000
	?debug	C E2000376616C2100046E6578741E4A2140254C69+
	?debug	C 737424746E7176247625404E6F64654030246263+
	?debug	C 747224716E717624767CC008000000
	?debug	C E2600D40504342403072756E6E696E6720000573+
	?debug	C 7461636B8090000273730A000273700A00026270+
	?debug	C 0A00056B76616E740A00096C6F636B436F756E74+
	?debug	C 040002696404000B74696D65556E626C6F636B04+
	?debug	C 00057374617465809100086D795468726561641C+
	?debug	C 600B4050434240304D4158494404000E7369676E+
	?debug	C 616C48616E646C6572738093000D616374697665+
	?debug	C 5369676E616C7328000A7369676E616C4C6F636B+
	?debug	C 80946016405043424030676C6F62616C5369676E+
	?debug	C 616C4C6F636B80950006706172656E741A600C40+
	?debug	C 5043424030616C6C504342260007626C6F636B65+
	?debug	C 6426600D405043424030696E697469616C20600E+
	?debug	C 40504342403064756D6D79504342206014405043+
	?debug	C 42403072756E6E696E675468726561647304600D+
	?debug	C 405043424030706F6D6C697374284A1140504342+
	?debug	C 403024626374722471756C756980964A19405043+
	?debug	C 424030246263747224716E36546872656164756C+
	?debug	C 7569809848174050434240307772617070657224+
	?debug	C 716E36546872656164809A481840504342403061+
	?debug	C 6464546F416C6C50434224716E33504342809C48+
	?debug	C 1D40504342403064656C65746546726F6D416C6C+
	?debug	C 50434224716E33504342809E481D405043424030+
	?debug	C 616464546F426C6F636B65644C69737424716E33+
	?debug	C 50434280A04814405043424030756E626C6F636B+
	?debug	C 416C6C2477717680A2490E405043424030246264+
	?debug	C 747224717680A448114050434240307369676E61+
	?debug	C 6C247771756980A6481E40504342403072656769+
	?debug	C 7374657248616E646C6572247175696E71762476+
	?debug	C 80A8481F405043424030756E7265676973746572+
	?debug	C 416C6C48616E646C6572732471756980AA481540+
	?debug	C 504342403073776170247175696E717624767432+
	?debug	C 80AC4815405043424030626C6F636B5369676E61+
	?debug	C 6C2471756980AE481D405043424030626C6F636B+
	?debug	C 5369676E616C476C6F62616C6C792471756980B0+
	?debug	C 4817405043424030756E626C6F636B5369676E61+
	?debug	C 6C2471756980B2481F405043424030756E626C6F+
	?debug	C 636B5369676E616C476C6F62616C6C7924717569+
	?debug	C 80B44813405043424030646F5369676E616C7324+
	?debug	C 77717680B6C0A8000000
	?debug	C E40004444F4E4500000005524541445901000004+
	?debug	C 4D41444502008007424C4F434B45440300
	?debug	C E27008696F5F737461746580BD70096F70656E5F+
	?debug	C 6D6F646580BF70087365656B5F64697280C1600F+
	?debug	C 40696F734030626173656669656C640660114069+
	?debug	C 6F73403061646A7573746669656C640660104069+
	?debug	C 6F734030666C6F61746669656C64064A1840696F+
	?debug	C 734030246263747224716E3973747265616D6275+
	?debug	C 6680C44D0E40696F734030246264747224717680+
	?debug	C C6480E40696F734030666C61677324717680C848+
	?debug	C 0E40696F734030666C61677324716C80CA480E40+
	?debug	C 696F7340307365746624716C6C80CC480D40696F+
	?debug	C 7340307365746624716C80CE480F40696F734030+
	?debug	C 756E7365746624716C80D0480E40696F73403077+
	?debug	C 6964746824717680D2480E40696F734030776964+
	?debug	C 746824716980D4480D40696F73403066696C6C24+
	?debug	C 717680D6480E40696F73403066696C6C24717A63+
	?debug	C 80D8481240696F734030707265636973696F6E24+
	?debug	C 716980DA481240696F734030707265636973696F+
	?debug	C 6E24717680DC481440696F73403074696524716E+
	?debug	C 376F73747265616D8125480C40696F7340307469+
	?debug	C 652471768127481040696F734030726473746174+
	?debug	C 652471768129480C40696F734030656F66247176+
	?debug	C 812B480D40696F7340306661696C247176812D48+
	?debug	C 0C40696F734030626164247176812F480D40696F+
	?debug	C 734030676F6F642471768131480E40696F734030+
	?debug	C 636C65617224716981334B0D40696F734030246F+
	?debug	C 6E762471768136480E40696F73403024626E6F74+
	?debug	C 2471768138480E40696F73403072646275662471+
	?debug	C 768199481140696F734030626974616C6C6F6324+
	?debug	C 7176819B480F40696F73403078616C6C6F632471+
	?debug	C 76819D480E40696F73403069776F726424716981+
	?debug	C A0480E40696F73403070776F726424716981A348+
	?debug	C 1840696F73403073796E635F776974685F737464+
	?debug	C 696F24717681A5480D40696F734030736B697024+
	?debug	C 716981A7400400000000026270813A0005785F74+
	?debug	C 696580DE00057374617465040008697370656369+
	?debug	C 616C0400086F7370656369616C040007785F666C+
	?debug	C 61677306000B785F707265636973696F6E040007+
	?debug	C 785F7769647468040006785F66696C6C04000C69+
	?debug	C 7366785F7370656369616C04000C6F7366785F73+
	?debug	C 70656369616C04000664656C62756604000E6173+
	?debug	C 7369676E5F70726976617465044A0E40696F7340+
	?debug	C 30246263747224717681A9481740696F73403069+
	?debug	C 6E697424716E3973747265616D62756681AB4811+
	?debug	C 40696F734030736574737461746524716981AD60+
	?debug	C 1040696F734030737464696F666C75736881AF60+
	?debug	C 0D40696F7340306E65787462697406600F40696F+
	?debug	C 73403075736572636F756E740400097573657277+
	?debug	C 6F72647381B100066E776F72647304481140696F+
	?debug	C 7340307573657273697A6524716981B24A124069+
	?debug	C 6F734030246263747224716D33696F7381B44812+
	?debug	C 40696F734030246261736724716D33696F7381B6+
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
	?debug	C 6E3973747265616D62756680E04D12406F737472+
	?debug	C 65616D4030246264747224717680E24A12406F73+
	?debug	C 747265616D4030246263747224716980E44A1540+
	?debug	C 6F73747265616D403024626374722471696E7A63+
	?debug	C 80E64811406F73747265616D40306F7066782471+
	?debug	C 7680E84811406F73747265616D40306F73667824+
	?debug	C 717680EA4812406F73747265616D4030666C7573+
	?debug	C 6824717680ED4812406F73747265616D40307365+
	?debug	C 656B7024716C80EF481B406F73747265616D4030+
	?debug	C 7365656B7024716C387365656B5F64697280F148+
	?debug	C 12406F73747265616D403074656C6C7024717680+
	?debug	C F34811406F73747265616D403070757424717A63+
	?debug	C 80F54816406F73747265616D4030777269746524+
	?debug	C 716E787A636980F74816406F73747265616D4030+
	?debug	C 777269746524716E7875636980F94813406F7374+
	?debug	C 7265616D403024626C736824717A6380FB481340+
	?debug	C 6F73747265616D403024626C73682471756380FD+
	?debug	C 4812406F73747265616D403024626C7368247173+
	?debug	C 80FF4813406F73747265616D403024626C736824+
	?debug	C 71757381014812406F73747265616D403024626C+
	?debug	C 736824716981034813406F73747265616D403024+
	?debug	C 626C73682471756981054812406F73747265616D+
	?debug	C 403024626C736824716C81074813406F73747265+
	?debug	C 616D403024626C73682471756C81094812406F73+
	?debug	C 747265616D403024626C7368247166810B481240+
	?debug	C 6F73747265616D403024626C7368247164810D48+
	?debug	C 12406F73747265616D403024626C736824716781+
	?debug	C 0F4815406F73747265616D403024626C73682471+
	?debug	C 6E787A6381114815406F73747265616D40302462+
	?debug	C 6C736824716E78756381134813406F7374726561+
	?debug	C 6D403024626C736824716E768115481C406F7374+
	?debug	C 7265616D403024626C736824716E397374726561+
	?debug	C 6D62756681174826406F73747265616D40302462+
	?debug	C 6C736824716E716D376F73747265616D246D376F+
	?debug	C 73747265616D8119481E406F73747265616D4030+
	?debug	C 24626C736824716E716D33696F73246D33696F73+
	?debug	C 811B4814406F73747265616D4030646F5F6F7066+
	?debug	C 78247176811D4814406F73747265616D4030646F+
	?debug	C 5F6F736678247176811F4A12406F73747265616D+
	?debug	C 4030246263747224717681214818406F73747265+
	?debug	C 616D40306F757473747224716E787A6374318123+
	?debug	C C030000000
	?debug	C E24A144073747265616D62756640302462637472+
	?debug	C 247176813C4A174073747265616D627566403024+
	?debug	C 6263747224716E7A6369813E4D14407374726561+
	?debug	C 6D6275664030246264747224717681404C184073+
	?debug	C 747265616D627566403073657462756624716E7A+
	?debug	C 6369814248184073747265616D62756640307365+
	?debug	C 7462756624716E75636981444819407374726561+
	?debug	C 6D627566403073657462756624716E7A63696981+
	?debug	C 4648144073747265616D62756640307367657463+
	?debug	C 247176814848154073747265616D627566403073+
	?debug	C 6E65787463247176814A48154073747265616D62+
	?debug	C 756640307362756D7063247176814C4815407374+
	?debug	C 7265616D627566403073746F737363247176814E+
	?debug	C 48174073747265616D6275664030736765746E24+
	?debug	C 716E7A636981504C1A4073747265616D62756640+
	?debug	C 30646F5F736765746E24716E7A636981524C1840+
	?debug	C 73747265616D6275664030756E646572666C6F77+
	?debug	C 247176815448194073747265616D627566403073+
	?debug	C 7075746261636B6324717A6381564C1840737472+
	?debug	C 65616D6275664030706261636B6661696C247169+
	?debug	C 815848174073747265616D6275664030696E5F61+
	?debug	C 7661696C247176815A48144073747265616D6275+
	?debug	C 6640307370757463247169815C48184073747265+
	?debug	C 616D6275664030737075746E24716E787A636981+
	?debug	C 5E4C1B4073747265616D6275664030646F5F7370+
	?debug	C 75746E24716E787A636981604C17407374726561+
	?debug	C 6D62756640306F766572666C6F77247169816248+
	?debug	C 1A4073747265616D62756640306F75745F776169+
	?debug	C 74696E6724717681644C204073747265616D6275+
	?debug	C 6640307365656B6F666624716C387365656B5F64+
	?debug	C 69726981664C174073747265616D627566403073+
	?debug	C 65656B706F7324716C6981684C13407374726561+
	?debug	C 6D627566403073796E63247176816A4812407374+
	?debug	C 7265616D6275664030646270247176816C481340+
	?debug	C 73747265616D627566403062617365247176816F+
	?debug	C 48134073747265616D6275664030656275662471+
	?debug	C 76817148134073747265616D6275664030626C65+
	?debug	C 6E247176817348144073747265616D6275664030+
	?debug	C 7062617365247176817548134073747265616D62+
	?debug	C 7566403070707472247176817748144073747265+
	?debug	C 616D627566403065707074722471768179481440+
	?debug	C 73747265616D6275664030656261636B24717681+
	?debug	C 7B48134073747265616D62756640306770747224+
	?debug	C 7176817D48144073747265616D62756640306567+
	?debug	C 707472247176817F48174073747265616D627566+
	?debug	C 40307365747024716E7A63743181814819407374+
	?debug	C 7265616D62756640307365746724716E7A637431+
	?debug	C 7431818348144073747265616D62756640307062+
	?debug	C 756D70247169818548144073747265616D627566+
	?debug	C 40306762756D7024716981874818407374726561+
	?debug	C 6D62756640307365746224716E7A637431698189+
	?debug	C 48194073747265616D6275664030756E62756666+
	?debug	C 65726564247169818B48194073747265616D6275+
	?debug	C 664030756E6275666665726564247176818D4817+
	?debug	C 4073747265616D6275664030616C6C6F63617465+
	?debug	C 247176818F4C194073747265616D627566403064+
	?debug	C 6F616C6C6F636174652471768191400400000000+
	?debug	C 06616C6C6F635F040006756E6275665F04000562+
	?debug	C 6173655F816E0005656275665F816E0006706261+
	?debug	C 73655F816E0005707074725F816E000665707074+
	?debug	C 725F816E0006656261636B5F816E000567707472+
	?debug	C 5F816E000665677074725F816E48184073747265+
	?debug	C 616D6275664030646F5F736E6578746324717681+
	?debug	C 934A1E4073747265616D62756640302462637472+
	?debug	C 24716D3973747265616D6275668195481E407374+
	?debug	C 7265616D6275664030246261736724716D397374+
	?debug	C 7265616D6275668197C028000000
	?debug	C E24A1C406973747265616D403024626374722471+
	?debug	C 6E3973747265616D62756681B94D124069737472+
	?debug	C 65616D4030246264747224717681BB4A26406973+
	?debug	C 747265616D4030246263747224716E3973747265+
	?debug	C 616D627566696E376F73747265616D81BD4A1640+
	?debug	C 6973747265616D403024626374722471696E7A63+
	?debug	C 6981BF4A1C406973747265616D40302462637472+
	?debug	C 247169696E376F73747265616D81C14811406973+
	?debug	C 747265616D40306970667824716981C348124069+
	?debug	C 73747265616D4030697066783024717681C54812+
	?debug	C 406973747265616D4030697066783124717681C7+
	?debug	C 4811406973747265616D40306973667824717681+
	?debug	C C94812406973747265616D40307365656B672471+
	?debug	C 6C81CC481B406973747265616D40307365656B67+
	?debug	C 24716C387365656B5F64697281CE481240697374+
	?debug	C 7265616D403074656C6C6724717681D048114069+
	?debug	C 73747265616D403073796E6324717681D2481540+
	?debug	C 6973747265616D403067657424716E7A63697A63+
	?debug	C 81D44815406973747265616D403067657424716E+
	?debug	C 7563697A6381D64814406973747265616D403072+
	?debug	C 65616424716E7A636981D8481440697374726561+
	?debug	C 6D40307265616424716E75636981DA4819406973+
	?debug	C 747265616D40306765746C696E6524716E7A6369+
	?debug	C 7A6381DC4819406973747265616D40306765746C+
	?debug	C 696E6524716E7563697A6381DE481C4069737472+
	?debug	C 65616D403067657424716D3973747265616D6275+
	?debug	C 667A6381E04812406973747265616D4030676574+
	?debug	C 24716D756381E24812406973747265616D403067+
	?debug	C 657424716D7A6381E44810406973747265616D40+
	?debug	C 3067657424717681E64811406973747265616D40+
	?debug	C 307065656B24717681E84813406973747265616D+
	?debug	C 403067636F756E7424717681EA48154069737472+
	?debug	C 65616D40307075746261636B24717A6381EC4814+
	?debug	C 406973747265616D403069676E6F726524716969+
	?debug	C 81EE4826406973747265616D4030246272736824+
	?debug	C 716E716D376973747265616D246D376973747265+
	?debug	C 616D81F0481E406973747265616D403024627273+
	?debug	C 6824716E716D33696F73246D33696F7381F24814+
	?debug	C 406973747265616D4030246272736824716E7A63+
	?debug	C 81F44814406973747265616D4030246272736824+
	?debug	C 716E756381F64814406973747265616D40302462+
	?debug	C 72736824716D756381F84814406973747265616D+
	?debug	C 4030246272736824716D7A6381FA481340697374+
	?debug	C 7265616D4030246272736824716D7381FC481340+
	?debug	C 6973747265616D4030246272736824716D6981FE+
	?debug	C 4813406973747265616D4030246272736824716D+
	?debug	C 6C82004814406973747265616D40302462727368+
	?debug	C 24716D757382024814406973747265616D403024+
	?debug	C 6272736824716D75698204481440697374726561+
	?debug	C 6D4030246272736824716D756C82064813406973+
	?debug	C 747265616D4030246272736824716D6682084813+
	?debug	C 406973747265616D4030246272736824716D6482+
	?debug	C 0A4813406973747265616D403024627273682471+
	?debug	C 6D67820C481C406973747265616D403024627273+
	?debug	C 6824716E3973747265616D627566820E4A124069+
	?debug	C 73747265616D4030246263747224717682104815+
	?debug	C 406973747265616D403065617477686974652471+
	?debug	C 7682124006000000000767636F756E745F044813+
	?debug	C 406973747265616D4030646F5F67657424717682+
	?debug	C 14C032000000
	?debug	C E24A1D40696F73747265616D4030246263747224+
	?debug	C 716E3973747265616D62756682174D1340696F73+
	?debug	C 747265616D4030246264747224717682194A1340+
	?debug	C 696F73747265616D40302462637472247176821B+
	?debug	C C038000000
	?debug	C E24A1E40696F73747265616D5F77697468617373+
	?debug	C 69676E40302462637472247176821E4D1E40696F+
	?debug	C 73747265616D5F7769746861737369676E403024+
	?debug	C 626474722471768220482240696F73747265616D+
	?debug	C 5F7769746861737369676E403024626173672471+
	?debug	C 6D33696F738223482840696F73747265616D5F77+
	?debug	C 69746861737369676E4030246261736724716E39+
	?debug	C 73747265616D6275668225C038000000
	?debug	C E24A1D406F73747265616D5F7769746861737369+
	?debug	C 676E4030246263747224717682294D1D406F7374+
	?debug	C 7265616D5F7769746861737369676E4030246264+
	?debug	C 7472247176822B4825406F73747265616D5F7769+
	?debug	C 746861737369676E4030246261736724716D376F+
	?debug	C 73747265616D822E4827406F73747265616D5F77+
	?debug	C 69746861737369676E4030246261736724716E39+
	?debug	C 73747265616D6275668230C030000000
	?debug	C E24A1D406973747265616D5F7769746861737369+
	?debug	C 676E4030246263747224717682344D1D40697374+
	?debug	C 7265616D5F7769746861737369676E4030246264+
	?debug	C 747224717682364825406973747265616D5F7769+
	?debug	C 746861737369676E4030246261736724716D3769+
	?debug	C 73747265616D82394827406973747265616D5F77+
	?debug	C 69746861737369676E4030246261736724716E39+
	?debug	C 73747265616D627566823BC032000000
	?debug	C E24816405363686564756C657240307075742471+
	?debug	C 6E33504342823E4812405363686564756C657240+
	?debug	C 306765742471768240C001000000
	?debug	C E200087265736572766564824700066174747269+
	?debug	C 6202000777725F74696D650A000777725F646174+
	?debug	C 650A000473697A650600046E616D658248C02B00+
	?debug	C 0000
	?debug	C E2000B66665F7265736572766564824A00096666+
	?debug	C 5F61747472696202000866665F6674696D650A00+
	?debug	C 0866665F66646174650A000866665F6673697A65+
	?debug	C 06000766665F6E616D65824BC02B000000
	?debug	C E20004725F61780A0004725F62780A0004725F63+
	?debug	C 780A0004725F64780A0004725F62700A0004725F+
	?debug	C 73690A0004725F64690A0004725F64730A000472+
	?debug	C 5F65730A0007725F666C6167730AC014000000
	?debug	C E2000265730A000263730A000273730A00026473+
	?debug	C 0AC008000000
	?debug	C E2000178824F0001688250C010000000
	?debug	C E2000261780A000262780A000263780A00026478+
	?debug	C 0A000273690A000264690A000563666C61670A00+
	?debug	C 05666C6167730AC010000000
	?debug	C E20002616C0800026168080002626C0800026268+
	?debug	C 080002636C0800026368080002646C0800026468+
	?debug	C 08C008000000
	?debug	C E200036461790800056D6F6E7468080004796561+
	?debug	C 720A00096461796F667765656B08C005000000
	?debug	C E2000764615F7965617204000664615F64617902+
	?debug	C 000664615F6D6F6E02C004000000
	?debug	C E20004686F75720800066D696E75746508000673+
	?debug	C 65636F6E64080007687365636F6E6408C0040000+
	?debug	C 00
	?debug	C E2000674695F6D696E08000774695F686F757208+
	?debug	C 000774695F68756E6408000674695F73656308C0+
	?debug	C 04000000
	?debug	C E2000764685F6E65787406000764685F61747472+
	?debug	C 04000864685F73747261740A000864685F696E74+
	?debug	C 65720A000764685F6E616D658256C012000000
	?debug	C E2000866695F73636C757302000866695F666174+
	?debug	C 696402000866695F6E636C75730A000866695F62+
	?debug	C 7973656304C006000000
	?debug	C E2000E746F74616C5F636C7573746572730A000E+
	?debug	C 617661696C5F636C7573746572730A0013736563+
	?debug	C 746F72735F7065725F636C75737465720A001062+
	?debug	C 797465735F7065725F736563746F720AC0080000+
	?debug	C 00
	?debug	C E2000864665F617661696C0A000864665F746F74+
	?debug	C 616C0A000764665F627365630A000864665F7363+
	?debug	C 6C75730AC008000000
	?debug	C E2000B64655F6578746572726F7204000864655F+
	?debug	C 636C61737302000964655F616374696F6E020008+
	?debug	C 64655F6C6F63757302C005000000
	?debug	C E20007636F5F64617465040007636F5F63757272+
	?debug	C 825C0008636F5F7468736570825D0008636F5F64+
	?debug	C 65736570825E0008636F5F6474736570825F0008+
	?debug	C 636F5F746D7365708260000C636F5F6375727273+
	?debug	C 74796C65020009636F5F64696769747302000763+
	?debug	C 6F5F74696D65020007636F5F6361736506000863+
	?debug	C 6F5F646173657082610007636F5F66696C6C8262+
	?debug	C C022000000
	?debug	C E20009786663625F666C6167020009786663625F+
	?debug	C 7265737682640009786663625F61747472020008+
	?debug	C 786663625F6663628265C02C000000
	?debug	C E200096663625F64726976650200086663625F6E+
	?debug	C 616D65826600076663625F6578748267000A6663+
	?debug	C 625F637572626C6B04000B6663625F7265637369+
	?debug	C 7A6504000B6663625F66696C73697A6506000866+
	?debug	C 63625F646174650400086663625F726573768268+
	?debug	C 000A6663625F63757272656302000A6663625F72+
	?debug	C 616E646F6D06C025000000
	?debug	C E2600E4054696D6572403062726F6A61630A6023+
	?debug	C 4054696D657240307A6168746576616E615F7072+
	?debug	C 6F6D656E615F6B6F6E74656B7374610A60154054+
	?debug	C 696D65724030676C6F62616C4C6F636B436E7404+
	?debug	C 60174054696D65724030706F7A76616E5F646973+
	?debug	C 70617463680460124054696D657240306E656564+
	?debug	C 546F4B696C6C04480F4054696D65724030696E69+
	?debug	C 74247176826A48124054696D6572403072657374+
	?debug	C 6F7265247176826CC001000000
	end
