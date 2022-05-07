segment .data
    LF        equ 0xA ; line feed
    NULL      equ 0xD ; Final the string 
    SYS_CALL  equ 0x80; send infos to OS
    ; EAX
    RET_EXIT  equ 0x0 ; sucess operation 
    SYS_WRITE equ 0x4 ; method write
    SYS_READ  equ 0x3 ; read inputs
    ; EBX
    SYS_EXIT  equ 0x1 ; finish program
    STD_IN    equ 0X0 ; input default
    STD_OUT   equ 0x1 ; output default

segment .text 

shw_out: 
    call tamStr
    mov EAX, SYS_WRITE
    mov EBX, STD_OUT
    int SYS_CALL
    ret

tamStr: 
    mov EDX, ECX
nextchar:
    cmp byte[EDX], NULL
    jz final
    inc EDX
    jmp nextchar
final:
    sub EDX, ECX
    ret

