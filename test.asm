%include 'mstdio.asm'

SECTION .data
    msg1     db    "Hello, World1", 0
    msg2     db    "Hello, World2", 0

SECTION .TEXT
    global _start

_start:
    mov     eax, msg1
    call    sprintLF

    mov     eax, msg2
    call    sprintLF

    call    quit
