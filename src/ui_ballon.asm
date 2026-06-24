; ---------------------------------------------------------
; ZorroPaintASM64 - Balloon UI Module
; © 2026 ZorroDev - All Rights Reserved
; ---------------------------------------------------------

include const4.inc

extrn DrawRect:near
extrn DrawString:near

.model small

.data
BalloonPadX db 4
BalloonPadY db 4

.code

; ===========================
; DrawBalloon
; CX,DX = posicion
; SI = ancho
; DI = alto
; DS:BX = texto
; ===========================
DrawBalloon PROC
    push ax
    push bx
    push cx
    push dx
    push si
    push di
    push bp

    
    mov bp, cx       ; bp = x
    mov ax, dx       ; ax = y

    ; -----------------------------------
    ; Fondo del globo
    ; -----------------------------------
    mov cx, bp
    mov dx, ax
    mov al, 7
    call DrawRect

    ; -----------------------------------
    ; Borde superior
    ; -----------------------------------
    mov cx, bp
    mov dx, ax
    mov si, si       
    mov di, 1
    mov al, 15
    call DrawRect

    ; -----------------------------------
    ; Borde inferior
    ; -----------------------------------
    mov cx, bp
    mov dx, ax
    add dx, di       
    add dx, si       
    dec dx
    mov si, si
    mov di, 1
    mov al, 15
    call DrawRect

    ; -----------------------------------
    ; Borde izquierdo
    ; -----------------------------------
    mov cx, bp
    mov dx, ax
    mov si, 1
    mov di, di       ; alto
    mov al, 15
    call DrawRect

    ; -----------------------------------
    ; Borde derecho
    ; -----------------------------------
    mov cx, bp
    add cx, si       ; x + ancho
    dec cx
    mov dx, ax
    mov si, 1
    mov di, di
    mov al, 15
    call DrawRect

    ; -----------------------------------
    ; Texto dentro
    ; -----------------------------------
    mov cx, bp
    mov dx, ax

    mov al, byte ptr BalloonPadX
    add cx, ax

    mov al, byte ptr BalloonPadY
    add dx, ax

    mov si, bx
    call DrawString

    pop bp
    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
DrawBalloon ENDP

end
