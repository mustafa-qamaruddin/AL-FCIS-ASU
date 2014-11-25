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
; Revision date: November 25th, 2014

INCLUDE Irvine32.inc
.data
myMessage BYTE "MASM program example",0dh,0ah,0

.code
main PROC
	call Clrscr

	mov	 edx,OFFSET myMessage
	call WriteString

	exit
main ENDP

END main