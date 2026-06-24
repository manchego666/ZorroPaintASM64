; ---------------------------------------------------------
; ZorroPaintASM64 - Palette Module
; © 2026 ZorroDev - All Rights Reserved
; ---------------------------------------------------------

.model small

.data

Palette16 db 0,0,0, 0,0,42, 0,42,0, 0,42,42, 42,0,0, 42,0,42, 42,21,0, 42,42,42, 21,21,21, 21,21,63, 21,63,21, 21,63,63, 63,21,21, 63,21,63, 63,63,21, 63,63,63

.code

InitPalette16 PROC
    push ax
    push bx
    push cx
    push dx
    push si

    mov dx, 3C8h
    mov al, 0
    out dx, al

    inc dx
    mov si, OFFSET Palette16
    mov cx, 16*3

WriteLoop:
    mov al, [si]
    out dx, al
    inc si
    loop WriteLoop

    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
InitPalette16 ENDP

end
