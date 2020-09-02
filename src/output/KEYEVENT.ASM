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
	?debug	S "keyevent.cpp"
	?debug	C E9518CA5500C6B65796576656E742E637070
	?debug	C E9
	?debug	C FA00000000
KEYEVENT_TEXT	segment byte public 'CODE'
KEYEVENT_TEXT	ends
	assume	cs:KEYEVENT_TEXT,ds:KEYEVENT_DATA
KEYEVENT_DATA	segment word public 'FAR_DATA'
d@	label	byte
d@w	label	word
b@	label	byte
b@w	label	word
s@	label	byte
KEYEVENT_DATA	ends
KEYEVENT_TEXT	segment byte public 'CODE'
KEYEVENT_TEXT	ends
_s@	equ	s@
	?debug	C EA050D
	end
