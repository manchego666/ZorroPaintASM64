; ---------------------------------------------------------
; ZorroPaintASM64 - Balloon UI Module
; © 2026 ZorroDev - All Rights Reserved
; ---------------------------------------------------------

include ../include/constants.inc

EXTERN DrawRect:PROC
EXTERN DrawString:PROC

.model small

.data
BalloonPadX db 4
BalloonPadY db 4

.code

;; ===========================
;; REGION: DrawBalloon
;; CX,DX = posición
;; SI = ancho
;; DI = alto
;; DS:BX = texto
;; ===========================
DrawBalloon PROC
    push ax
    push bx
    push cx
    push dx
    push si
    push di

    ; fondo del globo
    mov al, 7
    call DrawRect

    ; borde superior
    mov ax, cx
    mov bx, dx
    mov cx, ax
    mov dx, bx
    mov si, si
    mov di, 1
    mov al, 15
    call DrawRect

    ; borde inferior
    mov cx, ax
    mov dx, bx
    add dx, di
    dec dx
    mov si, si
    mov di, 1
    mov al, 15
    call DrawRect

    ; borde izquierdo
    mov cx, ax
    mov dx, bx
    mov si, 1
    mov di, di
    mov al, 15
    call DrawRect

    ; borde derecho
    mov cx, ax
    add cx, si
    dec cx
    mov dx, bx
    mov si, 1
    mov di, di
    mov al, 15
    call DrawRect

    ; texto dentro
    mov ax, cx
    mov dx, bx
    add ax, BalloonPadX
    add dx, BalloonPadY
    mov cx, ax
    mov dx, dx
    mov si, bx
    call DrawString

    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
DrawBalloon ENDP
;; END REGION

end
