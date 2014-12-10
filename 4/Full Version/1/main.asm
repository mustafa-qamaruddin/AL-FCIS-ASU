TITLE Two Largest Numbers						(main.asm)

; Description: Mustafa Qamar-ud-Din <mustafa.mahrous.89@gmail.com>
;   1.  Two Largest Number 
;	   Create a program that that reads 10 integers and finds the two largest value among input integers.
;	   ASSUME SIGNED INTEGERS
; Revision date: December 10th, 2014

INCLUDE Irvine32.inc
COUNTER = 10
.data
array SDWORD COUNTER DUP(0)

msg_1 BYTE "ENTER 10 INTEGERS:",0dh,0ah,0
msg_2 BYTE "FIRST MAX:", 0dh, 0ah, 0
msg_3 BYTE "SECOND MAX:", 0dh, 0ah, 0

first_max SDWORD ?
second_max SDWORD ?

.code
main PROC
	call Clrscr
	call ReadArray
	call Get2Max
	call Print2Max
	exit
main ENDP

;   Description:	Prompts user to enter 10 integers
;				Then fills them in the array
;   Receives	:
;   Returns	:
ReadArray PROC USES ecx edx esi
    mov	 edx,OFFSET msg_1
    call WriteString
    mov ecx, COUNTER			 ; Loop Counter = 10
    mov esi, OFFSET array		 ; esi points to first element in array
    L1:
	   call ReadInt			 ; Loads Int in eax
	   mov DWORD PTR [esi], eax	 ; Loads eax in Array[esi]
	   add esi, TYPE array		 ; esi = esi + 4
	   Loop L1
    ret
ReadArray ENDP

;   Description:	Loops array elements
;				IF element[esi] > first_max
;				THEN
;				    second_max = first_max
;				    first_max = element[esi]
;				ELSE If element[esi] > second_max
;				    second_max = element[esi]
;				
;   Receives	:
;   Returns	:	Updates variables: first_max, second_max
Get2Max PROC uses ebx ecx edx esi
    mov first_max, 80000000h		 ; first_max = min signed possible value
    mov second_max, 80000000h		 ; second_max = min signed possible value
    mov ecx, COUNTER			 ; Loop Counter = 10
    mov esi, OFFSET array		 ; esi points to first array element 
    L1:
	   mov ebx, DWORD PTR [esi]	 ; ebx = array[esi]
	   cmp ebx, first_max		 ;
	   jle SECOND_COND			 ; if( element[esi] <= first_max )
	   mov edx, first_max		 ;
	   mov second_max, edx		 ; second_max = first_max
	   mov first_max, ebx		 ; first_max = element[esi]
	   jmp EXIT_COND

	   SECOND_COND:
	   cmp ebx, second_max		 ;
	   jle EXIT_COND			 ; else if( element[esi] <= second_max )
	   mov second_max, ebx		 ; second_max = element[esi]
	   EXIT_COND:
	   
	   add esi, TYPE array		 ; esi = esi + 4
	   Loop L1
    ret
Get2Max ENDP

;   Description:	Prints firat_max, second_max to console
;   Receives	:	first_max, second_max
;   Returns	:
Print2Max PROC
    mov edx, OFFSET msg_2
    call WriteString
    mov eax, first_max
    call WriteInt

    call Crlf

    mov edx, OFFSET msg_3
    call WriteString
    mov eax, second_max
    call WriteInt

    call Crlf

    ret
Print2Max ENDP

END main