TITLE Random Strings						(main.asm)

; Description: Mustafa Qamar-ud-Din <mustafa.mahrous.89@gmail.com>
; 3.	Random Strings
;   Write a program that generates and displays 20 random strings, each consisting of 10 capital
;   letters {A..Z}.
; Revision date: November 25th, 2014

INCLUDE Irvine32.inc
.data
COUNTER DWORD 20
STRSIZE = 10
A = 65
Z = 90
myMessage BYTE STRSIZE DUP('#'),0dh,0ah,0
tmp DWORD ?

.code
main PROC
	call Clrscr
	call Randomize
	mov ecx, COUNTER						  ; ecx = 20
	L1:
	   call RandomString
	Loop L1
	exit
main ENDP

RandomString PROC USES ECX EDX
    mov ECX, STRSIZE						  ; ecx = 10
    L1:
	   mov eax, Z							  ; eax = 90 'Z
	   sub eax, A							  ; eax = 90 - 65 'Z  'A
	   call RandomRange
	   add eax, A							  ; eax = eax + 65 'A
	   mov tmp, eax						  ; tmp = eax
	   mov al, BYTE PTR tmp					  ; al = random char
	   mov myMessage[ecx - 1], al				  ; myMessage[ecx] = random char
    Loop L1
    mov	 edx,OFFSET myMessage
    call WriteString
    ret
RandomString ENDP

END main