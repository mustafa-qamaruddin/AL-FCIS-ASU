TITLE Reverse an Array						(main.asm)

; Description: Mustafa Qamar-ud-Din <mustafa.mahrous.89@gmail.com>
;			4.7.5 Reverse an Array
; 
; Revision date: November 17th, 2014

INCLUDE Irvine32.inc
.data
iArray  DWORD	 1, 2, 3, 4, 5, 6, 7, 8, 9

.code
main PROC
	call Clrscr
	mov ESI, 0					; i := [ 0 -> N / 2 ]
	mov EDI, LENGTHOF iArray	- 1		; j := [ N-1 -> N / 2 ]

	mov ECX, LENGTHOF iArray / 2		; ECX = N / 2
	L1:
	   mov EAX, iArray[ESI * TYPE iArray]
	   xchg EAX, iArray[EDI * TYPE iArray]
	   mov iArray[ESI * TYPE iArray], EAX

	   inc ESI
	   dec EDI
	   LOOP L1

	; call PROC DumpMem
	mov ESI, OFFSET iArray			; offset of variable
	mov EBX, TYPE iArray			; byte format
	mov ECX, LENGTHOF iArray			; counter
	call DumpMem

	exit
main ENDP

END main