TITLE Direct-Offset Addressing						(main.asm)

; Description: Mustafa Qamar-ud-Din <mustafa.mahrous.89@gmail.com>
;			4.7.4 Direct-Offset Addressing
; 
; Revision date: November 17th, 2014

INCLUDE Irvine32.inc
.data
Uarray  WORD	 8h, 80h, 800h, 8000h
Sarray  SWORD	 -2, -4, -8, -16

.code
main PROC
	call Clrscr
	
	movzx EAX,	 Uarray	   ;   EAX = 8h
	movzx EBX,	 Uarray + 2  ;   EBX = 80h
	movzx ECX,	 Uarray + 4  ;   ECX = 800h
	movzx EDX,	 Uarray + 6  ;   EDX = 8000h

	call DumpRegs

	movsx EAX,	 Sarray	   ;   EAX = -2
	movsx EBX,	 Sarray + 2  ;   EBX = -4
	movsx ECX,	 Sarray + 4  ;   ECX = -8
	movsx EDX,	 Sarray + 6  ;   EDX = -16

	call DumpRegs

	exit
main ENDP

END main