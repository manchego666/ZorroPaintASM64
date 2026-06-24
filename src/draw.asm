; ---------------------------------------------------------
; ZorroPaintASM64 - Draw Module
; © 2026 ZorroDev - All Rights Reserved
; ---------------------------------------------------------

include const4.inc

extrn PutPixel:near
extrn ZorroFont8x8:byte

.model small

.data
CurrentColor db 15
RowCount     db 8

.code

; ================================
; DrawChar8x8
; ================================
DrawChar8x8 PROC
    push ax
    push bx
    push cx
    push dx
    push si
    push di

    xor bh, bh
    mov bl, al
    shl bx, 1
    shl bx, 1
    shl bx, 1

    mov si, OFFSET ZorroFont8x8
    add si, bx

    mov di, dx
    mov byte ptr RowCount, 8

RowLoop:
    mov al, [si]
    mov bx, cx
    mov ah, 8

BitLoop:
    test al, 80h
    jz SkipPixel

    mov al, CurrentColor
    mov cx, bx
    mov dx, di
    call PutPixel

SkipPixel:
    shl al, 1
    inc bx
    dec ah
    jnz BitLoop

    inc si
    inc di
    dec byte ptr RowCount
    jnz RowLoop

    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
DrawChar8x8 ENDP


; ================================
; DrawString
; ================================
DrawString PROC
NextChar:
    lodsb
    cmp al, 0
    je EndString

    call DrawChar8x8
    add cx, 8
    jmp NextChar

EndString:
    ret
DrawString ENDP

end
