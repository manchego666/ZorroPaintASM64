; ---------------------------------------------------------
; ZorroPaintASM64 - Editor UI Module
; © 2026 ZorroDev - All Rights Reserved
; ---------------------------------------------------------

include ../include/constants.inc

EXTERN DrawRect:PROC
EXTERN DrawString:PROC
EXTERN PutPixel:PROC
EXTERN GetMouseState:PROC
EXTERN IsMouseClicked:PROC

EXTERN CurrentColor:BYTE
EXTERN MouseX:WORD
EXTERN MouseY:WORD

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

;; ===========================
;; REGION: DrawPalette
;; ===========================
DrawPalette PROC
    push ax
    push bx
    push cx
    push dx
    push si
    push di

    mov cx, 20
    mov dx, PaletteY
    mov si, 20
    mov di, 10
    mov bl, 0          ; índice color

NextSwatch:
    mov al, [PaletteColors+bx]
    call DrawRect

    add cx, 22
    inc bl
    cmp bl, 8
    jb NextSwatch

    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
DrawPalette ENDP
;; END REGION


;; ===========================
;; REGION: HandlePaletteClick
;; ===========================
HandlePaletteClick PROC
    push ax
    push bx
    push cx
    push dx
    push si
    push di

    mov cx, 20
    mov dx, PaletteY
    mov si, 20
    mov di, 10
    mov bl, 0

CheckSwatch:
    call GetMouseState
    mov ax, MouseX
    mov bx, MouseY

    ; dentro del rect actual?
    cmp ax, cx
    jb NextSwatch
    mov bp, cx
    add bp, si
    cmp ax, bp
    jae NextSwatch

    cmp bx, dx
    jb NextSwatch
    mov bp, dx
    add bp, di
    cmp bx, bp
    jae NextSwatch

    ; clic?
    call IsMouseClicked
    cmp al, 1
    jne NextSwatch

    ; seleccionar color
    mov al, [PaletteColors+bl]
    mov CurrentColor, al
    jmp EndPaletteClick

NextSwatch:
    add cx, 22
    inc bl
    cmp bl, 8
    jb CheckSwatch

EndPaletteClick:
    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
HandlePaletteClick ENDP
;; END REGION


;; ===========================
;; REGION: HandleCanvasPaint
;; ===========================
HandleCanvasPaint PROC
    push ax
    push bx
    push cx
    push dx

    call GetMouseState
    call IsMouseClicked
    cmp al, 1
    jne NoPaint

    mov ax, MouseX
    mov bx, MouseY

    ; dentro del canvas?
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

    ; pintar pixel
    mov cx, ax
    mov dx, bx
    mov al, CurrentColor
    call PutPixel

NoPaint:
    pop dx
    pop cx
    pop bx
    pop ax
    ret
HandleCanvasPaint ENDP
;; END REGION


;; ===========================
;; REGION: ShowEditor
;; ===========================
ShowEditor PROC
    push ds
    mov ax, @data
    mov ds, ax

EditorLoop:
    ; fondo
    mov cx, 0
    mov dx, 0
    mov si, SCREEN_WIDTH
    mov di, SCREEN_HEIGHT
    mov al, 0
    call DrawRect

    ; título
    mov cx, 10
    mov dx, 5
    mov si, OFFSET EditorTitle
    call DrawString

    ; canvas
    mov cx, CanvasX
    mov dx, CanvasY
    mov si, CanvasW
    mov di, CanvasH
    mov al, 0
    call DrawRect

    ; paleta
    call DrawPalette

    ; input
    call HandlePaletteClick
    call HandleCanvasPaint

    jmp EditorLoop

    pop ds
    ret
ShowEditor ENDP
;; END REGION

end
