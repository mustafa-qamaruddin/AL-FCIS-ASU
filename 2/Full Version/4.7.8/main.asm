TITLE Copy a String Backwards						(main.asm)

; Description: Mustafa Qamar-ud-Din <mustafa.mahrous.89@gmail.com>
;			4.7.8 Copy a String Backwards:
; 
; Revision date: November 17th, 2014

INCLUDE Irvine32.inc
.data
source BYTE "This is the source string", 0
target BYTE SIZEOF source DUP('#')

.code
main PROC
	call Clrscr
	; EBX := source index [ 0 -> N-1 ]
	; EDX := target index [ N-1 -> 0 ]
	; ECX := loop counter [ N-1 -> 0 ]
	
	mov ECX, SIZEOF source		 ; ECX = N
	dec ECX					 ; ECX = N - 1
	mov EBX, 0				 ; Source Index
	mov EDX, SIZEOF source		 ; Target Index
	dec EDX					 ; EDX = N - 1
	mov target[EDX * TYPE target], 0 ; null terminator
	dec EDX					 ; EDX = N - 2
	L1:
	   mov AL, source[EBX * TYPE source]	 ;
	   mov target[EDX * TYPE target], AL	 ;

	   inc EBX				 ;
	   dec EDX				 ;
	   Loop L1

	; Call PROC DumpMem
	mov ESI, OFFSET target ; offset of variable
	mov EBX, TYPE target   ; byte format
	mov ECX, SIZEOF target ; counter

	call DumpMem

	exit
main ENDP

END main