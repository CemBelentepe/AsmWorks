%include 'mstdio.asm'

SECTION .data
    msg1        db      "Enter the first number: "  , 0
    msg2        db      "Enter the second number: " , 0
    msg3        db      " is larger" , 0
SECTION .bss
    input1:     resd    1
    input2:     resd    1

SECTION .text
global _start

_start:
        mov     eax, msg1
        call    sprint
        mov     eax, input1
        call    iinput

        mov     eax, msg2
        call    sprint

        mov     eax, input2
        call    iinput

        mov     eax, [input1]
        cmp     eax, [input2]
        jg      .if01
        mov     eax, [input2]
        jmp     .outif01
    .if01:
        mov     eax, [input1]
    .outif01:
        call    iprint
        mov     eax, msg3
        call    sprintLF

        call    quit