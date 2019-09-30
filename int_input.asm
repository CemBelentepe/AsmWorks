; A Program that 2 int input and then adds them

%include 'mstdio.asm'

SECTION .data
    msg1     db      'Enter the number: ', 0
    msg2     db      'Addition is: ', 0

SECTION .bss
    num1:   resd    1
    num2:   resd    1
    sum:    resd    1

SECTION .text
    global _start

_start:
    mov     eax, msg1
    call    sprint

    mov     eax, num1
    call    iinput

    mov     eax, msg1
    call    sprint

    mov     eax, num2
    call    iinput

    mov     eax, [num1]
    add     eax, [num2]
    mov     [sum], eax

    mov     eax, [sum]
    call    iprintLF

    ; end
    call    quit