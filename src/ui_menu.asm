; ---------------------------------------------------------
; ZorroPaintASM64 - Main Menu UI
; © 2026 ZorroDev - All Rights Reserved
; ---------------------------------------------------------

include ../include/constants.inc

EXTERN DrawRect:PROC
EXTERN DrawString:PROC

.model small

.data
MenuTitle      db "ZORROPAINT ASM64",0
MenuOpt1       db "PROJECTS",0
MenuOpt2       db "EDITOR",0
MenuOpt3       db "EXIT",0

.code

;; ===========================
;; REGION: DrawMenuButton
;; CX,DX = x,y   SI = w   DI = h
;; DS:SI = texto (se pasa aparte)
;; ===========================
DrawMenuButton PROC
    push ax
    push bx
    push cx
    push dx
    push si
    push di

    mov al, 8
    call DrawRect

    add cx, 4
    add dx, 6
    call DrawString

    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
DrawMenuButton ENDP
;; END REGION


;; ===========================
;; REGION: ShowMainMenu
;; ===========================
ShowMainMenu PROC
    push ds
    push si
    push cx
    push dx
    push si
    push di

    ; fondo
    mov cx, 0
    mov dx, 0
    mov si, SCREEN_WIDTH
    mov di, SCREEN_HEIGHT
    mov al, 0
    call DrawRect

    ; título
    mov ax, @data
    mov ds, ax
    mov si, OFFSET MenuTitle
    mov cx, 80
    mov dx, 30
    call DrawString

    ; botón 1
    mov si, OFFSET MenuOpt1
    mov cx, 100
    mov dx, 80
    mov bx, 120
    mov di, 20
    mov ax, bx
    mov si, ax
    call DrawMenuButton

    ; botón 2
    mov si, OFFSET MenuOpt2
    mov cx, 100
    mov dx, 110
    mov ax, 120
    mov si, ax
    mov di, 20
    call DrawMenuButton

    ; botón 3
    mov si, OFFSET MenuOpt3
    mov cx, 100
    mov dx, 140
    mov ax, 120
    mov si, ax
    mov di, 20
    call DrawMenuButton

    pop di
    pop si
    pop dx
    pop cx
    pop si
    pop ds
    ret
ShowMainMenu ENDP
;; END REGION

end
