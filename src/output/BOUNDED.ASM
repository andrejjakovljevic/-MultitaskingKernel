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
	?debug	S "bounded.cpp"
	?debug	C E94E8CA5500B626F756E6465642E637070
	?debug	C E9
	?debug	C FA00000000
BOUNDED_TEXT	segment byte public 'CODE'
BOUNDED_TEXT	ends
	assume	cs:BOUNDED_TEXT,ds:BOUNDED_DATA
BOUNDED_DATA	segment word public 'FAR_DATA'
d@	label	byte
d@w	label	word
b@	label	byte
b@w	label	word
s@	label	byte
BOUNDED_DATA	ends
BOUNDED_TEXT	segment byte public 'CODE'
BOUNDED_TEXT	ends
_s@	equ	s@
	?debug	C EA050D
	end
