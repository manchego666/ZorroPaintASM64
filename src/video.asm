; ---------------------------------------------------------
; ZorroPaintASM64 - Video Module
; © 2026 ZorroDev - All Rights Reserved
; ---------------------------------------------------------

include ../include/constants.inc
include ../include/macros.inc
include ../include/font8x8.inc

.model small
.code

;; =========================================================
;; REGION: Init Video Mode (320x200 Mode 13h)
;; =========================================================
InitVideo PROC
    mov ax, 0013h
    int 10h
    mov ax, 0A000h
    mov es, ax
    ret
InitVideo ENDP
;; END REGION


;; =========================================================
;; REGION: PutPixel (core pixel writer)
;; CX = X, DX = Y, AL = Color
;; =========================================================
PutPixel PROC
    mov bx, dx
    shl bx, 6
    shl dx, 8
    add bx, dx
    add bx, cx
    mov es:[bx], al
    ret
PutPixel ENDP
;; END REGION


;; =========================================================
;; REGION: DrawRect (filled rectangle)
;; Inputs:
;;   CX = x
;;   DX = y
;;   SI = width
;;   DI = height
;;   AL = color
;; =========================================================
DrawRect PROC
    push ax
    push bx
    push cx
    push dx
    push si
    push di

    mov bx, dx

RowLoop:
    mov cx, si
    mov dx, bx

ColLoop:
    call PutPixel
    inc cx
    loop ColLoop

    inc bx
    dec di
    jnz RowLoop

    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
DrawRect ENDP
;; END REGION


;; =========================================================
;; REGION: DrawChar8x8
;; AL = ASCII char
;; CX = X
;; DX = Y
;; =========================================================
DrawChar8x8 PROC
    push ax
    push bx
    push cx
    push dx
    push si

    mov bl, al
    shl bx, 3
    mov si, bx

    mov bx, dx

RowLoopChar:
    mov al, Font8x8[si]
    mov di, cx
    mov ah, 8

BitLoop:
    test al, 80h
    jz SkipPixel
    mov al, CurrentColor
    call PutPixel
SkipPixel:
    shl al, 1
    inc di
    dec ah
    jnz BitLoop

    inc si
    inc bx
    mov dx, bx
    dec byte ptr [RowCounter]
    jnz RowLoopChar

    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
DrawChar8x8 ENDP
;; END REGION


;; =========================================================
;; REGION: DrawString
;; DS:SI = pointer to string
;; CX = X
;; DX = Y
;; =========================================================
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
