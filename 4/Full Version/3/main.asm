TITLE MASM Test Score Evaluation						(main.asm)

; Description: Mustafa Qamar-ud-Din <mustafa.mahrous.89@gmail.com>
;	    3.  Test Score Evaluation 
;		  Write a program that asks the user to enter an integer test score between 0 and 100 and print the appropriate 
;		  letter grade. The program should ask the user to enter the number of grades he wants to check at the 
;		  beginning. 
;		  Score Range  Letter Grade 
;		  90 to 100  A 
;		  80 to 89  B 
;		  70 to 79  C 
;		  60 to 69  D 
;		  0 to 59  F 
;		  Sample: 
;		  Enter number of students: 2 
;		  Enter Grade: 98 
;		  Letter Grade: F 
;		  Enter Grade: 68 
;		  Letter Grade: D 
;	    4.  Test Score Evaluation with range checking 
;		  Modify your previous program to perform range checking on theuser’s input: Display an error message if 
;		  the test score is less than 0 or greater than 100. 
; Revision date: December 10th, 2014

INCLUDE Irvine32.inc

COUNTER = 5
.data
Grades  DWORD 100, 90, 89, 80, 79, 70, 69, 60, 59, 0
Letters BYTE 'F', 'D', 'C', 'B', 'A'

NUM_STUDENTS DWORD ?
Grade DWORD ?

msg_1 BYTE "Enter number of students:", 0dh, 0ah, 0
msg_2 BYTE "Enter Grade:", 0dh, 0ah, 0
msg_3 BYTE "Letter Grade:", 0dh, 0ah, 0

msg_invalid BYTE "Sorry, Invalid Input", 0dh, 0ah, 0

.code
main PROC
	call Clrscr
	call Runnable
	exit
main ENDP

Runnable PROC
    PRELOOP:
	   mov edx, OFFSET msg_1					  ;
	   call WriteString						  ;
	   call ReadInt						  ;
	   mov NUM_STUDENTS, eax					  ;
    
	   call ValidateNumStudents
    jz PRELOOP								  ; if zf = 1, jump back to enter a valid number of students

    mov ecx, eax							  ; loop counter set to input
    Program_Loop:
	   call Crlf								  ;
	   call EvaluateGrade
	   call Crlf								  ;
	   Loop Program_Loop

    ret
Runnable ENDP

EvaluateGrade PROC USES ESI EDI EAX ECX EDX
    mov edx, OFFSET msg_2					  ;
    call WriteString						  ;
    
    call ReadInt							  ;
    mov Grade, eax							  ; Grade = user input eax

    mov esi, OFFSET Grades					  ; esi => Grades[0]
    mov edi, OFFSET Letters					  ; edi => Letters[0]

    mov ecx, COUNTER						  ; ecx = 5
    L1:
	   cmp eax, DWORD PTR [esi]				  ;
	   ja INVALID_INPUT						  ; if above interval's upper bound is always invalid as loop moves downwards
	   add esi, TYPE Grades					  ; esi = esi + 4
	   cmp eax, DWORD PTR [esi]				  ; 
	   jae PRINT_GRADE						  ; if Grade >= lower bound
	   add esi, TYPE Grades					  ; esi = esi + 4
	   Loop L1

    INVALID_INPUT:
	   mov edx, OFFSET msg_invalid			  ;
	   call WriteString
	   call Crlf
	   jmp RETURN

    PRINT_GRADE:
	   mov edx, OFFSET msg_3					  ;
	   call WriteString						  ;
	   mov al, BYTE PTR Letters[ecx - 1]		  ;	 ecx was started at 5 down to 0 and broken at when an interval was matched
	   call WriteChar						  ;
    RETURN:
    ret
EvaluateGrade ENDP

;   Description:	Validates loops counter > 0
;   Receives	:
;   Returns	:	updates var_x
ValidateNumStudents PROC USES EBX
    or ebx, 1					 ; reset ZF = 0
    ;call DumpRegs
    mov ebx, NUM_STUDENTS		 ;
    cmp ebx, 0					 ;
    jg RETURN_L				 ; note signed process here
    and ebx, 0					 ; if num_students <= 0, ZF = 1
    ;call DumpRegs
    RETURN_L:
    ret
ValidateNumStudents ENDP

END main