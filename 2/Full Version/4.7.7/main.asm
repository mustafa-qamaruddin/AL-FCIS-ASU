TITLE Arithmetic Expression						(main.asm)

; Description: Mustafa Qamar-ud-Din <mustafa.mahrous.89@gmail.com>
;			4.7.7 Arithmetic Expression
; 
; Revision date: November 17th, 2014

INCLUDE Irvine32.inc
.data
val1 SDWORD 8		; val1 = 0000 1000b = 08h
val2 SDWORD -25	; val2 = 1110 0111b = E7h
val3 SDWORD 10		; val3 = 0000 1010b = 0Ah

.code
main PROC
	call Clrscr

	mov EAX, val1	; EAX = 8d = 0000 1000b = 08h
	neg EAX		; val1 = -8d = 1111 1000b = F8h
	add EAX, 7	; EAX = 1111 1111b = FFh = -1d
				; 2's Complement of val3 = 1111 0110
	sub EAX, val3	; EAX = 1| 1111 0101b = F5h = -11
				; 2's Complement of EAX = 0000 1011
     add EAX, val2  ; EAX = 1111 0101
				;	 + 1110 0111
				;	 = 1| 1101 1100b = DCh

     call DumpRegs

	exit
main ENDP

END main