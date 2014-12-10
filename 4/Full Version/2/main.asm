TITLE Boolean Calculator						(main.asm)

; Description: Mustafa Qamar-ud-Din <mustafa.mahrous.89@gmail.com>
;   2.  Boolean Calculator
;	Create a program that functions as a simple Boolean calculator for 32-bit integers. 
;	You should display a menu that asks the user to make a selection from the following list: 
;		  1. x AND y 
;		  2. x OR y 
;		  3. NOT x 
;		  4. x XOR y 
;		  5. Exit program 
;	   When the user makes a choice, ask him to enter values for x and y. 
;	   You should output the name of procedure done and the result. 
;	   Also the menu should be displayed again so the user can make more than one choice. 
; Revision date: December 10th, 2014

INCLUDE Irvine32.inc
.data
msg_1 BYTE "Main Menu:", 0dh, 0ah, 0

choice_1 BYTE "1. x AND y", 0dh, 0ah, 0
choice_2 BYTE "2. x OR y", 0dh, 0ah, 0
choice_3 BYTE "3. NOT x", 0dh, 0ah, 0
choice_4 BYTE "4. x XOR y", 0dh, 0ah, 0
choice_5 BYTE "5. Exit Program", 0dh, 0ah, 0

proc_1 BYTE "x AND y", 0dh, 0ah, 0
proc_2 BYTE "x OR y", 0dh, 0ah, 0
proc_3 BYTE "NOT x", 0dh, 0ah, 0
proc_4 BYTE "x XOR y", 0dh, 0ah, 0

msg_x BYTE "ENTER X:", 0dh, 0ah, 0
msg_y BYTE "ENTER Y:", 0dh, 0ah, 0

var_x   DWORD	 ?
var_y   DWORD	 ?

invalid_input BYTE "Sorry, but your input is not valid", 0dh, 0ah, 0
bye_bye BYTE "Thanks for using Boolean Calculator", 0dh, 0ah, 0

.code
main PROC
	call Clrscr
	call Runnable
	exit
main ENDP

DisplayMenu PROC USES EDX
    mov edx, OFFSET msg_1		   ;
    call WriteString
    
    mov edx, OFFSET choice_1
    call WriteString
    
    mov edx, OFFSET choice_2
    call WriteString
    
    mov edx, OFFSET choice_3
    call WriteString

    mov edx, OFFSET choice_4
    call WriteString

    mov edx, OFFSET choice_5
    call WriteString

    call Crlf

    ret
DisplayMenu ENDP

;   Description:	The main program loop
;   Receives	:
;   Returns	:
Runnable PROC
    call DisplayMenu
    
    WHILE_LOOP:
		  call ReadInt						  ; read int to eax
		  cmp eax, 5						  ; while condition
			 je END_WHILE					  ; if choice == 5
		  cmp eax, 1						  ;
			 jne CASE_2					  ; if choice != 1
			 call Proc_AND					  ; if choice == 1
			 jmp NEXT						  ; Skip redundant checks
	   CASE_2:
		  cmp eax, 2						  ;
			 jne CASE_3					  ; if choice != 2
			 call Proc_OR					  ; if choice == 2
			 jmp NEXT						  ; Skip redundant checks
	   CASE_3:
		  cmp eax, 3						  ;
			 jne CASE_4					  ; if choice != 3
			 call Proc_NOT					  ; if choice == 3
			 jmp NEXT						  ; Skip redundant checks
	   CASE_4:
		  cmp eax, 4						  ;
			 jne CASE_DEF					  ; if choice != 4 and is invalid
			 call Proc_XOR					  ; if choice == 4
			 jmp NEXT						  ; Skip redundant checks
	   CASE_DEF:
		  mov edx, OFFSET invalid_input		  ;
		  call WriteString
	   NEXT:
		  call DisplayMenu					  ;
	   jmp WHILE_LOOP						  ;

    END_WHILE:
    mov edx, OFFSET bye_bye
    call WriteString
    call Crlf

    ret
Runnable ENDP

;   Description:	Reads 2 variables from user
;   Receives	:
;   Returns	:	updates var_x, var_y
ReadXY PROC
    mov edx, OFFSET msg_x
    call WriteString
    call ReadInt
    mov var_x, eax

    mov edx, OFFSET msg_y
    call WriteString
    call ReadInt
    mov var_y, eax

    call Crlf

    ret
ReadXY ENDP

;   Description:	Reads a variable from user
;   Receives	:
;   Returns	:	updates var_x
ReadX PROC
    mov edx, OFFSET msg_x
    call WriteString
    call ReadInt
    mov var_x, eax
    call Crlf

    ret
ReadX ENDP

;   Description:	performs logical and outputs result
;   Receives	:
;   Returns	:	updates var_x
Proc_AND PROC
    
    call ReadXY					 ; var_x, var_y are set now
    mov eax, var_x					 ; eax = X
    and eax, var_y					 ; eax = var_x AND var_y
    mov edx, OFFSET proc_1			 ; 
    call WriteString
    mov ebx, TYPE var_x				 ; ebx = 4
    call WriteBinB
    call Crlf
    call Crlf

    ret
Proc_AND ENDP

;   Description:	performs logical and outputs result
;   Receives	:
;   Returns	:	updates var_x
Proc_OR PROC
    
    call ReadXY					 ; var_x, var_y are set now
    mov eax, var_x					 ; eax = X
    or eax, var_y					 ; eax = var_x OR var_y
    mov edx, OFFSET proc_2			 ; 
    call WriteString
    mov ebx, TYPE var_x				 ; ebx = 4
    call WriteBinB
    call Crlf
    call Crlf

    ret
Proc_OR ENDP

;   Description:	performs logical xor outputs result
;   Receives	:
;   Returns	:	updates var_x
Proc_XOR PROC
    
    call ReadXY					 ; var_x, var_y are set now
    mov eax, var_x					 ; eax = X
    xor eax, var_y					 ; eax = var_x XOR var_y
    mov edx, OFFSET proc_4			 ; 
    call WriteString
    mov ebx, TYPE var_x				 ; ebx = 4
    call WriteBinB
    call Crlf
    call Crlf

    ret
Proc_XOR ENDP

;   Description:	performs logical NOT outputs result
;   Receives	:
;   Returns	:	updates var_x
Proc_NOT PROC
    
    call ReadX	 					 ; var_x is set now
    mov eax, var_x					 ; eax = X
    not eax						 ; eax = !var_x
    mov edx, OFFSET proc_3			 ; 
    call WriteString
    mov ebx, TYPE var_x				 ; ebx = 4
    call WriteBinB
    call Crlf
    call Crlf

    ret
Proc_NOT ENDP

END main