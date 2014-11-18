TITLE Fibonacci Numbers						(main.asm)

; Description: Mustafa Qamar-ud-Din <mustafa.mahrous.89@gmail.com>
;			4.7.6 Fibonacci Numbers: Calculate the first seven values
; 
; Revision date: November 17th, 2014

INCLUDE Irvine32.inc
.data

.code
main PROC
	call Clrscr
	; ESI => F(N-1)
	; EDI => F(N-2)
	; ECX => Loop Counter

	mov ECX, 5	;#5 ECX = 7

	mov ESI, 1 ;#5 ESI = FIB(0)
	mov EAX, ESI ;#2 EAX = FIB(0)
	call DumpRegs
	
	mov EDI, 1 ;#5 EDI = FIB(1)
	mov EAX, EDI ;#2 EAX = FIB(1)
	call DumpRegs

	L1:
	   mov EAX, ESI ;#2 EAX = FIB(N-2)
	   add EAX, EDI ;#2 EAX = FIB(N-2) + FIB(N-1)
	   call DumpRegs

	   mov ESI, EDI ;#2 ESI = FIB(N-1)
	   mov EDI, EAX ;#2 EDI = FIB(N)
	   Loop L1
	exit
main ENDP

END main