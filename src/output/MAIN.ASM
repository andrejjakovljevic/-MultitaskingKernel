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
	?debug	S "main.cpp"
	?debug	C E9189EA550086D61696E2E637070
	?debug	C E9C19894500C2E2E5C685C74696D65722E68
	?debug	C E97B70A2500D2E2E5C685C7468726561642E68
	?debug	C E9D99B7D500F2E2E5C685C73656D6170686F722E68
	?debug	C E98C6683500C2E2E5C685C6576656E742E68
	?debug	C E94A72A2500D2E2E5C685C6D6163726F732E68
	?debug	C E9A381A5500F2E2E5C685C495654456E7472792E68
	?debug	C E94029CA1817633A5C626333315C696E636C7564655C737464696F+
	?debug	C 2E68
	?debug	C E94029CA1817633A5C626333315C696E636C7564655C5F64656673+
	?debug	C 2E68
	?debug	C E94029CA1818633A5C626333315C696E636C7564655C5F6E66696C+
	?debug	C 652E68
	?debug	C E94029CA1817633A5C626333315C696E636C7564655C5F6E756C6C+
	?debug	C 2E68
	?debug	C E9C19894500C2E2E5C685C74696D65722E68
	?debug	C E9A381A5500F2E2E5C685C495654456E7472792E68
	?debug	C E94029CA1817633A5C626333315C696E636C7564655C737464696F+
	?debug	C 2E68
	?debug	C E94029CA1815633A5C626333315C696E636C7564655C646F732E68
	?debug	C E94029CA1818633A5C626333315C696E636C7564655C7374646172+
	?debug	C 672E68
	?debug	C E94029CA181A633A5C626333315C696E636C7564655C696F737472+
	?debug	C 65616D2E68
	?debug	C E94029CA1815633A5C626333315C696E636C7564655C6D656D2E68
	?debug	C E94029CA1818633A5C626333315C696E636C7564655C7374646C69+
	?debug	C 622E68
	?debug	C E94029CA1817633A5C626333315C696E636C7564655C636F6E696F+
	?debug	C 2E68
	?debug	C E970B1A2500A2E2E5C685C7063622E68
	?debug	C E97B70A2500D2E2E5C685C7468726561642E68
	?debug	C E9E27AA5500C2E2E5C685C6C697374612E68
	?debug	C E94029CA1817633A5C626333315C696E636C7564655C737464696F+
	?debug	C 2E68
	?debug	C E9C19894500C2E2E5C685C74696D65722E68
MAIN_TEXT	segment byte public 'CODE'
MAIN_TEXT	ends
	assume	cs:MAIN_TEXT,ds:MAIN_DATA
MAIN_DATA	segment word public 'FAR_DATA'
d@	label	byte
d@w	label	word
b@	label	byte
b@w	label	word
MAIN_DATA	ends
MAIN_TEXT	segment byte public 'CODE'
	?debug	C E801086D61696E2E637070189EA550
   ;	
   ;	int syncPrintf(const char *format, ...)
   ;	
	?debug	L 14
	assume	cs:MAIN_TEXT
@syncPrintf$qnxzce	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	sub	sp,6
	push	ds
	mov	ax,MAIN_DATA
	mov	ds,ax
	?debug	C E318000400160200
	?debug	C E606666F726D6174180A060000
	?debug	B
   ;	
   ;	{
   ;	    int res;
   ;	    va_list args;
   ;	    hardlock;
   ;	
	?debug	L 18
 	pushf	
 	cli	
   ;	
   ;	        va_start(args, format);
   ;	
	?debug	L 19
	lea	ax,word ptr [bp+10]
	mov	word ptr [bp-4],ss
	mov	word ptr [bp-6],ax
   ;	
   ;	    res = vprintf(format, args);
   ;	
	?debug	L 20
	push	word ptr [bp-4]
	push	word ptr [bp-6]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr _vprintf
	add	sp,8
	mov	word ptr [bp-2],ax
   ;	
   ;	    va_end(args);
   ;	
	?debug	L 21
   ;	
   ;	    hardunlock;
   ;	
	?debug	L 22
 	popf	
   ;	
   ;	        return res;
   ;	
	?debug	L 23
	mov	ax,word ptr [bp-2]
	jmp	short @1@170
@1@170:
   ;	
   ;	}
   ;	
	?debug	L 24
	pop	ds
	mov	sp,bp
	pop	bp
	ret	
	?debug	C E319000400160100
	?debug	C E604617267731902FAFF00037265730402FEFF00+
	?debug	C 06666F726D6174180A060000
	?debug	E
	?debug	E
@syncPrintf$qnxzce	endp
   ;	
   ;	void TestThread::run()
   ;	
	?debug	L 43
	assume	cs:MAIN_TEXT
@TestThread@0run$qv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	si
	push	di
	push	ds
	mov	ax,MAIN_DATA
	mov	ds,ax
	?debug	C F8134054657374546872656164403072756E2471+
	?debug	C 76
	?debug	C E31A000400161B00
	?debug	C E604746869731A02060000
	?debug	B
   ;	
   ;	{
   ;	    syncPrintf("Thread %d: loop1 starts\n", getId());
   ;	
	?debug	L 45
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @Thread@0getId$qv
	pop	cx
	pop	cx
	push	ax
	push	ds
	mov	ax,offset s@
	push	ax
	push	cs
	call	near ptr @syncPrintf$qnxzce
	add	sp,6
   ;	
   ;	
   ;	    for(int i=0;i<32000;i++)
   ;	
	?debug	L 47
	xor	si,si
	jmp	short @2@170
@2@58:
	?debug	B
   ;	
   ;	    {
   ;	        for (int j = 0; j < 32000; j++);
   ;	
	?debug	L 49
	xor	ax,ax
	jmp	short @2@114
@2@86:
	inc	ax
@2@114:
	cmp	ax,32000
	jl	short @2@86
	?debug	C E6016A04040000
	?debug	E
	?debug	L 47
	inc	si
@2@170:
	cmp	si,32000
	jl	short @2@58
   ;	
   ;	    }
   ;	
   ;	    syncPrintf("Thread %d: loop1 ends, dispatch\n",getId());
   ;	
	?debug	L 52
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @Thread@0getId$qv
	pop	cx
	pop	cx
	push	ax
	push	ds
	mov	ax,offset s@+25
	push	ax
	push	cs
	call	near ptr @syncPrintf$qnxzce
	add	sp,6
   ;	
   ;	
   ;	    dispatch();
   ;	
	?debug	L 54
	call	far ptr @dispatch$qv
   ;	
   ;	
   ;	    syncPrintf("Thread %d: loop2 starts\n",getId());
   ;	
	?debug	L 56
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @Thread@0getId$qv
	pop	cx
	pop	cx
	push	ax
	push	ds
	mov	ax,offset s@+58
	push	ax
	push	cs
	call	near ptr @syncPrintf$qnxzce
	add	sp,6
   ;	
   ;	
   ;	    for (int k = 0; k < 20000; k++);
   ;	
	?debug	L 58
	xor	di,di
	jmp	short @2@254
@2@226:
	inc	di
@2@254:
	cmp	di,20000
	jl	short @2@226
   ;	
   ;	
   ;	    syncPrintf("Thread %d: loop2 ends\n",getId());
   ;	
	?debug	L 60
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @Thread@0getId$qv
	pop	cx
	pop	cx
	push	ax
	push	ds
	mov	ax,offset s@+83
	push	ax
	push	cs
	call	near ptr @syncPrintf$qnxzce
	add	sp,6
   ;	
   ;	
   ;	
   ;	}
   ;	
	?debug	L 63
	pop	ds
	pop	di
	pop	si
	pop	bp
	ret	
	?debug	C E6016B0404070001690404060004746869731A02+
	?debug	C 060000
	?debug	E
	?debug	E
@TestThread@0run$qv	endp
   ;	
   ;	void tick() {}
   ;	
	?debug	L 94
	assume	cs:MAIN_TEXT
@tick$qv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,MAIN_DATA
	mov	ds,ax
	?debug	B
	pop	ds
	pop	bp
	ret	
	?debug	E
	?debug	E
@tick$qv	endp
   ;	
   ;	int userMain(int argc, char** argv)
   ;	
	?debug	L 96
	assume	cs:MAIN_TEXT
@userMain$qinnzc	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	sub	sp,32
	push	ds
	mov	ax,MAIN_DATA
	mov	ds,ax
	?debug	C E31D000400160200
	?debug	C E31C000400161D00
	?debug	C E604617267761C0A0800000461726763040A0600+
	?debug	C 00
	?debug	B
   ;	
   ;	{
   ;	    syncPrintf("User main starts\n");
   ;	
	?debug	L 98
	push	ds
	mov	ax,offset s@+106
	push	ax
	push	cs
	call	near ptr @syncPrintf$qnxzce
	pop	cx
	pop	cx
   ;	
   ;	    TestThread t1,t2;
   ;	
	?debug	L 99
	push	ss
	lea	ax,word ptr [bp-8]
	push	ax
	call	far ptr @@TestThread@0$bctr$qv
	pop	cx
	pop	cx
	push	ss
	lea	ax,word ptr [bp-16]
	push	ax
	call	far ptr @@TestThread@0$bctr$qv
	pop	cx
	pop	cx
   ;	
   ;	    WaitThread w(&t1,&t2);
   ;	
	?debug	L 100
	push	ss
	lea	ax,word ptr [bp-16]
	push	ax
	push	ss
	lea	ax,word ptr [bp-8]
	push	ax
	push	ss
	lea	ax,word ptr [bp-32]
	push	ax
	call	far ptr @@WaitThread@0$bctr$qn10TestThreadt1
	add	sp,12
   ;	
   ;	    t1.start();
   ;	
	?debug	L 101
	push	ss
	lea	ax,word ptr [bp-8]
	push	ax
	call	far ptr @Thread@0start$qv
	pop	cx
	pop	cx
   ;	
   ;	    t2.start();
   ;	
	?debug	L 102
	push	ss
	lea	ax,word ptr [bp-16]
	push	ax
	call	far ptr @Thread@0start$qv
	pop	cx
	pop	cx
   ;	
   ;	    w.start();
   ;	
	?debug	L 103
	push	ss
	lea	ax,word ptr [bp-32]
	push	ax
	call	far ptr @Thread@0start$qv
	pop	cx
	pop	cx
   ;	
   ;	    syncPrintf("User main ends\n");
   ;	
	?debug	L 104
	push	ds
	mov	ax,offset s@+124
	push	ax
	push	cs
	call	near ptr @syncPrintf$qnxzce
	pop	cx
	pop	cx
	mov	ax,2
	push	ax
	push	ss
	lea	ax,word ptr [bp-32]
	push	ax
	call	far ptr @@WaitThread@0$bdtr$qv
	add	sp,6
	mov	ax,2
	push	ax
	push	ss
	lea	ax,word ptr [bp-16]
	push	ax
	call	far ptr @@TestThread@0$bdtr$qv
	add	sp,6
	mov	ax,2
	push	ax
	push	ss
	lea	ax,word ptr [bp-8]
	push	ax
	call	far ptr @@TestThread@0$bdtr$qv
	add	sp,6
   ;	
   ;	    return 16;
   ;	
	?debug	L 105
	mov	ax,16
	jmp	short @4@58
@4@58:
   ;	
   ;	}
   ;	
	?debug	L 106
	pop	ds
	mov	sp,bp
	pop	bp
	ret	
	?debug	C E601771E02E0FF000274321B02F0FF000274311B+
	?debug	C 02F8FF000461726763040A06000004617267761C+
	?debug	C 0A080000
	?debug	E
	?debug	E
@userMain$qinnzc	endp
MAIN_TEXT	ends
MAIN_DATA	segment word public 'FAR_DATA'
_res	label	word
	db	255
	db	255
_flag	label	word
	db	0
	db	0
_global_argc	label	word
	db	2 dup (0)
_global_argv	label	dword
	db	4 dup (0)
MAIN_DATA	ends
MAIN_TEXT	segment byte public 'CODE'
   ;	
   ;	UserThread::~UserThread()
   ;	
	?debug	L 121
	assume	cs:MAIN_TEXT
@UserThread@0$bdtr$qv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	si
	push	ds
	mov	ax,MAIN_DATA
	mov	ds,ax
	?debug	C F815405573657254687265616440302462647472+
	?debug	C 247176
	?debug	C E31F000400162000
	?debug	C E60664656C657465040A0A000004746869731F02+
	?debug	C 060000
	mov	si,word ptr [bp+10]
	?debug	B
   ;	
   ;	{
   ;	
	?debug	L 122
	mov	ax,word ptr [bp+6]
	or	ax,word ptr [bp+8]
	je	short @5@142
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+2],seg @@UserThread@0
	mov	word ptr es:[bx],offset @@UserThread@0
   ;	
   ;	    waitToComplete();
   ;	
	?debug	L 123
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @Thread@0waitToComplete$qv
	pop	cx
	pop	cx
	xor	ax,ax
	push	ax
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @Thread@0$bdtr$qv
	add	sp,6
	test	si,1
	je	short @5@142
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @$bdele$qnv
	pop	cx
	pop	cx
@5@142:
   ;	
   ;	}
   ;	
	?debug	L 124
	pop	ds
	pop	si
	pop	bp
	ret	
	?debug	C E604746869731F020600000664656C657465040C+
	?debug	C 0600
	?debug	E
	?debug	E
@UserThread@0$bdtr$qv	endp
   ;	
   ;	void UserThread::run()
   ;	
	?debug	L 127
	assume	cs:MAIN_TEXT
@UserThread@0run$qv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,MAIN_DATA
	mov	ds,ax
	?debug	C F8134055736572546872656164403072756E2471+
	?debug	C 76
	?debug	C E604746869731F02060000
	?debug	B
   ;	
   ;	{
   ;	    res=userMain(global_argc,global_argv);
   ;	
	?debug	L 129
	push	word ptr _global_argv+2
	push	word ptr _global_argv
	push	word ptr _global_argc
	push	cs
	call	near ptr @userMain$qinnzc
	add	sp,6
	mov	word ptr _res,ax
   ;	
   ;	}
   ;	
	?debug	L 130
	pop	ds
	pop	bp
	ret	
	?debug	C E604746869731F02060000
	?debug	E
	?debug	E
@UserThread@0run$qv	endp
   ;	
   ;	int main(int argc, char** argv)
   ;	
	?debug	L 132
	assume	cs:MAIN_TEXT
_main	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	sub	sp,10
	push	ds
	mov	ax,MAIN_DATA
	mov	ds,ax
	?debug	C E604617267761C0A0800000461726763040A0600+
	?debug	C 00
	?debug	B
   ;	
   ;	{
   ;	    //system("cls");
   ;	    softlock;
   ;	
	?debug	L 135
	mov	ax,seg @Timer@0globalLockCnt
	mov	es,ax
	inc	word ptr es:@Timer@0globalLockCnt
   ;	
   ;	    Timer::init();
   ;	
	?debug	L 136
	call	far ptr @Timer@0init$qv
   ;	
   ;	    global_argc=argc;
   ;	
	?debug	L 137
	mov	ax,word ptr [bp+6]
	mov	word ptr _global_argc,ax
   ;	
   ;	    global_argv=argv;
   ;	
	?debug	L 138
	mov	ax,word ptr [bp+10]
	mov	dx,word ptr [bp+8]
	mov	word ptr _global_argv+2,ax
	mov	word ptr _global_argv,dx
   ;	
   ;	    UserThread ut;
   ;	
	?debug	L 139
	push	ss
	lea	ax,word ptr [bp-8]
	push	ax
	call	far ptr @@UserThread@0$bctr$qv
	pop	cx
	pop	cx
   ;	
   ;	    ut.start();
   ;	
	?debug	L 140
	push	ss
	lea	ax,word ptr [bp-8]
	push	ax
	call	far ptr @Thread@0start$qv
	pop	cx
	pop	cx
   ;	
   ;	    softunlock;
   ;	
	?debug	L 141
	mov	ax,seg @Timer@0globalLockCnt
	mov	es,ax
	dec	word ptr es:@Timer@0globalLockCnt
	jne	short @7@86
	mov	ax,seg @Timer@0zahtevana_promena_konteksta
	mov	es,ax
	cmp	word ptr es:@Timer@0zahtevana_promena_konteksta,0
	je	short @7@86
@7@86:
   ;	
   ;	    dispatch();
   ;	
	?debug	L 142
	call	far ptr @dispatch$qv
   ;	
   ;	    /*softlock;
   ;	    printf("Happy End\n");
   ;	    softunlock;*/
   ;	    /*while(1)
   ;	    {
   ;	        softlock;
   ;	        int dummy=0;
   ;	        if (Timer::globalLockCnt>0) dummy++;
   ;	        else dummy--;
   ;	        softunlock;
   ;	    }*/
   ;	    //while(flag==0);
   ;	    hardlock;
   ;	
	?debug	L 155
 	pushf	
 	cli	
   ;	
   ;	    //printf("res=%d\n",res);
   ;	    Timer::restore();
   ;	
	?debug	L 157
	call	far ptr @Timer@0restore$qv
   ;	
   ;	    delete PCB::dummyPCB;
   ;	
	?debug	L 158
	mov	ax,3
	push	ax
	mov	ax,seg @PCB@0dummyPCB
	mov	es,ax
	push	word ptr es:@PCB@0dummyPCB+2
	push	word ptr es:@PCB@0dummyPCB
	call	far ptr @PCB@0$bdtr$qv
	add	sp,6
   ;	
   ;	    delete PCB::initial;
   ;	
	?debug	L 159
	mov	ax,3
	push	ax
	mov	ax,seg @PCB@0initial
	mov	es,ax
	push	word ptr es:@PCB@0initial+2
	push	word ptr es:@PCB@0initial
	call	far ptr @PCB@0$bdtr$qv
	add	sp,6
   ;	
   ;	    hardunlock;
   ;	
	?debug	L 160
 	popf	
   ;	
   ;	    //while(1);
   ;	    //while(1);
   ;	    return res;
   ;	
	?debug	L 163
	mov	ax,word ptr _res
	mov	word ptr [bp-10],ax
	mov	ax,2
	push	ax
	push	ss
	lea	ax,word ptr [bp-8]
	push	ax
	push	cs
	call	near ptr @UserThread@0$bdtr$qv
	add	sp,6
	mov	ax,word ptr [bp-10]
	jmp	short @7@254
@7@254:
   ;	
   ;	}
   ;	
	?debug	L 164
	pop	ds
	mov	sp,bp
	pop	bp
	ret	
	?debug	C E60275742002F8FF000461726763040A06000004+
	?debug	C 617267761C0A080000
	?debug	E
	?debug	E
_main	endp
MAIN_TEXT	ends
MAIN_TEXT	segment byte public 'CODE'
@TestThread@0$bctr$qv	segment	virtual
	?debug	C E801
	?debug	L 32
	assume	cs:@TestThread@0$bctr$qv
@@TestThread@0$bctr$qv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,MAIN_DATA
	mov	ds,ax
	?debug	C F815405465737454687265616440302462637472+
	?debug	C 247176
	?debug	C E604746869731A02060000
	?debug	B
	mov	ax,word ptr [bp+6]
	or	ax,word ptr [bp+8]
	jne	short @8@86
	mov	ax,8
	push	ax
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp+8],dx
	mov	word ptr [bp+6],ax
	or	ax,dx
	je	short @8@114
@8@86:
	mov	ax,2
	push	ax
	xor	ax,ax
	mov	dx,4096
	push	ax
	push	dx
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @Thread@0$bctr$qului
	add	sp,10
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+2],seg @@TestThread@0
	mov	word ptr es:[bx],offset @@TestThread@0
@8@114:
	mov	dx,word ptr [bp+8]
	mov	ax,word ptr [bp+6]
	jmp	short @8@142
@8@142:
	pop	ds
	pop	bp
	ret	
	?debug	C E604746869731A02060000
	?debug	E
	?debug	E
@@TestThread@0$bctr$qv	endp
@TestThread@0$bctr$qv	ends
MAIN_TEXT	ends
MAIN_TEXT	segment byte public 'CODE'
@TestThread@0$bdtr$qv	segment	virtual
	?debug	C E801
	?debug	L 33
	assume	cs:@TestThread@0$bdtr$qv
@@TestThread@0$bdtr$qv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	si
	push	ds
	mov	ax,MAIN_DATA
	mov	ds,ax
	?debug	C F815405465737454687265616440302462647472+
	?debug	C 247176
	?debug	C E60664656C657465040A0A000004746869731A02+
	?debug	C 060000
	mov	si,word ptr [bp+10]
	?debug	B
	?debug	L 34
	mov	ax,word ptr [bp+6]
	or	ax,word ptr [bp+8]
	je	short @9@142
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+2],seg @@TestThread@0
	mov	word ptr es:[bx],offset @@TestThread@0
	?debug	L 35
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @Thread@0waitToComplete$qv
	pop	cx
	pop	cx
	xor	ax,ax
	push	ax
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @Thread@0$bdtr$qv
	add	sp,6
	test	si,1
	je	short @9@142
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @$bdele$qnv
	pop	cx
	pop	cx
@9@142:
	?debug	L 36
	pop	ds
	pop	si
	pop	bp
	ret	
	?debug	C E604746869731A020600000664656C657465040C+
	?debug	C 0600
	?debug	E
	?debug	E
@@TestThread@0$bdtr$qv	endp
@TestThread@0$bdtr$qv	ends
MAIN_TEXT	ends
MAIN_TEXT	segment byte public 'CODE'
@WaitThread@0$bctr$qn10TestThreadt1	segment	virtual
	?debug	C E801
	?debug	L 71
	assume	cs:@WaitThread@0$bctr$qn10TestThreadt1
@@WaitThread@0$bctr$qn10TestThreadt1	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,MAIN_DATA
	mov	ds,ax
	?debug	C F823405761697454687265616440302462637472+
	?debug	C 24716E3130546573745468726561647431
	?debug	C E321000400161E00
	?debug	C E60274321A0A0E00000274311A0A0A0000047468+
	?debug	C 69732102060000
	?debug	B
	mov	ax,word ptr [bp+6]
	or	ax,word ptr [bp+8]
	jne	short @10@86
	mov	ax,16
	push	ax
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp+8],dx
	mov	word ptr [bp+6],ax
	or	ax,dx
	je	short @10@114
@10@86:
	mov	ax,2
	push	ax
	xor	ax,ax
	mov	dx,4096
	push	ax
	push	dx
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @Thread@0$bctr$qului
	add	sp,10
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+2],seg @@WaitThread@0
	mov	word ptr es:[bx],offset @@WaitThread@0
	?debug	L 73
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp+12]
	mov	dx,word ptr [bp+10]
	mov	word ptr es:[bx+10],ax
	mov	word ptr es:[bx+8],dx
	?debug	L 74
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp+16]
	mov	dx,word ptr [bp+14]
	mov	word ptr es:[bx+14],ax
	mov	word ptr es:[bx+12],dx
@10@114:
	?debug	L 75
	mov	dx,word ptr [bp+8]
	mov	ax,word ptr [bp+6]
	jmp	short @10@142
@10@142:
	pop	ds
	pop	bp
	ret	
	?debug	C E6047468697321020600000274311A0A0A000002+
	?debug	C 74321A0A0E0000
	?debug	E
	?debug	E
@@WaitThread@0$bctr$qn10TestThreadt1	endp
@WaitThread@0$bctr$qn10TestThreadt1	ends
MAIN_TEXT	ends
MAIN_TEXT	segment byte public 'CODE'
@WaitThread@0$bdtr$qv	segment	virtual
	?debug	C E801
	?debug	L 77
	assume	cs:@WaitThread@0$bdtr$qv
@@WaitThread@0$bdtr$qv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	si
	push	ds
	mov	ax,MAIN_DATA
	mov	ds,ax
	?debug	C F815405761697454687265616440302462647472+
	?debug	C 247176
	?debug	C E60664656C657465040A0A000004746869732102+
	?debug	C 060000
	mov	si,word ptr [bp+10]
	?debug	B
	?debug	L 78
	mov	ax,word ptr [bp+6]
	or	ax,word ptr [bp+8]
	je	short @11@142
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+2],seg @@WaitThread@0
	mov	word ptr es:[bx],offset @@WaitThread@0
	?debug	L 79
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @Thread@0waitToComplete$qv
	pop	cx
	pop	cx
	xor	ax,ax
	push	ax
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @Thread@0$bdtr$qv
	add	sp,6
	test	si,1
	je	short @11@142
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @$bdele$qnv
	pop	cx
	pop	cx
@11@142:
	?debug	L 80
	pop	ds
	pop	si
	pop	bp
	ret	
	?debug	C E6047468697321020600000664656C657465040C+
	?debug	C 0600
	?debug	E
	?debug	E
@@WaitThread@0$bdtr$qv	endp
@WaitThread@0$bdtr$qv	ends
MAIN_TEXT	ends
MAIN_TEXT	segment byte public 'CODE'
@UserThread@0$bctr$qv	segment	virtual
	?debug	C E801
	?debug	L 116
	assume	cs:@UserThread@0$bctr$qv
@@UserThread@0$bctr$qv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,MAIN_DATA
	mov	ds,ax
	?debug	C F815405573657254687265616440302462637472+
	?debug	C 247176
	?debug	C E604746869731F02060000
	?debug	B
	mov	ax,word ptr [bp+6]
	or	ax,word ptr [bp+8]
	jne	short @12@86
	mov	ax,8
	push	ax
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp+8],dx
	mov	word ptr [bp+6],ax
	or	ax,dx
	je	short @12@114
@12@86:
	mov	ax,2
	push	ax
	xor	ax,ax
	mov	dx,4096
	push	ax
	push	dx
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @Thread@0$bctr$qului
	add	sp,10
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+2],seg @@UserThread@0
	mov	word ptr es:[bx],offset @@UserThread@0
@12@114:
	mov	dx,word ptr [bp+8]
	mov	ax,word ptr [bp+6]
	jmp	short @12@142
@12@142:
	pop	ds
	pop	bp
	ret	
	?debug	C E604746869731F02060000
	?debug	E
	?debug	E
@@UserThread@0$bctr$qv	endp
@UserThread@0$bctr$qv	ends
MAIN_TEXT	ends
MAIN_TEXT	segment byte public 'CODE'
@WaitThread@0	segment	virtual
@@WaitThread@0	label	byte
	dd	@@WaitThread@0$bdtr$qv
	dd	@@WaitThread@0run$qv
@WaitThread@0	ends
MAIN_TEXT	ends
MAIN_TEXT	segment byte public 'CODE'
@TestThread@0	segment	virtual
@@TestThread@0	label	byte
	dd	@@TestThread@0$bdtr$qv
	dd	@TestThread@0run$qv
@TestThread@0	ends
MAIN_TEXT	ends
MAIN_TEXT	segment byte public 'CODE'
@UserThread@0	segment	virtual
@@UserThread@0	label	byte
	dd	@UserThread@0$bdtr$qv
	dd	@UserThread@0run$qv
@UserThread@0	ends
MAIN_TEXT	ends
MAIN_TEXT	segment byte public 'CODE'
@WaitThread@0run$qv	segment	virtual
	?debug	C E801
	?debug	L 84
	assume	cs:@WaitThread@0run$qv
@@WaitThread@0run$qv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,MAIN_DATA
	mov	ds,ax
	?debug	C F8134057616974546872656164403072756E2471+
	?debug	C 76
	?debug	C E604746869732102060000
	?debug	B
	?debug	L 86
	push	ds
	mov	ax,offset s@+140
	push	ax
	call	far ptr @syncPrintf$qnxzce
	pop	cx
	pop	cx
	?debug	L 87
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+10]
	push	word ptr es:[bx+8]
	call	far ptr @Thread@0waitToComplete$qv
	pop	cx
	pop	cx
	?debug	L 88
	push	ds
	mov	ax,offset s@+159
	push	ax
	call	far ptr @syncPrintf$qnxzce
	pop	cx
	pop	cx
	?debug	L 89
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+14]
	push	word ptr es:[bx+12]
	call	far ptr @Thread@0waitToComplete$qv
	pop	cx
	pop	cx
	?debug	L 90
	push	ds
	mov	ax,offset s@+178
	push	ax
	call	far ptr @syncPrintf$qnxzce
	pop	cx
	pop	cx
	?debug	L 91
	pop	ds
	pop	bp
	ret	
	?debug	C E604746869732102060000
	?debug	E
	?debug	E
@@WaitThread@0run$qv	endp
	?debug	C E9
	?debug	C FA00000000
@WaitThread@0run$qv	ends
MAIN_TEXT	ends
MAIN_DATA	segment word public 'FAR_DATA'
s@	label	byte
	db	'Thread %d: loop1 starts'
	db	10
	db	0
	db	'Thread %d: loop1 ends, dispatch'
	db	10
	db	0
	db	'Thread %d: loop2 starts'
	db	10
	db	0
	db	'Thread %d: loop2 ends'
	db	10
	db	0
	db	'User main starts'
	db	10
	db	0
	db	'User main ends'
	db	10
	db	0
	db	'Starting tests...'
	db	10
	db	0
	db	'Test 1 completed!'
	db	10
	db	0
	db	'Test 2 completed!'
	db	10
	db	0
MAIN_DATA	ends
MAIN_TEXT	segment byte public 'CODE'
MAIN_TEXT	ends
	?debug	C E3220654687265616408002E04
	?debug	C ED00040000010E00
	?debug	C E3230000002D0104012200114054687265616440+
	?debug	C 307374617274247176
	?debug	C E3250000002D01040122001A4054687265616440+
	?debug	C 3077616974546F436F6D706C657465247176
	?debug	C E3270000002D0104012200114054687265616440+
	?debug	C 302462647472247176
	?debug	C E3290000002D0404012200114054687265616440+
	?debug	C 306765744964247176
	?debug	C E32B0000002D0404012200184054687265616440+
	?debug	C 3067657452756E6E696E674964247176
	?debug	C E32D000400162200
	?debug	C E32E0000002D2D04012200194054687265616440+
	?debug	C 3067657454687265616442794964247169
	?debug	C E3300000002D0104012200134054687265616440+
	?debug	C 307369676E616C24717569
	?debug	C E3320000002D0104012200214054687265616440+
	?debug	C 30726567697374657248616E646C657224717569+
	?debug	C 6E71762476
	?debug	C E3340000002D0104012200224054687265616440+
	?debug	C 30756E7265676973746572416C6C48616E646C65+
	?debug	C 727324717569
	?debug	C E3360000002D0104012200184054687265616440+
	?debug	C 3073776170247175696E717624767432
	?debug	C E3380000002D0104012200184054687265616440+
	?debug	C 30626C6F636B5369676E616C24717569
	?debug	C E33A0000002D0104012200204054687265616440+
	?debug	C 30626C6F636B5369676E616C476C6F62616C6C79+
	?debug	C 24717569
	?debug	C E33C0000002D01040122001A4054687265616440+
	?debug	C 30756E626C6F636B5369676E616C24717569
	?debug	C E33E0000002D0104012200224054687265616440+
	?debug	C 30756E626C6F636B5369676E616C476C6F62616C+
	?debug	C 6C7924717569
	?debug	C E3400000002D2D04012200144054687265616440+
	?debug	C 3024626374722471756C7569
	?debug	C E3420000002D0104092202
	?debug	C E34503504342A8002E05
	?debug	C ED00050000140E00
	?debug	C E346000400164500
	?debug	C E347000400160A00
	?debug	C E34806537461746573020022000080FF7F3D
	?debug	C E34B0E40254C69737424746E717624762506002E+
	?debug	C 06
	?debug	C ED00060000410E00
	?debug	C E34D00000023010400
	?debug	C E34C000400164D00
	?debug	C E34E1340254C69737424746E7176247625404E6F+
	?debug	C 646508002E07
	?debug	C ED000700004F0F00
	?debug	C E34F000400164E00
	?debug	C E3500000002D4F04094E00
	?debug	C E3520000002D0104094B00
	?debug	C E3540000002D0104094B00
	?debug	C E3560000002D0104094B00
	?debug	C E3580000002D4C04094B00
	?debug	C E35A0000002D0104094B00
	?debug	C E35C0000002D0104094B00
	?debug	C E35E0000002D0104094B00
	?debug	C E3600000002D4F04094B00
	?debug	C E362000400164B00
	?debug	C E3630000002D6204094B00
	?debug	C E34A0060001A4B
	?debug	C E3650B40254C697374247475692506002E08
	?debug	C ED00080000530E00
	?debug	C E3661040254C6973742474756925404E6F646506+
	?debug	C 002E09
	?debug	C ED00090000610F00
	?debug	C E367000400166600
	?debug	C E3680000002D6704096600
	?debug	C E36A0000002D0104096500
	?debug	C E36C0000002D0104096500
	?debug	C E36E0000002D0104096500
	?debug	C E3700000002D0A04096500
	?debug	C E3720000002D0104096500
	?debug	C E3740000002D0104096500
	?debug	C E3760000002D0104096500
	?debug	C E3780000002D6704096500
	?debug	C E37A000400166500
	?debug	C E37B0000002D7A04096500
	?debug	C E37D0020001A04
	?debug	C E37E0020001A04
	?debug	C E37F0E40254C69737424746E335043422506002E+
	?debug	C 0A
	?debug	C ED000A0000650E00
	?debug	C E380801340254C69737424746E3350434225404E+
	?debug	C 6F646508002E0B
	?debug	C ED000B0000730F00
	?debug	C E3808100040016808000
	?debug	C E380820000002D80810409808000
	?debug	C E380840000002D0104097F00
	?debug	C E380860000002D0104097F00
	?debug	C E380880000002D0104097F00
	?debug	C E3808A0000002D4404097F00
	?debug	C E3808C0000002D0104097F00
	?debug	C E3808E0000002D0104097F00
	?debug	C E380900000002D0104097F00
	?debug	C E380920000002D808104097F00
	?debug	C E38094000400167F00
	?debug	C E380950000002D809404097F00
	?debug	C E380970000002D44040145001140504342403024+
	?debug	C 626374722471756C7569
	?debug	C E380990000002D44040145001940504342403024+
	?debug	C 6263747224716E36546872656164756C7569
	?debug	C E3809B0000002D01040145001740504342403077+
	?debug	C 72617070657224716E36546872656164
	?debug	C E3809D0000002D01040145001840504342403061+
	?debug	C 6464546F416C6C50434224716E33504342
	?debug	C E3809F0000002D01040145001D40504342403064+
	?debug	C 656C65746546726F6D416C6C50434224716E3350+
	?debug	C 4342
	?debug	C E380A10000002D01040145001D40504342403061+
	?debug	C 6464546F426C6F636B65644C69737424716E3350+
	?debug	C 4342
	?debug	C E380A30000002D01040145001440504342403075+
	?debug	C 6E626C6F636B416C6C24777176
	?debug	C E380A50000002D01040145000E40504342403024+
	?debug	C 62647472247176
	?debug	C E380A70000002D01040145001140504342403073+
	?debug	C 69676E616C2477717569
	?debug	C E380A90000002D01040145001E40504342403072+
	?debug	C 6567697374657248616E646C6572247175696E71+
	?debug	C 762476
	?debug	C E380AB0000002D01040145001F40504342403075+
	?debug	C 6E7265676973746572416C6C48616E646C657273+
	?debug	C 24717569
	?debug	C E380AD0000002D01040145001540504342403073+
	?debug	C 776170247175696E717624767432
	?debug	C E380AF0000002D01040145001540504342403062+
	?debug	C 6C6F636B5369676E616C24717569
	?debug	C E380B10000002D01040145001D40504342403062+
	?debug	C 6C6F636B5369676E616C476C6F62616C6C792471+
	?debug	C 7569
	?debug	C E380B30000002D01040145001740504342403075+
	?debug	C 6E626C6F636B5369676E616C24717569
	?debug	C E380B50000002D01040145001F40504342403075+
	?debug	C 6E626C6F636B5369676E616C476C6F62616C6C79+
	?debug	C 24717569
	?debug	C E380B70000002D01040145001340504342403064+
	?debug	C 6F5369676E616C7324777176
	?debug	C E344000400164500
	?debug	C E3200A5573657254687265616408002E03
	?debug	C ED00030000770E010400
	?debug	C E380B90000002D1F040320001540557365725468+
	?debug	C 7265616440302462637472247176
	?debug	C E380BB0000002D01040120021340557365725468+
	?debug	C 72656164403072756E247176
	?debug	C E380BD0000002D01040120001540557365725468+
	?debug	C 7265616440302462647472247176
	?debug	C E31E0A5761697454687265616410002E02
	?debug	C ED000200007B0E010400
	?debug	C E380BF0000002D2104031E002340576169745468+
	?debug	C 726561644030246263747224716E313054657374+
	?debug	C 5468726561647431
	?debug	C E380C10000002D0104031E001540576169745468+
	?debug	C 7265616440302462647472247176
	?debug	C E380C30000002D0104031E021340576169745468+
	?debug	C 72656164403072756E247176
	?debug	C E31B0A5465737454687265616408002E01
	?debug	C ED0001000080820E010400
	?debug	C E380C50000002D1A04031B001540546573745468+
	?debug	C 7265616440302462637472247176
	?debug	C E380C70000002D0104031B001540546573745468+
	?debug	C 7265616440302462647472247176
	?debug	C E380C90000002D0104011B021340546573745468+
	?debug	C 72656164403072756E247176
	extrn	__setargv__:far
	public	_main
	public	@UserThread@0$bdtr$qv
	public	@UserThread@0run$qv
	public	_global_argv
	public	_global_argc
	public	_flag
	public	_res
	public	@userMain$qinnzc
	public	@tick$qv
	public	@TestThread@0run$qv
	public	@syncPrintf$qnxzce
	extrn	@PCB@0$bdtr$qv:far
	extrn	@PCB@0pomlist:word
	extrn	@PCB@0dummyPCB:dword
	extrn	@PCB@0initial:dword
	extrn	@PCB@0allPCB:word
_atoi	equ	atoi
_abs	equ	abs
_pokeb	equ	pokeb
_poke	equ	poke
_peekb	equ	peekb
_peek	equ	peek
	extrn	_vprintf:far
	extrn	@dispatch$qv:far
	extrn	@Thread@0$bctr$qului:far
	extrn	@Thread@0getId$qv:far
	extrn	@Thread@0$bdtr$qv:far
	extrn	@Thread@0waitToComplete$qv:far
	extrn	@Thread@0start$qv:far
	extrn	@Timer@0restore$qv:far
	extrn	@Timer@0init$qv:far
	extrn	@Timer@0globalLockCnt:word
	extrn	@Timer@0zahtevana_promena_konteksta:word
	extrn	@$bdele$qnv:far
	extrn	@$bnew$qui:far
_s@	equ	s@
	?debug	C EA050D
	?debug	C E380CB00000023040500
	?debug	C EB0B5F5F736574617267765F5F80CB00
	?debug	C E380CC00000023040400
	?debug	C EC055F6D61696E80CC1800
	?debug	C EC0C5F676C6F62616C5F617267761C0000
	?debug	C EC0C5F676C6F62616C5F61726763040000
	?debug	C EC055F666C6167040000
	?debug	C EC045F726573040000
	?debug	C E380CD00000023040400
	?debug	C EC1040757365724D61696E2471696E6E7A6380CD+
	?debug	C 1800
	?debug	C E380CE00000023010400
	?debug	C EC08407469636B24717680CE1800
	?debug	C E380CF00000023040401
	?debug	C EC124073796E635072696E746624716E787A6365+
	?debug	C 80CF1800
	?debug	C E380D009746578745F696E666F0B001E8086
	?debug	C E380D100000023010400
	?debug	C E380D200000023040400
	?debug	C E380D300000023040400
	?debug	C E380D400000023040400
	?debug	C E380D803696F732A002E0F
	?debug	C ED000F000080920E00
	?debug	C E380D908696F5F7374617465020022000080FF7F+
	?debug	C 80D0
	?debug	C E380DB096F70656E5F6D6F6465020022000080FF+
	?debug	C 7F80D5
	?debug	C E380DD087365656B5F646972020022000080FF7F+
	?debug	C 80DD
	?debug	C E380DF0004001680D800
	?debug	C E380E00000002D80DF040180D8001840696F7340+
	?debug	C 30246263747224716E3973747265616D627566
	?debug	C E380E20000002D01040180D8000E40696F734030+
	?debug	C 2462647472247176
	?debug	C E380E40000002D06040980D800
	?debug	C E380E60000002D06040180D8000E40696F734030+
	?debug	C 666C61677324716C
	?debug	C E380E80000002D06040180D8000E40696F734030+
	?debug	C 7365746624716C6C
	?debug	C E380EA0000002D06040180D8000D40696F734030+
	?debug	C 7365746624716C
	?debug	C E380EC0000002D06040180D8000F40696F734030+
	?debug	C 756E7365746624716C
	?debug	C E380EE0000002D04040980D800
	?debug	C E380F00000002D04040980D800
	?debug	C E380F20000002D02040980D800
	?debug	C E380F40000002D02040980D800
	?debug	C E380F60000002D04040980D800
	?debug	C E380F80000002D04040980D800
	?debug	C E380FB076F73747265616D30002E10
	?debug	C ED0010020080E00E010F80
	?debug	C E380FC0000002D80FA040180FB001C406F737472+
	?debug	C 65616D4030246263747224716E3973747265616D+
	?debug	C 627566
	?debug	C E380FE0000002D01040180FB0012406F73747265+
	?debug	C 616D40302462647472247176
	?debug	C E381000000002D80FA040180FB0012406F737472+
	?debug	C 65616D40302462637472247169
	?debug	C E381020000002D80FA040180FB0015406F737472+
	?debug	C 65616D403024626374722471696E7A63
	?debug	C E381040000002D04040980FB00
	?debug	C E381060000002D01040980FB00
	?debug	C E381080004003580FB00
	?debug	C E381090000002D8108040180FB0012406F737472+
	?debug	C 65616D4030666C757368247176
	?debug	C E3810B0000002D8108040180FB0012406F737472+
	?debug	C 65616D40307365656B7024716C
	?debug	C E3810D0000002D8108040180FB001B406F737472+
	?debug	C 65616D40307365656B7024716C387365656B5F64+
	?debug	C 6972
	?debug	C E3810F0000002D06040180FB0012406F73747265+
	?debug	C 616D403074656C6C70247176
	?debug	C E381110000002D8108040980FB00
	?debug	C E381130000002D8108040180FB0016406F737472+
	?debug	C 65616D4030777269746524716E787A6369
	?debug	C E381150000002D8108040980FB00
	?debug	C E381170000002D8108040580FB0013406F737472+
	?debug	C 65616D403024626C736824717A63
	?debug	C E381190000002D8108040D80FB00
	?debug	C E3811B0000002D8108040D80FB00
	?debug	C E3811D0000002D8108040D80FB00
	?debug	C E3811F0000002D8108040D80FB00
	?debug	C E381210000002D8108040D80FB00
	?debug	C E381230000002D8108040580FB0012406F737472+
	?debug	C 65616D403024626C736824716C
	?debug	C E381250000002D8108040580FB0013406F737472+
	?debug	C 65616D403024626C73682471756C
	?debug	C E381270000002D8108040D80FB00
	?debug	C E381290000002D8108040D80FB00
	?debug	C E3812B0000002D8108040580FB0012406F737472+
	?debug	C 65616D403024626C7368247167
	?debug	C E3812D0000002D8108040D80FB00
	?debug	C E3812F0000002D8108040D80FB00
	?debug	C E381310000002D8108040580FB0013406F737472+
	?debug	C 65616D403024626C736824716E76
	?debug	C E381330000002D8108040580FB001C406F737472+
	?debug	C 65616D403024626C736824716E3973747265616D+
	?debug	C 627566
	?debug	C E381350000002D8108040D80FB00
	?debug	C E381370000002D8108040580FB001E406F737472+
	?debug	C 65616D403024626C736824716E716D33696F7324+
	?debug	C 6D33696F73
	?debug	C E381390000002D04040180FB0014406F73747265+
	?debug	C 616D4030646F5F6F706678247176
	?debug	C E3813B0000002D01040180FB0014406F73747265+
	?debug	C 616D4030646F5F6F736678247176
	?debug	C E3813D0000002D80FA040180FB0012406F737472+
	?debug	C 65616D40302462637472247176
	?debug	C E3813F0000002D01040180FB0018406F73747265+
	?debug	C 616D40306F757473747224716E787A637431
	?debug	C E380FA0004001680FB00
	?debug	C E381410000002D80FA040180D8001440696F7340+
	?debug	C 3074696524716E376F73747265616D
	?debug	C E381430000002D80FA040980D800
	?debug	C E381450000002D04040980D800
	?debug	C E381470000002D04040980D800
	?debug	C E381490000002D04040980D800
	?debug	C E3814B0000002D04040980D800
	?debug	C E3814D0000002D04040980D800
	?debug	C E3814F0000002D01040180D8000E40696F734030+
	?debug	C 636C656172247169
	?debug	C E381510000002D19040980D800
	?debug	C E381530000002D04040D80D800
	?debug	C E381560973747265616D62756628002E11
	?debug	C ED0011000081030E00
	?debug	C E381570000002D81550401815600144073747265+
	?debug	C 616D62756640302462637472247176
	?debug	C E381590000002D81550401815600174073747265+
	?debug	C 616D6275664030246263747224716E7A6369
	?debug	C E3815B0000002D01040181560014407374726561+
	?debug	C 6D62756640302462647472247176
	?debug	C E3815D0000002D81550401815602184073747265+
	?debug	C 616D627566403073657462756624716E7A6369
	?debug	C E3815F0000002D81550409815600
	?debug	C E381610000002D81550401815600194073747265+
	?debug	C 616D627566403073657462756624716E7A636969
	?debug	C E381630000002D040409815600
	?debug	C E381650000002D040409815600
	?debug	C E381670000002D040409815600
	?debug	C E381690000002D010409815600
	?debug	C E3816B0000002D04040181560017407374726561+
	?debug	C 6D6275664030736765746E24716E7A6369
	?debug	C E3816D0000002D0404018156041A407374726561+
	?debug	C 6D6275664030646F5F736765746E24716E7A6369
	?debug	C E3816F0000002D04040181560618407374726561+
	?debug	C 6D6275664030756E646572666C6F77247176
	?debug	C E381710000002D040409815600
	?debug	C E381730000002D04040181560818407374726561+
	?debug	C 6D6275664030706261636B6661696C247169
	?debug	C E381750000002D040409815600
	?debug	C E381770000002D040409815600
	?debug	C E381790000002D04040181560018407374726561+
	?debug	C 6D6275664030737075746E24716E787A6369
	?debug	C E3817B0000002D04040181560A1B407374726561+
	?debug	C 6D6275664030646F5F737075746E24716E787A63+
	?debug	C 69
	?debug	C E3817D0000002D04040181560C17407374726561+
	?debug	C 6D62756640306F766572666C6F77247169
	?debug	C E3817F0000002D040409815600
	?debug	C E381810000002D06040181560E20407374726561+
	?debug	C 6D62756640307365656B6F666624716C38736565+
	?debug	C 6B5F64697269
	?debug	C E381830000002D06040181561017407374726561+
	?debug	C 6D62756640307365656B706F7324716C69
	?debug	C E381850000002D04040181561213407374726561+
	?debug	C 6D627566403073796E63247176
	?debug	C E381870000002D01040181560012407374726561+
	?debug	C 6D6275664030646270247176
	?debug	C E381890000002D1D0409815600
	?debug	C E3818B0000002D1D0409815600
	?debug	C E3818D0000002D040409815600
	?debug	C E3818F0000002D1D0409815600
	?debug	C E381910000002D1D0409815600
	?debug	C E381930000002D1D0409815600
	?debug	C E381950000002D1D0409815600
	?debug	C E381970000002D1D0409815600
	?debug	C E381990000002D1D0409815600
	?debug	C E3819B0000002D01040181560017407374726561+
	?debug	C 6D62756640307365747024716E7A637431
	?debug	C E3819D0000002D01040181560019407374726561+
	?debug	C 6D62756640307365746724716E7A6374317431
	?debug	C E3819F0000002D010409815600
	?debug	C E381A10000002D010409815600
	?debug	C E381A30000002D01040181560018407374726561+
	?debug	C 6D62756640307365746224716E7A63743169
	?debug	C E381A50000002D010409815600
	?debug	C E381A70000002D040409815600
	?debug	C E381A90000002D040409815600
	?debug	C E381AB0000002D04040181561419407374726561+
	?debug	C 6D6275664030646F616C6C6F63617465247176
	?debug	C E381AD0000002D04040181560018407374726561+
	?debug	C 6D6275664030646F5F736E65787463247176
	?debug	C E381AF0000002D815504018156001E4073747265+
	?debug	C 616D6275664030246263747224716D3973747265+
	?debug	C 616D627566
	?debug	C E381B10000002D0104058156001E407374726561+
	?debug	C 6D6275664030246261736724716D397374726561+
	?debug	C 6D627566
	?debug	C E3815500040016815600
	?debug	C E381B30000002D8155040980D800
	?debug	C E381B50000002D06040180D8001140696F734030+
	?debug	C 626974616C6C6F63247176
	?debug	C E381B70000002D04040180D8000F40696F734030+
	?debug	C 78616C6C6F63247176
	?debug	C E381B9000400350600
	?debug	C E381BA0000002D81B9040180D8000E40696F7340+
	?debug	C 3069776F7264247169
	?debug	C E381BC000400351900
	?debug	C E381BD0000002D81BC040180D8000E40696F7340+
	?debug	C 3070776F7264247169
	?debug	C E381BF0000002D01040180D8001840696F734030+
	?debug	C 73796E635F776974685F737464696F247176
	?debug	C E381C10000002D04040180D8000D40696F734030+
	?debug	C 736B6970247169
	?debug	C E381C30000002D80DF040180D8000E40696F7340+
	?debug	C 302462637472247176
	?debug	C E381C50000002D01040180D8001740696F734030+
	?debug	C 696E697424716E3973747265616D627566
	?debug	C E381C70000002D01040180D8001140696F734030+
	?debug	C 7365747374617465247169
	?debug	C E381CA00000023010400
	?debug	C E381C90004001681CA00
	?debug	C E381CB000400160100
	?debug	C E381CC0000002D01040180D8001140696F734030+
	?debug	C 7573657273697A65247169
	?debug	C E381CE0000002D80DF040180D8001240696F7340+
	?debug	C 30246263747224716D33696F73
	?debug	C E381D00000002D01040580D8001240696F734030+
	?debug	C 246261736724716D33696F73
	?debug	C E380D7076973747265616D32002E0E
	?debug	C ED000E0200813D0E010F80
	?debug	C E381D20004001680D700
	?debug	C E381D30000002D81D2040180D7001C4069737472+
	?debug	C 65616D4030246263747224716E3973747265616D+
	?debug	C 627566
	?debug	C E381D50000002D01040180D70012406973747265+
	?debug	C 616D40302462647472247176
	?debug	C E381D70000002D81D2040180D700264069737472+
	?debug	C 65616D4030246263747224716E3973747265616D+
	?debug	C 627566696E376F73747265616D
	?debug	C E381D90000002D81D2040180D700164069737472+
	?debug	C 65616D403024626374722471696E7A6369
	?debug	C E381DB0000002D81D2040180D7001C4069737472+
	?debug	C 65616D40302462637472247169696E376F737472+
	?debug	C 65616D
	?debug	C E381DD0000002D04040180D70011406973747265+
	?debug	C 616D403069706678247169
	?debug	C E381DF0000002D04040980D700
	?debug	C E381E10000002D04040980D700
	?debug	C E381E30000002D01040980D700
	?debug	C E381E50004003580D700
	?debug	C E381E60000002D81E5040180D700124069737472+
	?debug	C 65616D40307365656B6724716C
	?debug	C E381E80000002D81E5040180D7001B4069737472+
	?debug	C 65616D40307365656B6724716C387365656B5F64+
	?debug	C 6972
	?debug	C E381EA0000002D06040180D70012406973747265+
	?debug	C 616D403074656C6C67247176
	?debug	C E381EC0000002D04040980D700
	?debug	C E381EE0000002D81E5040180D700154069737472+
	?debug	C 65616D403067657424716E7A63697A63
	?debug	C E381F00000002D81E5040980D700
	?debug	C E381F20000002D81E5040180D700144069737472+
	?debug	C 65616D40307265616424716E7A6369
	?debug	C E381F40000002D81E5040980D700
	?debug	C E381F60000002D81E5040180D700194069737472+
	?debug	C 65616D40306765746C696E6524716E7A63697A63
	?debug	C E381F80000002D81E5040980D700
	?debug	C E381FA0000002D81E5040180D7001C4069737472+
	?debug	C 65616D403067657424716D3973747265616D6275+
	?debug	C 667A63
	?debug	C E381FC0000002D81E5040180D700124069737472+
	?debug	C 65616D403067657424716D7563
	?debug	C E381FE0000002D81E5040180D700124069737472+
	?debug	C 65616D403067657424716D7A63
	?debug	C E382000000002D04040180D70010406973747265+
	?debug	C 616D4030676574247176
	?debug	C E382020000002D04040980D700
	?debug	C E382040000002D04040980D700
	?debug	C E382060000002D81E5040180D700154069737472+
	?debug	C 65616D40307075746261636B24717A63
	?debug	C E382080000002D81E5040180D700144069737472+
	?debug	C 65616D403069676E6F726524716969
	?debug	C E3820A0000002D81E5040D80D700
	?debug	C E3820C0000002D81E5040580D7001E4069737472+
	?debug	C 65616D4030246272736824716E716D33696F7324+
	?debug	C 6D33696F73
	?debug	C E3820E0000002D81E5040580D700144069737472+
	?debug	C 65616D4030246272736824716E7A63
	?debug	C E382100000002D81E5040D80D700
	?debug	C E382120000002D81E5040580D700144069737472+
	?debug	C 65616D4030246272736824716D7563
	?debug	C E382140000002D81E5040580D700144069737472+
	?debug	C 65616D4030246272736824716D7A63
	?debug	C E382160000002D81E5040580D700134069737472+
	?debug	C 65616D4030246272736824716D73
	?debug	C E382180000002D81E5040580D700134069737472+
	?debug	C 65616D4030246272736824716D69
	?debug	C E3821A0000002D81E5040580D700134069737472+
	?debug	C 65616D4030246272736824716D6C
	?debug	C E3821C0000002D81E5040580D700144069737472+
	?debug	C 65616D4030246272736824716D7573
	?debug	C E3821E0000002D81E5040580D700144069737472+
	?debug	C 65616D4030246272736824716D7569
	?debug	C E382200000002D81E5040580D700144069737472+
	?debug	C 65616D4030246272736824716D756C
	?debug	C E382220000002D81E5040580D700134069737472+
	?debug	C 65616D4030246272736824716D66
	?debug	C E382240000002D81E5040580D700134069737472+
	?debug	C 65616D4030246272736824716D64
	?debug	C E382260000002D81E5040580D700134069737472+
	?debug	C 65616D4030246272736824716D67
	?debug	C E382280000002D81E5040580D7001C4069737472+
	?debug	C 65616D4030246272736824716E3973747265616D+
	?debug	C 627566
	?debug	C E3822A0000002D81D2040180D700124069737472+
	?debug	C 65616D40302462637472247176
	?debug	C E3822C0000002D01040180D70015406973747265+
	?debug	C 616D40306561747768697465247176
	?debug	C E3822E0000002D02040180D70013406973747265+
	?debug	C 616D4030646F5F676574247176
	?debug	C E380D608696F73747265616D38002E0D
	?debug	C ED000D0200816E0E020E001000
	?debug	C E382300004001680D600
	?debug	C E382310000002D8230040180D6001D40696F7374+
	?debug	C 7265616D4030246263747224716E397374726561+
	?debug	C 6D627566
	?debug	C E382330000002D01040180D6001340696F737472+
	?debug	C 65616D40302462647472247176
	?debug	C E382350000002D8230040180D6001340696F7374+
	?debug	C 7265616D40302462637472247176
	?debug	C E380D513696F73747265616D5F77697468617373+
	?debug	C 69676E38002E0C
	?debug	C ED000C020081720E010D00
	?debug	C E382370004001680D500
	?debug	C E382380000002D8237040180D5001E40696F7374+
	?debug	C 7265616D5F7769746861737369676E4030246263+
	?debug	C 7472247176
	?debug	C E3823A0000002D01040180D5001E40696F737472+
	?debug	C 65616D5F7769746861737369676E403024626474+
	?debug	C 72247176
	?debug	C E3823C0004003580D500
	?debug	C E3823D0000002D823C040580D5002240696F7374+
	?debug	C 7265616D5F7769746861737369676E4030246261+
	?debug	C 736724716D33696F73
	?debug	C E3823F0000002D823C040580D5002840696F7374+
	?debug	C 7265616D5F7769746861737369676E4030246261+
	?debug	C 736724716E3973747265616D627566
	?debug	C E38241126F73747265616D5F7769746861737369+
	?debug	C 676E30002E12
	?debug	C ED0012020081770E011000
	?debug	C E3824200040016824100
	?debug	C E382430000002D824204018241001D406F737472+
	?debug	C 65616D5F7769746861737369676E403024626374+
	?debug	C 72247176
	?debug	C E382450000002D0104018241001D406F73747265+
	?debug	C 616D5F7769746861737369676E40302462647472+
	?debug	C 247176
	?debug	C E3824700040035824100
	?debug	C E382480000002D8247040582410025406F737472+
	?debug	C 65616D5F7769746861737369676E403024626173+
	?debug	C 6724716D376F73747265616D
	?debug	C E3824A0000002D8247040582410027406F737472+
	?debug	C 65616D5F7769746861737369676E403024626173+
	?debug	C 6724716E3973747265616D627566
	?debug	C E3824C126973747265616D5F7769746861737369+
	?debug	C 676E32002E13
	?debug	C ED00130200817C0E010E00
	?debug	C E3824D00040016824C00
	?debug	C E3824E0000002D824D0401824C001D4069737472+
	?debug	C 65616D5F7769746861737369676E403024626374+
	?debug	C 72247176
	?debug	C E382500000002D010401824C001D406973747265+
	?debug	C 616D5F7769746861737369676E40302462647472+
	?debug	C 247176
	?debug	C E3825200040035824C00
	?debug	C E382530000002D82520405824C00254069737472+
	?debug	C 65616D5F7769746861737369676E403024626173+
	?debug	C 6724716D376973747265616D
	?debug	C E382550000002D82520405824C00274069737472+
	?debug	C 65616D5F7769746861737369676E403024626173+
	?debug	C 6724716E3973747265616D627566
	?debug	C E3825700000023010400
	?debug	C E3825800000023010400
	?debug	C E3825900000023020400
	?debug	C E3825A00000023040400
	?debug	C E3825B0666696E645F742B001E8181
	?debug	C E3825C0015001A02
	?debug	C E3825D000D001A02
	?debug	C E3825E056666626C6B2B001E8188
	?debug	C E3825F0015001A02
	?debug	C E38260000D001A02
	?debug	C E38261075245475041434B14001E818F
	?debug	C E3826205535245475308001E819A
	?debug	C E38263045245475310001F819F
	?debug	C E3826408574F52445245475310001E81A2
	?debug	C E3826508425954455245475308001E81AB
	?debug	C E3826609646F73646174655F7405001E81B4
	?debug	C E38267046461746504001E81B9
	?debug	C E3826809646F7374696D655F7404001E81BD
	?debug	C E382690474696D6504001E81C2
	?debug	C E3826A0664657668647212001E81C7
	?debug	C E3826B0008001A02
	?debug	C E3826C07666174696E666F06001E81CD
	?debug	C E3826D0A6469736B667265655F7408001E81D2
	?debug	C E3826E05646672656508001E81D7
	?debug	C E3826F08444F534552524F5205001E81DC
	?debug	C E3827007434F554E54525922001E81E1
	?debug	C E382710005001A02
	?debug	C E382720002001A02
	?debug	C E382730002001A02
	?debug	C E382740002001A02
	?debug	C E382750002001A02
	?debug	C E382760002001A02
	?debug	C E38277000A001A02
	?debug	C E3827804786663622C001E81EE
	?debug	C E382790005001A02
	?debug	C E3827A0366636225001E81F3
	?debug	C E3827B0008001A02
	?debug	C E3827C0003001A02
	?debug	C E3827D000A001A02
	?debug	C E3827E054576656E7404002E14
	?debug	C ED0014000081FE0E00
	?debug	C E3827F00040016827E00
	?debug	C E382800000002D827F0401827E0011404576656E+
	?debug	C 744030246263747224717563
	?debug	C E382820000002D010401827E0010404576656E74+
	?debug	C 40302462647472247176
	?debug	C E382840000002D010401827E000F404576656E74+
	?debug	C 403077616974247176
	?debug	C E382860000002D010401827E0011404576656E74+
	?debug	C 403073696E67616C247176
	?debug	C E38288000400160100
	?debug	C E3828908495654456E7472790D002E15
	?debug	C ED0015000082040E00
	?debug	C E3828B00000023010701
	?debug	C E3828A00040016828B00
	?debug	C E3828D00040016828900
	?debug	C E3828C0000041A828D
	?debug	C E3828E0000002D828D04018289001A4049565445+
	?debug	C 6E74727940302462637472247175636E71766524+
	?debug	C 76
	?debug	C E382900000002D0104018289001340495654456E+
	?debug	C 74727940302462647472247176
	?debug	C E382920000002D0104018289002140495654456E+
	?debug	C 74727940307365744576656E74247175636E384B+
	?debug	C 65726E656C4576
	?debug	C E382940000002D0104018289001940495654456E+
	?debug	C 747279403072657365744576656E7424717563
	?debug	C E382960000002D0104018289001440495654456E+
	?debug	C 74727940307369676E616C247176
	?debug	C E3829800000023040400
	?debug	C EB085F767072696E7466829800
	?debug	C E382990953656D6170686F726508002E16
	?debug	C ED00160000820F0E00
	?debug	C E3829A00040016829900
	?debug	C E3829B0000002D829A0401829900144053656D61+
	?debug	C 70686F726540302462637472247169
	?debug	C E3829D0000002D010401829900144053656D6170+
	?debug	C 686F726540302462647472247176
	?debug	C E3829F0000002D040401829902144053656D6170+
	?debug	C 686F726540307761697424717569
	?debug	C E382A10000002D040401829904154053656D6170+
	?debug	C 686F726540307369676E616C247169
	?debug	C E382A30000002D040401829900134053656D6170+
	?debug	C 686F7265403076616C24787176
	?debug	C E382A5000400160100
	?debug	C E382A600000023010400
	?debug	C EB0C40646973706174636824717682A600
	?debug	C E382A70554696D657201002E17
	?debug	C ED0017000082170E00
	?debug	C E382A80000002D01040182A7000F4054696D6572+
	?debug	C 4030696E6974247176
	?debug	C E382AA0000002D01040182A700124054696D6572+
	?debug	C 4030726573746F7265247176
	?debug	C E382AC00000023010400
	?debug	C EB0B40246264656C6524716E7682AC00
	?debug	C E382AD00000023190400
	?debug	C EB0A4024626E65772471756982AD00
	?debug	C E60777636861725F740206001452696F73747265+
	?debug	C 616D5F7769746861737369676E823C0600145069+
	?debug	C 6F73747265616D5F7769746861737369676E8237+
	?debug	C 060013526F73747265616D5F7769746861737369+
	?debug	C 676E8247060013506F73747265616D5F77697468+
	?debug	C 61737369676E8242060013526973747265616D5F+
	?debug	C 7769746861737369676E82520600135069737472+
	?debug	C 65616D5F7769746861737369676E824D06000950+
	?debug	C 696F73747265616D8230060008526F7374726561+
	?debug	C 6D8108060008506F73747265616D80FA06000852+
	?debug	C 6973747265616D81E5060008506973747265616D+
	?debug	C 81D206000A5073747265616D6275668155060004+
	?debug	C 50696F7380DF06000973747265616D6F66660606+
	?debug	C 000973747265616D706F73060600097074726469+
	?debug	C 66665F740606000776615F6C6973741906000A70+
	?debug	C 496E74657272757074828A0600054956544E6F08+
	?debug	C 06000666706F735F740606000673697A655F740A+
	?debug	C 0600085369676E616C49640A06000D5369676E61+
	?debug	C 6C48616E646C65724C0600024944040600045469+
	?debug	C 6D650A060009537461636B53697A650C06000A55+
	?debug	C 7365725468726561642007000A57616974546872+
	?debug	C 6561641E07000A546573745468726561641B0700+
	?debug	C 0A3C74656D706C6174653E7F07000A3C74656D70+
	?debug	C 6C6174653E6507000A3C74656D706C6174653E4B+
	?debug	C 07000653746174657348070009746578745F696E+
	?debug	C 666F80D007000E696F735F757365725F756E696F+
	?debug	C 6E01070013696F73747265616D5F776974686173+
	?debug	C 7369676E80D50700126F73747265616D5F776974+
	?debug	C 6861737369676E82410700126973747265616D5F+
	?debug	C 7769746861737369676E824C070008696F737472+
	?debug	C 65616D80D60700076F73747265616D80FB070007+
	?debug	C 6973747265616D80D707000973747265616D6275+
	?debug	C 668156070003696F7380D807000666696E645F74+
	?debug	C 825B0700056666626C6B825E0700075245475041+
	?debug	C 434B826107000553524547538262070004524547+
	?debug	C 5382630700084259544552454753826507000857+
	?debug	C 4F5244524547538264070009646F73646174655F+
	?debug	C 748266070004646174658267070009646F737469+
	?debug	C 6D655F74826807000474696D6582690700066465+
	?debug	C 76686472826A070007666174696E666F826C0700+
	?debug	C 0A6469736B667265655F74826D07000564667265+
	?debug	C 65826E070008444F534552524F52826F07000743+
	?debug	C 4F554E5452598270070004786663628278070003+
	?debug	C 666362827A0700054576656E74827E0700084956+
	?debug	C 54456E74727982890700084B65726E656C457601+
	?debug	C 07000953656D6170686F726582990700094B6572+
	?debug	C 6E656C53656D0107000654687265616422070003+
	?debug	C 5043424507000554696D657282A70700
	?debug	F @randomize$qv 209 24 0
	?debug	F @random$qi 210 24 0
	?debug	F atoi 211 24 0
	?debug	F abs 212 24 0
	?debug	F pokeb 599 24 0
	?debug	F poke 600 24 0
	?debug	F peekb 601 24 0
	?debug	F peek 602 24 0
	?debug	C E248114054687265616440307374617274247176+
	?debug	C 23481A40546872656164403077616974546F436F+
	?debug	C 6D706C657465247176254D114054687265616440+
	?debug	C 3024626474722471762748114054687265616440+
	?debug	C 3067657449642471762948184054687265616440+
	?debug	C 3067657452756E6E696E6749642471762B481940+
	?debug	C 5468726561644030676574546872656164427949+
	?debug	C 642471692E48134054687265616440307369676E+
	?debug	C 616C247175693048214054687265616440307265+
	?debug	C 67697374657248616E646C6572247175696E7176+
	?debug	C 2476324822405468726561644030756E72656769+
	?debug	C 73746572416C6C48616E646C6572732471756934+
	?debug	C 481840546872656164403073776170247175696E+
	?debug	C 717624767432364818405468726561644030626C+
	?debug	C 6F636B5369676E616C2471756938482040546872+
	?debug	C 6561644030626C6F636B5369676E616C476C6F62+
	?debug	C 616C6C79247175693A481A405468726561644030+
	?debug	C 756E626C6F636B5369676E616C247175693C4822+
	?debug	C 405468726561644030756E626C6F636B5369676E+
	?debug	C 616C476C6F62616C6C79247175693E4A14405468+
	?debug	C 72656164403024626374722471756C7569404C0F+
	?debug	C 40546872656164403072756E2471764240040000+
	?debug	C 0000056D7950434244C008000000
	?debug	C E2600D40504342403072756E6E696E6746000573+
	?debug	C 7461636B47000273730A000273700A000262700A+
	?debug	C 00056B76616E740A00096C6F636B436F756E7404+
	?debug	C 0002696404000B74696D65556E626C6F636B0400+
	?debug	C 0573746174654800086D795468726561642D600B+
	?debug	C 4050434240304D4158494404000E7369676E616C+
	?debug	C 48616E646C6572734A000D616374697665536967+
	?debug	C 6E616C7365000A7369676E616C4C6F636B7D6016+
	?debug	C 405043424030676C6F62616C5369676E616C4C6F+
	?debug	C 636B7E0006706172656E7444600C405043424030+
	?debug	C 616C6C5043427F0007626C6F636B65647F600D40+
	?debug	C 5043424030696E697469616C46600E4050434240+
	?debug	C 3064756D6D795043424660144050434240307275+
	?debug	C 6E6E696E675468726561647304600D4050434240+
	?debug	C 30706F6D6C697374654A11405043424030246263+
	?debug	C 74722471756C756980974A194050434240302462+
	?debug	C 63747224716E36546872656164756C7569809948+
	?debug	C 174050434240307772617070657224716E365468+
	?debug	C 72656164809B4818405043424030616464546F41+
	?debug	C 6C6C50434224716E33504342809D481D40504342+
	?debug	C 403064656C65746546726F6D416C6C5043422471+
	?debug	C 6E33504342809F481D405043424030616464546F+
	?debug	C 426C6F636B65644C69737424716E3350434280A1+
	?debug	C 4814405043424030756E626C6F636B416C6C2477+
	?debug	C 717680A3490E4050434240302462647472247176+
	?debug	C 80A548114050434240307369676E616C24777175+
	?debug	C 6980A7481E405043424030726567697374657248+
	?debug	C 616E646C6572247175696E7176247680A9481F40+
	?debug	C 5043424030756E7265676973746572416C6C4861+
	?debug	C 6E646C6572732471756980AB4815405043424030+
	?debug	C 73776170247175696E71762476743280AD481540+
	?debug	C 5043424030626C6F636B5369676E616C24717569+
	?debug	C 80AF481D405043424030626C6F636B5369676E61+
	?debug	C 6C476C6F62616C6C792471756980B14817405043+
	?debug	C 424030756E626C6F636B5369676E616C24717569+
	?debug	C 80B3481F405043424030756E626C6F636B536967+
	?debug	C 6E616C476C6F62616C6C792471756980B5481340+
	?debug	C 5043424030646F5369676E616C732477717680B7+
	?debug	C C0A8000000
	?debug	C E40004444F4E4500000005524541445901000004+
	?debug	C 4D41444502008007424C4F434B45440300
	?debug	C E27001544C70044E6F64654E00066C656E677468+
	?debug	C 040004686561644F481840254C69737424746E71+
	?debug	C 762476254065726173652477717652481B40254C+
	?debug	C 69737424746E717624762540707573682477716E+
	?debug	C 7176247654481F40254C69737424746E71762476+
	?debug	C 2540707573684261636B2477716E717624765648+
	?debug	C 1640254C69737424746E717624762540706F7024+
	?debug	C 77717658491740254C69737424746E7176247625+
	?debug	C 4024626474722471765A482040254C6973742474+
	?debug	C 6E71762476254064656C65746576616C2477716E+
	?debug	C 717624765C482D40254C69737424746E71762476+
	?debug	C 254064656C4E6F646524716E3138254C69737424+
	?debug	C 746E7176247625404E6F64655E481940254C6973+
	?debug	C 7424746E71762476254067657448656164247176+
	?debug	C 604A1740254C69737424746E7176247625402462+
	?debug	C 63747224717663C006000000
	?debug	C E2000376616C4C00046E6578744F4A2140254C69+
	?debug	C 737424746E7176247625404E6F64654030246263+
	?debug	C 747224716E7176247650C008000000
	?debug	C E27001540A70044E6F64656600066C656E677468+
	?debug	C 0400046865616467481540254C69737424747569+
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
	?debug	C 626374722471767BC006000000
	?debug	C E2000376616C0A00046E657874674A1B40254C69+
	?debug	C 73742474756925404E6F64654030246263747224+
	?debug	C 71756968C006000000
	?debug	C E27001544470044E6F6465808000066C656E6774+
	?debug	C 68040004686561648081481840254C6973742474+
	?debug	C 6E3350434225406572617365247771768084481B+
	?debug	C 40254C69737424746E3350434225407075736824+
	?debug	C 77716E335043428086481F40254C69737424746E+
	?debug	C 335043422540707573684261636B2477716E3350+
	?debug	C 43428088481640254C69737424746E3350434225+
	?debug	C 40706F7024777176808A491740254C6973742474+
	?debug	C 6E3350434225402462647472247176808C482040+
	?debug	C 254C69737424746E33504342254064656C657465+
	?debug	C 76616C2477716E33504342808E482D40254C6973+
	?debug	C 7424746E33504342254064656C4E6F646524716E+
	?debug	C 3138254C69737424746E3350434225404E6F6465+
	?debug	C 8090481940254C69737424746E33504342254067+
	?debug	C 65744865616424717680924A1740254C69737424+
	?debug	C 746E33504342254024626374722471768095C006+
	?debug	C 000000
	?debug	C E2000376616C4400046E65787480814A2140254C+
	?debug	C 69737424746E3350434225404E6F646540302462+
	?debug	C 63747224716E335043428082C008000000
	?debug	C E24A154055736572546872656164403024626374+
	?debug	C 7224717680B94C13405573657254687265616440+
	?debug	C 3072756E24717680BB4D15405573657254687265+
	?debug	C 61644030246264747224717680BDC008000000
	?debug	C E24008000000000374315F1A000374325F1A4A23+
	?debug	C 4057616974546872656164403024626374722471+
	?debug	C 6E313054657374546872656164743180BF4D1540+
	?debug	C 5761697454687265616440302462647472247176+
	?debug	C 80C14C134057616974546872656164403072756E+
	?debug	C 24717680C3C010000000
	?debug	C E24A154054657374546872656164403024626374+
	?debug	C 7224717680C54D15405465737454687265616440+
	?debug	C 30246264747224717680C74C1340546573745468+
	?debug	C 72656164403072756E24717680C9C008000000
	?debug	C E2000777696E6C65667408000677696E746F7008+
	?debug	C 000877696E726967687408000977696E626F7474+
	?debug	C 6F6D0800096174747269627574650800086E6F72+
	?debug	C 6D61747472080008637572726D6F646508000C73+
	?debug	C 637265656E68656967687408000B73637265656E+
	?debug	C 7769647468080004637572780800046375727908+
	?debug	C C00B000000
	?debug	C E27008696F5F737461746580D970096F70656E5F+
	?debug	C 6D6F646580DB70087365656B5F64697280DD600F+
	?debug	C 40696F734030626173656669656C640660114069+
	?debug	C 6F73403061646A7573746669656C640660104069+
	?debug	C 6F734030666C6F61746669656C64064A1840696F+
	?debug	C 734030246263747224716E3973747265616D6275+
	?debug	C 6680E04D0E40696F734030246264747224717680+
	?debug	C E2480E40696F734030666C61677324717680E448+
	?debug	C 0E40696F734030666C61677324716C80E6480E40+
	?debug	C 696F7340307365746624716C6C80E8480D40696F+
	?debug	C 7340307365746624716C80EA480F40696F734030+
	?debug	C 756E7365746624716C80EC480E40696F73403077+
	?debug	C 6964746824717680EE480E40696F734030776964+
	?debug	C 746824716980F0480D40696F73403066696C6C24+
	?debug	C 717680F2480E40696F73403066696C6C24717A63+
	?debug	C 80F4481240696F734030707265636973696F6E24+
	?debug	C 716980F6481240696F734030707265636973696F+
	?debug	C 6E24717680F8481440696F73403074696524716E+
	?debug	C 376F73747265616D8141480C40696F7340307469+
	?debug	C 652471768143481040696F734030726473746174+
	?debug	C 652471768145480C40696F734030656F66247176+
	?debug	C 8147480D40696F7340306661696C247176814948+
	?debug	C 0C40696F734030626164247176814B480D40696F+
	?debug	C 734030676F6F64247176814D480E40696F734030+
	?debug	C 636C656172247169814F4B0D40696F734030246F+
	?debug	C 6E762471768151480E40696F73403024626E6F74+
	?debug	C 2471768153480E40696F73403072646275662471+
	?debug	C 7681B3481140696F734030626974616C6C6F6324+
	?debug	C 717681B5480F40696F73403078616C6C6F632471+
	?debug	C 7681B7480E40696F73403069776F726424716981+
	?debug	C BA480E40696F73403070776F726424716981BD48+
	?debug	C 1840696F73403073796E635F776974685F737464+
	?debug	C 696F24717681BF480D40696F734030736B697024+
	?debug	C 716981C140040000000002627081550005785F74+
	?debug	C 696580FA00057374617465040008697370656369+
	?debug	C 616C0400086F7370656369616C040007785F666C+
	?debug	C 61677306000B785F707265636973696F6E040007+
	?debug	C 785F7769647468040006785F66696C6C04000C69+
	?debug	C 7366785F7370656369616C04000C6F7366785F73+
	?debug	C 70656369616C04000664656C62756604000E6173+
	?debug	C 7369676E5F70726976617465044A0E40696F7340+
	?debug	C 30246263747224717681C3481740696F73403069+
	?debug	C 6E697424716E3973747265616D62756681C54811+
	?debug	C 40696F734030736574737461746524716981C760+
	?debug	C 1040696F734030737464696F666C75736881C960+
	?debug	C 0D40696F7340306E65787462697406600F40696F+
	?debug	C 73403075736572636F756E740400097573657277+
	?debug	C 6F72647381CB00066E776F72647304481140696F+
	?debug	C 7340307573657273697A6524716981CC4A124069+
	?debug	C 6F734030246263747224716D33696F7381CE4812+
	?debug	C 40696F734030246261736724716D33696F7381D0+
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
	?debug	C 6E3973747265616D62756680FC4D12406F737472+
	?debug	C 65616D4030246264747224717680FE4A12406F73+
	?debug	C 747265616D4030246263747224716981004A1540+
	?debug	C 6F73747265616D403024626374722471696E7A63+
	?debug	C 81024811406F73747265616D40306F7066782471+
	?debug	C 7681044811406F73747265616D40306F73667824+
	?debug	C 717681064812406F73747265616D4030666C7573+
	?debug	C 6824717681094812406F73747265616D40307365+
	?debug	C 656B7024716C810B481B406F73747265616D4030+
	?debug	C 7365656B7024716C387365656B5F646972810D48+
	?debug	C 12406F73747265616D403074656C6C7024717681+
	?debug	C 0F4811406F73747265616D403070757424717A63+
	?debug	C 81114816406F73747265616D4030777269746524+
	?debug	C 716E787A636981134816406F73747265616D4030+
	?debug	C 777269746524716E7875636981154813406F7374+
	?debug	C 7265616D403024626C736824717A638117481340+
	?debug	C 6F73747265616D403024626C7368247175638119+
	?debug	C 4812406F73747265616D403024626C7368247173+
	?debug	C 811B4813406F73747265616D403024626C736824+
	?debug	C 717573811D4812406F73747265616D403024626C+
	?debug	C 7368247169811F4813406F73747265616D403024+
	?debug	C 626C73682471756981214812406F73747265616D+
	?debug	C 403024626C736824716C81234813406F73747265+
	?debug	C 616D403024626C73682471756C81254812406F73+
	?debug	C 747265616D403024626C73682471668127481240+
	?debug	C 6F73747265616D403024626C7368247164812948+
	?debug	C 12406F73747265616D403024626C736824716781+
	?debug	C 2B4815406F73747265616D403024626C73682471+
	?debug	C 6E787A63812D4815406F73747265616D40302462+
	?debug	C 6C736824716E787563812F4813406F7374726561+
	?debug	C 6D403024626C736824716E768131481C406F7374+
	?debug	C 7265616D403024626C736824716E397374726561+
	?debug	C 6D62756681334826406F73747265616D40302462+
	?debug	C 6C736824716E716D376F73747265616D246D376F+
	?debug	C 73747265616D8135481E406F73747265616D4030+
	?debug	C 24626C736824716E716D33696F73246D33696F73+
	?debug	C 81374814406F73747265616D4030646F5F6F7066+
	?debug	C 7824717681394814406F73747265616D4030646F+
	?debug	C 5F6F736678247176813B4A12406F73747265616D+
	?debug	C 40302462637472247176813D4818406F73747265+
	?debug	C 616D40306F757473747224716E787A637431813F+
	?debug	C C030000000
	?debug	C E24A144073747265616D62756640302462637472+
	?debug	C 24717681574A174073747265616D627566403024+
	?debug	C 6263747224716E7A636981594D14407374726561+
	?debug	C 6D62756640302462647472247176815B4C184073+
	?debug	C 747265616D627566403073657462756624716E7A+
	?debug	C 6369815D48184073747265616D62756640307365+
	?debug	C 7462756624716E756369815F4819407374726561+
	?debug	C 6D627566403073657462756624716E7A63696981+
	?debug	C 6148144073747265616D62756640307367657463+
	?debug	C 247176816348154073747265616D627566403073+
	?debug	C 6E65787463247176816548154073747265616D62+
	?debug	C 756640307362756D706324717681674815407374+
	?debug	C 7265616D627566403073746F7373632471768169+
	?debug	C 48174073747265616D6275664030736765746E24+
	?debug	C 716E7A6369816B4C1A4073747265616D62756640+
	?debug	C 30646F5F736765746E24716E7A6369816D4C1840+
	?debug	C 73747265616D6275664030756E646572666C6F77+
	?debug	C 247176816F48194073747265616D627566403073+
	?debug	C 7075746261636B6324717A6381714C1840737472+
	?debug	C 65616D6275664030706261636B6661696C247169+
	?debug	C 817348174073747265616D6275664030696E5F61+
	?debug	C 7661696C247176817548144073747265616D6275+
	?debug	C 6640307370757463247169817748184073747265+
	?debug	C 616D6275664030737075746E24716E787A636981+
	?debug	C 794C1B4073747265616D6275664030646F5F7370+
	?debug	C 75746E24716E787A6369817B4C17407374726561+
	?debug	C 6D62756640306F766572666C6F77247169817D48+
	?debug	C 1A4073747265616D62756640306F75745F776169+
	?debug	C 74696E67247176817F4C204073747265616D6275+
	?debug	C 6640307365656B6F666624716C387365656B5F64+
	?debug	C 69726981814C174073747265616D627566403073+
	?debug	C 65656B706F7324716C6981834C13407374726561+
	?debug	C 6D627566403073796E6324717681854812407374+
	?debug	C 7265616D62756640306462702471768187481340+
	?debug	C 73747265616D6275664030626173652471768189+
	?debug	C 48134073747265616D6275664030656275662471+
	?debug	C 76818B48134073747265616D6275664030626C65+
	?debug	C 6E247176818D48144073747265616D6275664030+
	?debug	C 7062617365247176818F48134073747265616D62+
	?debug	C 7566403070707472247176819148144073747265+
	?debug	C 616D627566403065707074722471768193481440+
	?debug	C 73747265616D6275664030656261636B24717681+
	?debug	C 9548134073747265616D62756640306770747224+
	?debug	C 7176819748144073747265616D62756640306567+
	?debug	C 707472247176819948174073747265616D627566+
	?debug	C 40307365747024716E7A637431819B4819407374+
	?debug	C 7265616D62756640307365746724716E7A637431+
	?debug	C 7431819D48144073747265616D62756640307062+
	?debug	C 756D70247169819F48144073747265616D627566+
	?debug	C 40306762756D7024716981A14818407374726561+
	?debug	C 6D62756640307365746224716E7A6374316981A3+
	?debug	C 48194073747265616D6275664030756E62756666+
	?debug	C 6572656424716981A548194073747265616D6275+
	?debug	C 664030756E627566666572656424717681A74817+
	?debug	C 4073747265616D6275664030616C6C6F63617465+
	?debug	C 24717681A94C194073747265616D627566403064+
	?debug	C 6F616C6C6F6361746524717681AB400400000000+
	?debug	C 06616C6C6F635F040006756E6275665F04000562+
	?debug	C 6173655F1D0005656275665F1D00067062617365+
	?debug	C 5F1D0005707074725F1D000665707074725F1D00+
	?debug	C 06656261636B5F1D0005677074725F1D00066567+
	?debug	C 7074725F1D48184073747265616D627566403064+
	?debug	C 6F5F736E6578746324717681AD4A1E4073747265+
	?debug	C 616D6275664030246263747224716D3973747265+
	?debug	C 616D62756681AF481E4073747265616D62756640+
	?debug	C 30246261736724716D3973747265616D62756681+
	?debug	C B1C028000000
	?debug	C E24A1C406973747265616D403024626374722471+
	?debug	C 6E3973747265616D62756681D34D124069737472+
	?debug	C 65616D4030246264747224717681D54A26406973+
	?debug	C 747265616D4030246263747224716E3973747265+
	?debug	C 616D627566696E376F73747265616D81D74A1640+
	?debug	C 6973747265616D403024626374722471696E7A63+
	?debug	C 6981D94A1C406973747265616D40302462637472+
	?debug	C 247169696E376F73747265616D81DB4811406973+
	?debug	C 747265616D40306970667824716981DD48124069+
	?debug	C 73747265616D4030697066783024717681DF4812+
	?debug	C 406973747265616D4030697066783124717681E1+
	?debug	C 4811406973747265616D40306973667824717681+
	?debug	C E34812406973747265616D40307365656B672471+
	?debug	C 6C81E6481B406973747265616D40307365656B67+
	?debug	C 24716C387365656B5F64697281E8481240697374+
	?debug	C 7265616D403074656C6C6724717681EA48114069+
	?debug	C 73747265616D403073796E6324717681EC481540+
	?debug	C 6973747265616D403067657424716E7A63697A63+
	?debug	C 81EE4815406973747265616D403067657424716E+
	?debug	C 7563697A6381F04814406973747265616D403072+
	?debug	C 65616424716E7A636981F2481440697374726561+
	?debug	C 6D40307265616424716E75636981F44819406973+
	?debug	C 747265616D40306765746C696E6524716E7A6369+
	?debug	C 7A6381F64819406973747265616D40306765746C+
	?debug	C 696E6524716E7563697A6381F8481C4069737472+
	?debug	C 65616D403067657424716D3973747265616D6275+
	?debug	C 667A6381FA4812406973747265616D4030676574+
	?debug	C 24716D756381FC4812406973747265616D403067+
	?debug	C 657424716D7A6381FE4810406973747265616D40+
	?debug	C 3067657424717682004811406973747265616D40+
	?debug	C 307065656B24717682024813406973747265616D+
	?debug	C 403067636F756E74247176820448154069737472+
	?debug	C 65616D40307075746261636B24717A6382064814+
	?debug	C 406973747265616D403069676E6F726524716969+
	?debug	C 82084826406973747265616D4030246272736824+
	?debug	C 716E716D376973747265616D246D376973747265+
	?debug	C 616D820A481E406973747265616D403024627273+
	?debug	C 6824716E716D33696F73246D33696F73820C4814+
	?debug	C 406973747265616D4030246272736824716E7A63+
	?debug	C 820E4814406973747265616D4030246272736824+
	?debug	C 716E756382104814406973747265616D40302462+
	?debug	C 72736824716D756382124814406973747265616D+
	?debug	C 4030246272736824716D7A638214481340697374+
	?debug	C 7265616D4030246272736824716D738216481340+
	?debug	C 6973747265616D4030246272736824716D698218+
	?debug	C 4813406973747265616D4030246272736824716D+
	?debug	C 6C821A4814406973747265616D40302462727368+
	?debug	C 24716D7573821C4814406973747265616D403024+
	?debug	C 6272736824716D7569821E481440697374726561+
	?debug	C 6D4030246272736824716D756C82204813406973+
	?debug	C 747265616D4030246272736824716D6682224813+
	?debug	C 406973747265616D4030246272736824716D6482+
	?debug	C 244813406973747265616D403024627273682471+
	?debug	C 6D678226481C406973747265616D403024627273+
	?debug	C 6824716E3973747265616D62756682284A124069+
	?debug	C 73747265616D40302462637472247176822A4815+
	?debug	C 406973747265616D403065617477686974652471+
	?debug	C 76822C4006000000000767636F756E745F044813+
	?debug	C 406973747265616D4030646F5F67657424717682+
	?debug	C 2EC032000000
	?debug	C E24A1D40696F73747265616D4030246263747224+
	?debug	C 716E3973747265616D62756682314D1340696F73+
	?debug	C 747265616D4030246264747224717682334A1340+
	?debug	C 696F73747265616D403024626374722471768235+
	?debug	C C038000000
	?debug	C E24A1E40696F73747265616D5F77697468617373+
	?debug	C 69676E4030246263747224717682384D1E40696F+
	?debug	C 73747265616D5F7769746861737369676E403024+
	?debug	C 62647472247176823A482240696F73747265616D+
	?debug	C 5F7769746861737369676E403024626173672471+
	?debug	C 6D33696F73823D482840696F73747265616D5F77+
	?debug	C 69746861737369676E4030246261736724716E39+
	?debug	C 73747265616D627566823FC038000000
	?debug	C E24A1D406F73747265616D5F7769746861737369+
	?debug	C 676E4030246263747224717682434D1D406F7374+
	?debug	C 7265616D5F7769746861737369676E4030246264+
	?debug	C 747224717682454825406F73747265616D5F7769+
	?debug	C 746861737369676E4030246261736724716D376F+
	?debug	C 73747265616D82484827406F73747265616D5F77+
	?debug	C 69746861737369676E4030246261736724716E39+
	?debug	C 73747265616D627566824AC030000000
	?debug	C E24A1D406973747265616D5F7769746861737369+
	?debug	C 676E40302462637472247176824E4D1D40697374+
	?debug	C 7265616D5F7769746861737369676E4030246264+
	?debug	C 747224717682504825406973747265616D5F7769+
	?debug	C 746861737369676E4030246261736724716D3769+
	?debug	C 73747265616D82534827406973747265616D5F77+
	?debug	C 69746861737369676E4030246261736724716E39+
	?debug	C 73747265616D6275668255C032000000
	?debug	C E200087265736572766564825C00066174747269+
	?debug	C 6202000777725F74696D650A000777725F646174+
	?debug	C 650A000473697A650600046E616D65825DC02B00+
	?debug	C 0000
	?debug	C E2000B66665F7265736572766564825F00096666+
	?debug	C 5F61747472696202000866665F6674696D650A00+
	?debug	C 0866665F66646174650A000866665F6673697A65+
	?debug	C 06000766665F6E616D658260C02B000000
	?debug	C E20004725F61780A0004725F62780A0004725F63+
	?debug	C 780A0004725F64780A0004725F62700A0004725F+
	?debug	C 73690A0004725F64690A0004725F64730A000472+
	?debug	C 5F65730A0007725F666C6167730AC014000000
	?debug	C E2000265730A000263730A000273730A00026473+
	?debug	C 0AC008000000
	?debug	C E200017882640001688265C010000000
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
	?debug	C 65720A000764685F6E616D65826BC012000000
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
	?debug	C 82710008636F5F746873657082720008636F5F64+
	?debug	C 6573657082730008636F5F647473657082740008+
	?debug	C 636F5F746D7365708275000C636F5F6375727273+
	?debug	C 74796C65020009636F5F64696769747302000763+
	?debug	C 6F5F74696D65020007636F5F6361736506000863+
	?debug	C 6F5F646173657082760007636F5F66696C6C8277+
	?debug	C C022000000
	?debug	C E20009786663625F666C6167020009786663625F+
	?debug	C 7265737682790009786663625F61747472020008+
	?debug	C 786663625F666362827AC02C000000
	?debug	C E200096663625F64726976650200086663625F6E+
	?debug	C 616D65827B00076663625F657874827C000A6663+
	?debug	C 625F637572626C6B04000B6663625F7265637369+
	?debug	C 7A6504000B6663625F66696C73697A6506000866+
	?debug	C 63625F646174650400086663625F72657376827D+
	?debug	C 000A6663625F63757272656302000A6663625F72+
	?debug	C 616E646F6D06C025000000
	?debug	C E24A11404576656E744030246263747224717563+
	?debug	C 82804910404576656E7440302462647472247176+
	?debug	C 8282480F404576656E7440307761697424717682+
	?debug	C 844811404576656E74403073696E67616C247176+
	?debug	C 828600066D79496D706C8288C004000000
	?debug	C E200036E756D080007726F7574696E65828A0003+
	?debug	C 6F6C64828A00076D794576656E74828860174049+
	?debug	C 5654456E7472794030495654456E7472794C6973+
	?debug	C 74828C4A1A40495654456E747279403024626374+
	?debug	C 72247175636E7176652476828E49134049565445+
	?debug	C 6E74727940302462647472247176829048214049+
	?debug	C 5654456E74727940307365744576656E74247175+
	?debug	C 636E384B65726E656C4576829248194049565445+
	?debug	C 6E747279403072657365744576656E7424717563+
	?debug	C 8294481440495654456E74727940307369676E61+
	?debug	C 6C2471768296C00D000000
	?debug	C E24A144053656D6170686F726540302462637472+
	?debug	C 247169829B4D144053656D6170686F7265403024+
	?debug	C 62647472247176829D4C144053656D6170686F72+
	?debug	C 6540307761697424717569829F4C154053656D61+
	?debug	C 70686F726540307369676E616C24716982A14813+
	?debug	C 4053656D6170686F7265403076616C2478717682+
	?debug	C A3400400000000066D79496D706C82A5C0080000+
	?debug	C 00
	?debug	C E2600E4054696D6572403062726F6A61630A6023+
	?debug	C 4054696D657240307A6168746576616E615F7072+
	?debug	C 6F6D656E615F6B6F6E74656B7374610A60154054+
	?debug	C 696D65724030676C6F62616C4C6F636B436E7404+
	?debug	C 60174054696D65724030706F7A76616E5F646973+
	?debug	C 70617463680460124054696D657240306E656564+
	?debug	C 546F4B696C6C04480F4054696D65724030696E69+
	?debug	C 7424717682A848124054696D6572403072657374+
	?debug	C 6F726524717682AAC001000000
	end
