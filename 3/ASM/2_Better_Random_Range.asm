TITLE Better Random Range						(main.asm)

; Description: Mustafa Qamar-ud-Din <mustafa.mahrous.89@gmail.com>
; 2.	BetterRandomRange Procedure 
;   The RandomRange procedure from the Irvine32 library generates a pseudorandom integer between 0 and N-1.
;   Your task is to create an improved version that generates an integer between M and N-1.
;   Let the caller pass M in EBX and N in EAX.
;   If we call the procedure BetterRandomRange, the following code is a sample test:
;	   mov ebx,-300 ; lower bound
;	   mov eax,100 ; upper bound
;	   call BetterRandomRange
;
;   Write a short test program that calls BetterRandomRange from a loop that repeats 50 times.
;   Display each randomly generated value.

; Revision date: November 25th, 2014

INCLUDE Irvine32.inc
.data
myMessage BYTE "MASM program example",0dh,0ah,0
COUNTER DWORD 50

.code
main PROC
	call Clrscr
	call Randomize

	mov ebx,-300				 ; lower bound
     mov eax,100				 ; upper bound

	mov ecx, COUNTER			 ; ecx = COUNTER = 50
	L1:
	   call betterRandomRange
	Loop L1
	exit
main ENDP

betterRandomRange PROC USES EAX EBX
    neg ebx			   ; ebx = -ebx
    add eax, ebx		   ; eax = eax + ebx
    call RandomRange
    sub eax, ebx		   ; eax = eax - ebx
    mov edx, eax		   ; edx = eax
    call WriteInt
    call Crlf
    ret
betterRandomRange ENDP

END main