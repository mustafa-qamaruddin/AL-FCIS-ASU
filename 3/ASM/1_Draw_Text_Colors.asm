TITLE Draw Text Colors						(main.asm)

; Description: Mustafa Qamar-ud-Din <mustafa.mahrous.89@gmail.com>
; 1.	Draw Text Colors
;   Write a program that displays the same string in four different colors, using a loop.
;   Call the SetTextColor procedure from the book’s link library.
;   Any colors may be chosen, but you may find it easiest to change the foreground color.
; Revision date: November 25th, 2014

INCLUDE Irvine32.inc

.data
myMessage BYTE "Hello World from Assembly Language!",0dh,0ah,0
arrColors BYTE black, blue, green, red, magenta, brown, lightGray, gray, lightBlue, lightGreen, lightCyan, lightRed, lightMagenta, yellow, white
COUNTER	DWORD LENGTHOF arrColors

.code
main PROC
	mov edx,OFFSET myMessage							    ; edx = address of first element in string
	mov esi, 0									    ; esi = 0 ; arrColors index
	mov edi, LENGTHOF arrColors - 1 					    ; edi = 3 ; arrColors index backwards
	mov ecx, COUNTER								    ; ecx = COUNTER
	L1:
	   mov eax, 0									    ; eax = 0
	   mov al, arrColors[edi]						    ; eax = 00 00 00 0[BackgroundColor]
	   imul ax, 16									    ; eax = 00 00 00 [BackgroundColor]0
	   add al, arrColors[esi]						    ; eax = 00 00 00 [BackgroundColor][ForegroundColor]
	   
	   PUSH ecx									    ; PUSH ecx to stack
	   call SetTextColor
	   call Clrscr
	   call WriteString
	   POP ecx									    ; POP ecx from stack
	   mov eax, 1000								    ; eax = 1000 = 1second
	   call Delay									    ; delay before clearscreen
	   inc esi									    ; esi = esi + 1
	   dec edi									    ; edi = edi - 1
	Loop L1

	exit
main ENDP

END main