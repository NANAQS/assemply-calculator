%include "biblioteca.inc"

section .data
    tit db LF, "+------+", LF, "| CALC |", LF, "+------+", LF, NULL
    value db LF, "value 1: ", NULL
    value2 db LF, "value 2: ", NULL
    opc1 db LF, "1. add", NULL
    opc2 db LF, "2. sub", NULL
    opc3 db LF, "3. div", NULL
    opc4 db LF, "4. mult", NULL
    opc5 db LF, "5. exit", NULL
    msgOpc db LF, "How Operation?", NULL
    msgError db LF, "Invalid Value!!!", NULL
    p1 db LF, "Process add", NULL
    p2 db LF, "Process sub", NULL
    p3 db LF, "Process div", NULL
    p4 db LF, "Process mult", NULL
    msgFinish db LF, "Finish", LF, NULL

section .bss
    opc resb 1
    num1 resb 2
    num2 resb 2
    res resb 1

section .text 
   global _start

_start:
    mov ECX, tit
    call shw_out

    mov ECX, opc1
    call shw_out
    mov ECX, opc2
    call shw_out
    mov ECX, opc3
    call shw_out
    mov ECX, opc4
    call shw_out
    mov ECX, opc5
    call shw_out

    mov ECX, msgOpc
    call shw_out
    mov EAX, SYS_READ
    mov EBX, STD_IN
    mov ECX, opc
    mov EDX, 0x2
    int SYS_CALL

    mov ECX, value
    call shw_out
    mov EAX, SYS_READ
    mov EBX, STD_IN
    mov ECX, num1
    mov EDX, 0x3
    int SYS_CALL

    mov ECX, value2
    call shw_out
    mov EAX, SYS_READ
    mov EBX, STD_IN
    mov ECX, num2
    mov EDX, 0x3
    int SYS_CALL

    mov ah, [opc]
    sub ah, "0"

    cmp ah, 1
    je adc
    cmp ah, 2
    je subt
    cmp ah, 3
    je divi
    cmp ah, 4
    je mull
    cmp ah, 5
    je out
    ; error
    mov ECX, msgError
    call shw_out
    jmp _start

out: 
    mov ECX, msgFinish
    call shw_out
    mov EAX, SYS_EXIT
    mov EBX, RET_EXIT
    int SYS_CALL


adc:
    mov ECX, p1
    call shw_out

    mov eax, [num1]
    sub eax, '0'
    mov ebx, [num2]
    sub ebx, '0'
    add eax, ebx
    add eax, '0'
    mov [res], eax
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, res
    mov edx, 0xA
    int SYS_CALL

    jmp out

subt:
    mov ECX, p2
    call shw_out
    jmp out

divi:
    mov ECX, p3
    call shw_out
    jmp out

mull:
    mov ECX, p4
    call shw_out
    jmp out


