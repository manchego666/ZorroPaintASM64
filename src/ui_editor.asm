; ---------------------------------------------------------
; ZorroPaintASM64 - Editor UI Module
; © 2026 ZorroDev - All Rights Reserved
; ---------------------------------------------------------

include const4.inc

extrn DrawRect:near
extrn DrawString:near
extrn PutPixel:near
extrn GetMouseState:near
extrn IsMouseClicked:near

extrn CurrentColor:byte
extrn MouseX:word
extrn MouseY:word

.model small

.data
EditorTitle   db "EDITOR",0

CanvasX   dw 20
CanvasY   dw 20
CanvasW   dw 200
CanvasH   dw 140

PaletteY  dw 170

PaletteColors db 0,4,2,14,1,5,3,15   ; 8 colores

.code

; ===========================
; DrawPalette
; ===========================
DrawPalette PROC
    push ax
    push bx
    push cx
    push dx
    push si
    push di

    mov cx, 20
    mov ax, PaletteY
    mov dx, ax
    mov si, 20
    mov di, 10
    mov bl, 0

NextSwatch_Draw:
    mov al, bl
    cbw
    mov bx, OFFSET PaletteColors
    add bx, ax
    mov al, [bx]

    call DrawRect

    add cx, 22
    inc bl
    cmp bl, 8
    jb NextSwatch_Draw

    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
DrawPalette ENDP


; ===========================
; HandlePaletteClick
; ===========================
HandlePaletteClick PROC
    push ax
    push bx
    push cx
    push dx
    push si
    push di
    push bp

    mov cx, 20
    mov ax, PaletteY
    mov dx, ax
    mov si, 20
    mov di, 10
    mov bl, 0

CheckSwatch_Click:
    call GetMouseState
    mov ax, MouseX
    mov bx, MouseY

    cmp ax, cx
    jb NextSwatch_Click
    mov bp, cx
    add bp, si
    cmp ax, bp
    jae NextSwatch_Click

    cmp bx, dx
    jb NextSwatch_Click
    mov bp, dx
    add bp, di
    cmp bx, bp
    jae NextSwatch_Click

    call IsMouseClicked
    cmp al, 1
    jne NextSwatch_Click

    ; *** FIX DEL WARNING ***
    mov al, bl
    cbw
    mov bx, OFFSET PaletteColors
    add bx, ax
    mov al, [bx]
    mov byte ptr CurrentColor, al
    jmp EndPaletteClick

NextSwatch_Click:
    add cx, 22
    inc bl
    cmp bl, 8
    jb CheckSwatch_Click

EndPaletteClick:
    pop bp
    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
HandlePaletteClick ENDP


; ===========================
; HandleCanvasPaint
; ===========================
HandleCanvasPaint PROC
    push ax
    push bx
    push cx
    push dx
    push si
    push bp

    call GetMouseState
    call IsMouseClicked
    cmp al, 1
    jne NoPaint

    mov ax, MouseX
    mov bx, MouseY

    mov cx, CanvasX
    mov dx, CanvasY
    cmp ax, cx
    jb NoPaint
    mov si, CanvasW
    mov bp, cx
    add bp, si
    cmp ax, bp
    jae NoPaint

    cmp bx, dx
    jb NoPaint
    mov si, CanvasH
    mov bp, dx
    add bp, si
    cmp bx, bp
    jae NoPaint

    mov cx, ax
    mov dx, bx
    mov al, byte ptr CurrentColor
    call PutPixel

NoPaint:
    pop bp
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
HandleCanvasPaint ENDP


; ===========================
; ShowEditor
; ===========================
ShowEditor PROC
    push ds
    mov ax, @data
    mov ds, ax

EditorLoop:

    mov cx, 0
    mov dx, 0
    mov si, SCREEN_WIDTH
    mov di, SCREEN_HEIGHT
    mov al, 0
    call DrawRect

    mov cx, 100
    mov dx, 5
    mov si, OFFSET EditorTitle
    call DrawString

    mov ax, CanvasX
    mov cx, ax
    mov ax, CanvasY
    mov dx, ax
    mov ax, CanvasW
    mov si, ax
    mov ax, CanvasH
    mov di, ax
    mov al, 7
    call DrawRect

    call DrawPalette
    call HandlePaletteClick
    call HandleCanvasPaint

    jmp EditorLoop

    pop ds
    ret
ShowEditor ENDP

end
