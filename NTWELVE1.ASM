.MODEL SMALL
.STACK 100H

.DATA

MS1 DB 'M===$'
MS2 DB 0DH,0AH,'N===$'
MS3 DB 0DH,0AH,'GCD===$'
A DW ?
B DW ?

.CODE

MAIN PROC

MOV AX,@DATA
MOV DS,AX


LEA DX,MS1
MOV AH,9
INT 21H

CALL INDEC
PUSH AX


LEA DX,MS2
MOV AH,9
INT 21H

CALL INDEC
PUSH AX

XOR BX,BX

POP BX
POP AX

CMP AX,BX
JL GO1
JMP PRO


GO1:
MOV A,AX
MOV AX,BX
MOV BX,A


PRO:

XOR DX,DX
MOV B,BX
DIV B


CMP DX,0
JE RESULT

MOV AX,BX
MOV BX,DX
JMP PRO



RESULT:
  
LEA DX,MS3
MOV AH,9
INT 21H


MOV AX,B
CALL OUTDEC


MOV AH,4CH
INT 21H






MAIN ENDP

INCLUDE INDEC.ASM
INCLUDE OUTDEC.ASM

END MAIN