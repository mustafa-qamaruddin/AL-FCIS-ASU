TITLE Summation Program						(main.asm)

; Description: Mustafa Qamar-ud-Din <mustafa.mahrous.89@gmail.com>
; 4.	Summation Program
;   Modify the Summation program in Section 5.6.1 as follows: Select an array size using a constant:
;	   ARRAY_SIZE = 20
;	   array DWORD ARRAY_SIZE DUP(?)
;   Write a new procedure that prompts the user for the number of integers to be processed.
;   Pass the same value to the PromptForIntegers procedure.
;   For example, 
;   How many integers will be added? 5
;
; Revision date: November 26th, 2014

INCLUDE Irvine32.inc
.data

    ARRAY_SIZE = 20
    array DWORD ARRAY_SIZE DUP(?)

    str1 BYTE "Enter A Signed Integer:", 0dh, 0ah, 0
    str2 BYTE "The Sum of the Integers is:", 0dh, 0ah, 0
    str3 BYTE "Enter An Integer from 1 to 20:", 0dh, 0ah, 0

.code
main PROC
	call Clrscr

	call PromptForSize

	mov esi, OFFSET array		 ; esi = pointer to array first element array[0]
	mov ecx, eax				 ; ecx = eax = actual array size
	call PromptForIntegers

	call SumArray

	call DisplaySum
	exit
main ENDP

; Returns: EAX = size of the array from 1 to 20
PromptForSize PROC USES EDX
    mov edx, OFFSET str3			 ; edx points to str3
    call WriteString

    call ReadInt
ret
PromptForSize ENDP

; Receives: ESI = pointer to array, ECX = array size
PromptForIntegers PROC USES EDX ESI ECX
    mov edx, OFFSET str1			; edx points to str1
    L1:
	   call WriteString
	   call ReadInt			; eax contains input integer
	   call Crlf
	   mov [esi], eax			; array[esi] is updated
	   add esi, TYPE DWORD		; esi = esi + 4 'DWORD
	   Loop L1
ret
PromptForIntegers ENDP

; Receives: ESI = pointer to the array, ECX = number of array elements
; Returns: EAX = sum of array elements
SumArray PROC USES ESI ECX
    mov eax, 0					; eax = 0
    L1:
	   add eax, [esi]			; eax = eax + array[i]
	   add esi, TYPE DWORD		; esi = esi + 4 'DWORD
	   Loop L1
ret
SumArray ENDP

; Receives: EAX = the sum
DisplaySum PROC USES EDX
    mov edx, OFFSET str2			; edx points to str2
    call WriteString
    call WriteInt
    call Crlf
ret
DISPLAYSUM ENDP

END main