global mystrset

section .text


;                  rcx         rdx
; char* strset(char* string, int c);

mystrset:

    ; first we have to find null terminator with scasb

    xor rax, rax ; zero out AL which scasb uses as the byte we want to find
    push rdi ; save a non-volatile register which is needed for scasb
    mov rdi, rcx ; put the string address at rdi for scasb

    push rcx ; save the string address because rcx is needed for repne

    mov rcx, -1 ; tell repne to basically iterate forever until it finds the null byte (or until it will attempt to read a page with no read permisisons)

    repne scasb

    not rcx ; get the amount of iterations that scasb did

    dec rcx ; make string* + rcx point exactly to null terminator and not one byte past it

    mov rdi, [rsp] ; put the pointer of the string to rdi once again for stosb

    mov al, dl ; put the char passed as c to al for stosb to overwrite

    rep stosb

    pop rax ; strset returns the address of the altered string
    pop rdi ; put back the preserved value of rdi
    
    ret








