; Hello World (Passing arguments from the command line)

%include 'mstdio.asm'

SECTION .text
    global _start

_start:
    pop     ecx             ; put the count to ecx
    pop     eax             ; pop the call arg    
    dec     ecx             ; dec after pop

nextArg:
    cmp     ecx, 0h
    je      finishArg
    pop     eax
    call    sprintLF
    dec     ecx
    jmp     nextArg
finishArg:
    call quit