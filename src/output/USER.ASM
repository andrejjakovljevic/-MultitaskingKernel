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
	?debug	S "user.cpp"
	?debug	C E94A8CA55008757365722E637070
	?debug	C E9
	?debug	C FA00000000
USER_TEXT	segment byte public 'CODE'
USER_TEXT	ends
	assume	cs:USER_TEXT,ds:USER_DATA
USER_DATA	segment word public 'FAR_DATA'
d@	label	byte
d@w	label	word
b@	label	byte
b@w	label	word
s@	label	byte
USER_DATA	ends
USER_TEXT	segment byte public 'CODE'
USER_TEXT	ends
_s@	equ	s@
	?debug	C EA050D
	end
