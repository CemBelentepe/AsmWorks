%include 'mstdio.asm'

SECTION .data
    msg         db      "Enter a number: ", 0
    hex         db      "0x", 0
SECTION .bss
    input1:     resd    1

SECTION .text
global _start

_start:
    mov     eax, msg
    call    sprint

    mov     eax, input1
    call    iinput
    mov     eax, [input1]
    call    iprintLF
    mov     eax, hex
    call    sprint
    mov     eax, input1
    call    iprintHEXLF

    call    quit