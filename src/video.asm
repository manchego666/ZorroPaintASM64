; ---------------------------------------------------------
; ZorroPaintASM64 - Video Module
; © 2026 ZorroDev - All Rights Reserved
; ---------------------------------------------------------

include ../include/constants.inc

.model small
.code

;; ===========================
;; REGION: Init Video (320x200)
;; ===========================
InitVideo PROC
    mov ax, 0013h
    int 10h
    mov ax, 0A000h
    mov es, ax
    ret
InitVideo ENDP
;; END REGION


;; ===========================
;; REGION: PutPixel
;; CX = X, DX = Y, AL = Color
;; ===========================
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


;; ===========================
;; REGION: DrawRect (filled)
;; CX = x, DX = y, SI = w, DI = h, AL = color
;; ===========================
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

end
