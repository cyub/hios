[org 0x7c00]

mov bx, GREET
call print

loop:
    jmp loop


print:
    pusha
start:
    mov al, [bx]
    cmp al, 0
    je done

    mov ah, 0x0e
    int 0x10

    add bx, 1
    jmp start

done:
    popa
    ret



GREET:
    db 'Welcome to HiOS', 0x0d, 0x0a, 0

; padding and magic number
times 510-($-$$) db 0
dw 0xaa55
