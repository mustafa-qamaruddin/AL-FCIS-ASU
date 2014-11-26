TITLE File of Fibonacci Numbers						(main.asm)

; Description: Mustafa Qamar-ud-Din <mustafa.mahrous.89@gmail.com>
;			 5.8.2 Files of Fibonacci Numbers
; Revision date: November 26th, 2014

INCLUDE Irvine32.inc
.data
COUNTER = 47
array DWORD COUNTER DUP (0)
myMessage BYTE "MASM program example",0dh,0ah,0
fileHandle DWORD ?

.code
main PROC
	call Clrscr

	call Fib

	mov eax, fileHandle
	mov edx, OFFSET array
	mov ecx, COUNTER
	call WriteToFile

	mov edx, eax			  ; edx = eax number of bytes written to file
	call WriteDec
	call Crlf
	exit
main ENDP

Fib PROC USES EAX EBX ECX ESI
    mov eax, 1				  ; eax = Fib[0] = 1 => Fib[i-2]
    mov ebx, 1				  ; ebx = Fib[1] = 1 => Fib[i-1]
    mov esi, OFFSET array

    mov [esi], eax			  ; array[0] = 1
    add esi, TYPE DWORD		  ; esi = esi + 4 'DWORD
    
    mov [esi], ebx			  ; array[1] = 1
    add esi, TYPE DWORD		  ; esi = esi + 4 'DWORD

    mov ecx, COUNTER		  ; ecx = 47
    sub ecx, 2				  ; ecx = 45

    L1:
		  mov [esi], eax	  ; Fib[i] = Fib[i-2] + fib[i-1]
		  add [esi], ebx	  ;
		  mov eax, ebx		  ; Fib[i-2] = Fib[i-1]
		  mov ebx, [esi]	  ; Fib[i-1] = Fib[i]

		  add esi, TYPE DWORD ; esi = esi + 4 'DWORD

	   Loop L1
ret
Fib ENDP

END main