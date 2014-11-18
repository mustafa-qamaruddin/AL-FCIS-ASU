TITLE MASM Overflow Flag						(main.asm)

; Description: Mustafa Qamar-ud-Din <mustafa.mahrous.89@gmail.com>
;			4.7.3 Overflow Flag: Set / Clear OF
;			Set / Clear OF and CF simultaneously using ADD
; 
; Revision date: November 17th, 2014

INCLUDE Irvine32.inc
.data

.code
main PROC
	call Clrscr

	;Addition
	; Set OF
	mov al, 07Fh	; al = 0111 1111b = 127d
				; 0000 0001 +
	add al, 1		; al = 1000 0000b = 80h = 128d
				; CF=0  SF=1  ZF=0  OF=1  AF=1  PF=0
	call DumpRegs

	;Addition
	; Clear OF
	add al, 1		; al = 1000 0001b = 81h = 0d
				; CF=0  SF=1  ZF=0  OF=0  AF=0  PF=1
	call DumpRegs

	;Subtraction
	; Set OF
	mov al, 80h    ; al = 1000 0000b = -128d
				; 0000 0001 1
				; 1111 1111 2's complement
	sub al, 1		; al = 1 | 0111 1111b = 7Fh = 127d
				; CF=0  SF=0  ZF=0  OF=1  AF=1  PF=0
				; Why is AF set?
	call DumpRegs

	;Subtraction
	; Clear OF
	sub al, 1		; al = 1 | 0111 1110 = 7Eh = 126d
				; CF=0  SF=0  ZF=0  OF=0  AF=0  PF=1
	call DumpRegs

	;Addition
	; Set OF
	; Set CF
	mov al, 0FFh	; al = 1111 1111b = 255d
				; 1000 0000b = 128d
	add al, 80h	; al = 1 | 0111 1111b = 7Fh = 127d
				; CF=1  SF=0  ZF=0  OF=1  AF=0  PF=0

     call DumpRegs

	exit
main ENDP

END main