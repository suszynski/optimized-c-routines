

global mystrchr

section .text

;                   rcx           rdx
; char* strchr( const char* str, int z );

mystrchr:

; first find the length of the string to not search past the null terminator for z

    xor rax, rax ; we are looking for a null-terminator first
    push rdi ; preserve old RDI because its not volatile
    mov rdi, rcx ; we are putting the address of the string into rdi for the scas opcode
    
    push rcx ; preserve the string address because we need rcx for repne
    mov rcx, -1 ; -1 as unsigned is the largest 64bit value possible so we wont stop unless null terminator is found
    cld ; make sure that the DF flag will be 0 in order for scasb to increment rdi and not decrement it
    repne scasb ; search for null terminator starting from rdi

    not rcx ; get the number of times scasb got executed (basically yhe length of the string including null terminator)
    dec rcx ; get the length of the string without counting the null terminator

    pop rdi ; put the address of the string at rdi to start searching for z now

    mov al, dl ; put the ascii code passed to low 8 bytes of rdx to 8 low bytes of rax for scasb

    repne scasb ; search for z (we dont need to put anything in rcx because now it contains the max number of iterations before the string ends)

    jne charNotFound ; if last scasb executed also havent found z (because it sets the zero flag thats how repne knows when or when not to stop) we return NULL

    lea rax [rdi - 1] ; if the char was found, rdi now contains the address of the next byte after the char we were looking for (because scasb increments rdi after the comprasion)

    pop rdi ; put the preserved rdi at rdi

    ret

    charNotFound:
        pop rdi ; put the preserved rdi at rdi
        xor rax, rax ; we are returning NULL if char wasnt found
        ret








