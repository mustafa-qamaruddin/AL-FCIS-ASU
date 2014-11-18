TITLE Carry Flag						(main.asm)

; Description: Mustafa Qamar-ud-Din <mustafa.mahrous.89@gmail.com>
;			4.7.1 Carry Flag: Set / Reset Carry Flag
;			Unsigned Integers
; 
; Revision date: November 17, 2014

INCLUDE Irvine32.inc
.data

.code
main PROC
	call Clrscr
	;Addition / Set
	mov eax, 0	; eax = 0

	mov al, 0FFh	; al = 1111 1111b = 255d
	mov ah, 0FFh	; ah = 1111 1111b = 255d

	add al, ah	; ah = 1 | 1111 1110b = 254d = FEh
	call DumpRegs	; CF=1  SF=1  ZF=0  OF=0  AF=1  PF=0

	;Addition / Set
	mov eax, 0	; eax = 0

	mov al, 0FFh	; al = 1111 1111b = 255d
	mov ah, 01h	; ah = 0000 0001b = 1d

	add al, ah	; ah = 1 | 0000 0000b = 0d = 00h
	call DumpRegs	; CF=1  SF=0  ZF=1  OF=0  AF=1  PF=0

	;Addition / Clear
	mov eax, 0	; eax = 0

	mov al, 01h	; al = 0000 0001b = 1d
	mov ah, 01h	; ah = 0000 0001b = 1d

	add al, ah	; ah = 0000 0010b = 2d = 02h
	call DumpRegs	; CF=0  SF=0  ZF=0  OF=0  AF=0  PF=0

	;Subtraction / Set
	mov eax, 0	; eax = 0

	mov al, 01h	; ah = 0000 0001b = 1d
	mov ah, 0FFh	; al = 1111 1111b = 255d
	
				; 2's Complement of ah = 0000 0001b = 01h = -255d
	sub al, ah	; ah = 1 | 0000 0010b = -254d = 02h
	call DumpRegs	; CF=1  SF=0  ZF=0  OF=0  AF=?  PF=0
				; CF is set when subtracting larger unsigned integer from smaller one
				; Why is AF = 1 ?

    ;Subtraction / Clear
	mov eax, 0	; eax = 0

	mov al, 02h	; al = 0000 0010b = 2d
	mov ah, 01h	; ah = 0000 0001b = 1d
	
				; 2's Complement of ah = 1111 1111b = FFh = -1d
	sub al, ah	; ah = 1 | 0000 0001b = 254d = 01h
	call DumpRegs	; CF=0  SF=0  ZF=0  OF=0  AF=?  PF=0

	exit
main ENDP

END main