[org 0x1000]

dw 0x55aa   ; 魔数，用于判断错误

; 打印字符串
mov si, loading
call print

xchg bx, bx ; 断点

detect_memory:
    ; 将 ebx 置为零
    xor ebx, ebx

    mov ax, 0
    mov es, ax
    mov edi, ards_buffer

    mov edx, 0x534d4150

; 阻塞
jmp $

print:
    mov ah, 0x0e
.next:
    mov al, [si]
    cmp al, 0
    jz .done
    int 0x10
    inc si
    jmp .next
.done:
    ret

loading:
    db "Loading Onix...", 10, 13, 0 ; \n\r
detecting:
    db "Detecting Memory Success...", 10, 13, 0 ; \n\r

error:
    mov si, .msg
    call print
    hlt     ; 让 CPU 停止
    .msg db "Loading Error!!!", 10, 13, 0 ; \n\r

ards_count:
    dw 0
ards_buffer:
