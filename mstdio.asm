;--------------------------------------
; int slen(char* msg)
slen:
    push    ebx
    mov     ebx, eax
    .nextchar:
    cmp     byte[eax], 0
    jz      .finished
    inc     eax
    jmp     .nextchar
    .finished:
    sub     eax, ebx
    pop     ebx
    ret
;--------------------------------------


;--------------------------------------
; void cprint(char* c)
cprint:
    push    eax
    push    ebx
    push    ecx
    push    edx

    mov     edx, 1
    mov     ecx, eax
    mov     ebx, 1
    mov     eax, 4
    int     80h

    pop     edx
    pop     ecx
    pop     ebx
    pop     eax
    ret
;--------------------------------------


;--------------------------------------
; void cprintLF(char* c)
cprintLF:
    
    ret
;--------------------------------------

;--------------------------------------
; char cinput(char* c)
cinput:
    push    edx
    push    ecx
    push    ebx
    push    eax
    push    ebp 
    mov     ebp, esp

    sub     esp, 2              ; a string for holding input

    push    eax
    mov     edx, 2
    mov     ecx, ebp
    sub     ecx, 2
    mov     ebx, 0
    mov     eax, 3
    int     80h
    pop     eax

    mov     ebx, 0
    mov     bl, byte[ebp-2]
    mov     [eax], bl

    mov     esp, ebp
    pop     ebp
    pop     eax
    pop     ebx
    pop     ecx
    pop     edx
    ret
;--------------------------------------

;--------------------------------------
; void sprint(char* msg)
sprint:
    push    edx
    push    ecx
    push    ebx
    push    eax

    call    slen
    mov     edx, eax
    pop     eax

    mov     ecx, eax
    mov     ebx, 1
    mov     eax, 4
    int     80h

    pop     ebx
    pop     ecx
    pop     edx
    ret
;--------------------------------------


;--------------------------------------
; void sprintLF(char* msg)
sprintLF:
    call    sprint

    push    eax
    mov     eax, 0Ah
    push    eax
    mov     eax, esp
    call    sprint
    pop     eax
    pop     eax
    ret
;--------------------------------------


;--------------------------------------
; void sinput(char* pos, unsgined int size)
sinput:
    push    edx
    push    ecx
    push    ebx
    push    eax

    mov     edx, ebx
    mov     ecx, eax
    mov     ebx, 0
    mov     eax, 3
    int     80h
    
    pop     eax
    pop     ebx
    pop     ecx
    pop     edx
    ret
;--------------------------------------


;--------------------------------------
; void iprint(int i)
iprint:
    push    eax
    push    ecx
    push    edx
    push    esi
    
    mov     ecx, 0

    ;if i >= 0: continue
    cmp     eax, 0
    jge     .divLoop
    ;else
    neg     eax
    push    eax
    mov     eax, '-'
    push    eax
    mov     eax, esp
    call    sprint
    pop     eax
    pop     eax

    .divLoop:
    inc     ecx
    mov     edx, 0
    mov     esi, 10
    idiv    esi
    add     edx, 48
    push    edx
    cmp     eax, 0
    jnz     .divLoop

    .printLoop:
    dec     ecx
    mov     eax, esp
    call    sprint
    pop     eax
    cmp     ecx, 0
    jnz     .printLoop

    pop     esi
    pop     edx
    pop     ecx
    pop     eax
    ret
;--------------------------------------


;--------------------------------------
; void iprintLF(int i)
iprintLF:
    call    iprint

    push    eax
    mov     eax, 0Ah
    push    eax
    mov     eax, esp
    call    sprint
    pop     eax
    pop     eax
    ret
;--------------------------------------


;--------------------------------------
; void iprintHEX(int i)
iprintHEX:
    push    eax
    push    ecx
    push    edx
    push    esi
    
    mov     ecx, 0

    ;if i >= 0: continue
   ; cmp     eax, 0
   ; jge     .divLoop
   ; ;else
   ; neg     eax
   ; push    eax
   ; mov     eax, '-'
   ; push    eax
   ; mov     eax, esp
   ; call    sprint
   ; pop     eax
   ; pop     eax

    .divLoop:
    inc     ecx
    mov     edx, 0
    mov     esi, 16
    idiv    esi
    cmp     edx, 9
    jle     .less
    add     edx, 55
    jmp     .comp
    .less:
        add     edx, 48
    .comp:
    push    edx
    cmp     eax, 0
    jnz     .divLoop

    .printLoop:
    dec     ecx
    mov     eax, esp
    call    sprint
    pop     eax
    cmp     ecx, 0
    jnz     .printLoop

    pop     esi
    pop     edx
    pop     ecx
    pop     eax
    ret
;--------------------------------------


;--------------------------------------
; void iprintHEXLF(int i)
iprintHEXLF:
    call    iprintHEX

    push    eax
    mov     eax, 0Ah
    push    eax
    mov     eax, esp
    call    sprint
    pop     eax
    pop     eax
    ret
;--------------------------------------


;--------------------------------------
; int iinput(int* p)
iinput:
    push    edx
    push    ecx
    push    ebx
    push    eax
    push    ebp
    mov     ebp, esp

    sub     esp, 10              ; a string for holding input

    push    eax
    mov     eax, ebp
    sub     eax, 10
    mov     ebx, 10
    call    sinput              ; input is in the (ebp-10)
    call    atoi
    mov     ebx, eax
    pop     eax                 
    
    mov     [eax], ebx

    mov     esp, ebp
    pop     ebp
    pop     eax
    pop     ebx
    pop     ecx
    pop     edx
    ret
;--------------------------------------


;--------------------------------------
; int atoi(char* msg)
atoi:
    push    ebx
    push    ecx
    push    edx
    push    esi
    mov     esi, eax
    mov     eax, 0
    mov     ecx, 0
    mov     edx, 0

    xor     ebx, ebx
    mov     bl, [esi]
    cmp     bl, 45
    jne     .mull
    mov     edx, 1
    inc     esi

    .mull:
    push    edx
    .mulLoop:
    xor     ebx, ebx
    mov     bl, [esi+ecx]
    cmp     bl, 48
    jl      .finished
    cmp     bl, 57
    jg      .finished

    sub     bl, 48
    add     eax, ebx
    mov     ebx, 10
    mul     ebx
    inc     ecx
    jmp     .mulLoop

    .finished:
    mov     edx, 0
    mov     ebx, 10
    div     ebx
    pop     edx

    ;----------------
    ; make negative
    cmp     edx, 1
    jl      .return
    neg     eax

    .return:
    pop     esi
    pop     edx
    pop     ecx
    pop     ebx
    ret
;--------------------------------------


;--------------------------------------
; void exit()
quit:
    mov     ebx, 0
    mov     eax, 1
    int     80h
;--------------------------------------