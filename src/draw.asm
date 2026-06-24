; ---------------------------------------------------------
; ZorroPaintASM64 - Draw Module
; © 2026 ZorroDev - All Rights Reserved
; ---------------------------------------------------------

include ../include/constants.inc
EXTERN PutPixel:PROC
EXTERN ZorroFont8x8:BYTE

.model small
.data
CurrentColor db 15
RowCount db 8

.code

;; ================================
;; REGION: DrawChar8x8
;; AL = índice de ZorroFont
;; CX = X
;; DX = Y
;; ================================
DrawChar8x8 PROC
    push ax
    push bx
    push cx
    push dx
    push si
    push di

    mov bl, al
    shl bx, 3
    mov si, OFFSET ZorroFont8x8
    add si, bx

    mov di, dx
    mov RowCount, 8

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
    dec RowCount
    jnz RowLoop

    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
DrawChar8x8 ENDP
;; END REGION


;; ================================
;; REGION: DrawString
;; DS:SI = texto
;; CX = X
;; DX = Y
;; ================================
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
;; END REGION

end
