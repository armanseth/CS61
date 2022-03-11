.orig x3000
;this stack lab computes the polish notation of a set of calls
LD R6, STACK_ADDR
;push_val(4) pushes the value 4 onto the stack [4]
	AND R0, R0, #0
	ADD R0, R0,#4
	LD R5, PUSH_VAL
	JSRR R5
;push_val(3) pushes the value 3 onto the stack [4,3]
AND R0, R0, x0
ADD R0, R0, #3
LD R5, PUSH_VAL
JSRR R5
;push_val(2) pushes the value 2 onto the stack [4,3,2]
AND R0, R0, x0
ADD R0, R0, #2
LD R5, PUSH_VAL
JSRR R5


;add_val() pop 3,2 and push the result of 3+2 onto the stack [4,5]
LD R5, ADD_VAL
JSRR R5


;add_val() pop 4,5 and push the result of 4+5 onto the stack[9]
LD R5, ADD_VAL
JSRR R5



;move the top value of the stack into r4
LDR R4, R6, #0		; TOS -> R0
HALT
;data
PUSH_VAL .FILL x3400
ADD_VAL .FILL x3800
STACK_ADDR .FILL xFE00
.end


.orig x3400 ;;push_val(int val)implement your push function that will push a value onto the stack
ST R7, SAVE_7_3400
    ADD R6, R6, #-1
    STR R0, R6, #0
END_PUSH
	LD R7, SAVE_7_3400
	RET

;---------------
;DATA
;---------------
	SAVE_7_3400 .BLKW #1
.end
.orig x3800 ;; add_val() pops two values from the top of the stack and pushes the result of adding the poppped value into the stack
ST R7, SAVE_7_3800
ST R0, SAVE_0_3800
ST R1, SAVE_1_3800
ST R2, SAVE_2_3800
AND R2, R2, x0

LDR R0, R6, #0
STR R2, R6, #0
ADD R6, R6, #1
LDR R1, R6, #0
STR R2, R6, #0

ADD R0, R0, R1
STR R0, R6, #0

LD R1, SAVE_1_3800
LD R2, SAVE_2_3800
LD R7, SAVE_7_3800
LD R0, SAVE_0_3800
RET
	---------------
;DATA
;---------------

	SAVE_7_3800 .BLKW #1
	SAVE_2_3800 .BLKW #1
    SAVE_1_3800 .BLKW #1
    SAVE_0_3800 .BLKW #1
.end


.orig x4200 ;;data you might need

.end


