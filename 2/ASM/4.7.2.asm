TITLE MASM Zero Sign Flags						(main.asm)

; Description: Mustafa Qamar-ud-Din <mustafa.mahrous.89@gmail.com>
;			4.7.2 Zero and Sign Flags: Set / Clear Zero and Sign flags using Additions and Subtractions
; 
; Revision date: November 17th, 2014

INCLUDE Irvine32.inc
.data

.code
main PROC
	call Clrscr

	;Addition
	; Set   ZF
	; Clear   SF
	mov eax, 0	; eax = 0

	mov al, 0FFh	; 1111 1111b = 255d
				; 0000 0001b +
	add al, 1		; al = 1 | 0000 0000
				; CF=1  SF=0  ZF=1  OF=0  AF=1  PF=1

     call DumpRegs

	;Addition
	; Clear ZF
	; Set   SF
	mov eax, 0	; eax = 0

	mov al, 07Fh	; 0111 1111b = 127d
				; 0000 0001b +
	add al, 1		; al = 1000 0000b = 80h = 128d
				; CF=0  SF=1  ZF=0  OF=1  AF=1  PF=0

     call DumpRegs

	;Subtraction
	; Set   ZF
	; Clear   SF
	mov eax, 0	; eax = 0

	mov al, 01h	; 0000 0001b = 255d
				; 0000 0001b -
				; 1111 1111b + 2's complement
	sub al, 1		; al = 1 | 0000 0000b = 00h = 0d
				; CF=0  SF=0  ZF=1  OF=0  AF=0  PF=1

     call DumpRegs

	;Subtraction
	; Clear ZF
	; Set   SF
	mov eax, 0	; eax = 0

	mov al, 0h	; 0000 0000b = 0d
				; 0000 0001b -
				; 1111 1111b + 2's complement
	sub al, 1		; al = 1111 1111b = FFh = -1d
				; CF=1  SF=1  ZF=0  OF=0  AF=1  PF=1
				; 0 -1 Negation sets CF
				; Subtracting a larger unsigned integer from a smaller one always sets CF
     call DumpRegs

	exit
main ENDP

END main