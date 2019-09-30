; Hello World with inputting

%include 'mstdio.asm'

SECTION .data
    msg1        db      "Please enter your name: ", 0h
    msg2        db      "Hello, ", 0h

SECTION .bss
    name:     resb    255


SECTION .text
    global _start

_start:
    mov     eax, msg1
    call    sprint
    
    mov     eax, name
    mov     ebx, 255
    call    sinput

    mov     eax, msg2
    call    sprint

    mov     eax, name
    call    sprint

    call    quit