; ---------------------------------------------------------
; ZorroPaintASM64 - Main Menu UI
; © 2026 ZorroDev - All Rights Reserved
; ---------------------------------------------------------

include const4.inc

EXTERN DrawRect:PROC
EXTERN DrawString:PROC
EXTERN GetMouseState:PROC
EXTERN IsMouseOver:PROC
EXTERN IsMouseClicked:PROC

.model small

.data
MenuTitle   db "ZORROPAINT ASM64",0
Btn1Text    db "PROJECTS",0
Btn2Text    db "EDITOR",0
Btn3Text    db "EXIT",0

BtnW dw 120
BtnH dw 20

.code

; ===========================
; DrawMenuButton
; CX,DX = x,y
; DS:SI = texto
; ===========================
DrawMenuButton PROC
    push ax
    push bx
    push cx
    push dx
    push si
    push di

    ; cargar ancho y alto
    mov ax, BtnW
    mov bx, ax
    mov ax, BtnH
    mov bp, ax

    ; hover?
    call GetMouseState
    mov si, bx
    mov di, bp
    call IsMouseOver
    cmp al, 1
    jne NormalColor

    mov al, 9
    jmp DrawRectNow

NormalColor:
    mov al, 8

DrawRectNow:
    mov si, bx
    mov di, bp
    call DrawRect

    ; texto centrado
    mov ax, cx
    add ax, 6
    mov cx, ax

    mov ax, dx
    add ax, 6
    mov dx, ax

    call DrawString

    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
DrawMenuButton ENDP


; ===========================
; ShowMainMenu
; ===========================
ShowMainMenu PROC
    push ds
    mov ax, @data
    mov ds, ax

MenuLoop:

    ; fondo
    mov cx, 0
    mov dx, 0
    mov si, SCREEN_WIDTH
    mov di, SCREEN_HEIGHT
    mov al, 0
    call DrawRect

    ; título
    mov cx, 70
    mov dx, 30
    mov si, OFFSET MenuTitle
    call DrawString

    ; botón 1
    mov cx, 100
    mov dx, 80
    mov si, OFFSET Btn1Text
    call DrawMenuButton

    ; botón 2
    mov cx, 100
    mov dx, 110
    mov si, OFFSET Btn2Text
    call DrawMenuButton

    ; botón 3
    mov cx, 100
    mov dx, 140
    mov si, OFFSET Btn3Text
    call DrawMenuButton

    ; lógica de clic
    call GetMouseState

    ; botón 1
    mov cx, 100
    mov dx, 80
    mov si, BtnW
    mov di, BtnH
    call IsMouseOver
    cmp al, 1
    jne CheckBtn2
    call IsMouseClicked
    cmp al, 1
    je Btn1Action

CheckBtn2:
    mov cx, 100
    mov dx, 110
    mov si, BtnW
    mov di, BtnH
    call IsMouseOver
    cmp al, 1
    jne CheckBtn3
    call IsMouseClicked
    cmp al, 1
    je Btn2Action

CheckBtn3:
    mov cx, 100
    mov dx, 140
    mov si, BtnW
    mov di, BtnH
    call IsMouseOver
    cmp al, 1
    jne ContinueLoop
    call IsMouseClicked
    cmp al, 1
    je Btn3Action

ContinueLoop:
    jmp MenuLoop


; ===========================
; Acciones
; ===========================
Btn1Action:
    jmp MenuLoop

Btn2Action:
    jmp MenuLoop

Btn3Action:
    mov ax, 4C00h
    int 21h

ShowMainMenu ENDP

end
