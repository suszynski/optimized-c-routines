

global mystrlen

section .text

;                     rcx
; size_t mystrlen( const char * str )

mystrlen:

    xor rax, rax ; sets AL to 0 to indicate searching for nullbyte with SCASB opcode

    push rdi ; preserves rdi because its not a volatile register in windows x64 calling convention used
    mov rdi, rcx ; sets the SCASB parameter to str address

    mov rcx, -1 ; sets the iteration counter for REPNE to largest 64bit unisgned integer (-1 has every bit set)
    cld ; clears the direction flag which tells repne to increment RDI each iteration by one instead of decrementing it
    repne SCASB


    not rcx ; gets how many times repne got executed
    dec rcx ; decrements rcx by one in order for the last iteration to not count (we are not including the nullbyte iteration)

    mov rax, rcx ; returns the size of a str excluding the nullbyte

    pop rdi ; sets rdi to be equal to the value it had before the call
    ret

