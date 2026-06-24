; ---------------------------------------------------------
; ZorroPaintASM64 - Main Menu UI
; © 2026 ZorroDev - All Rights Reserved
; ---------------------------------------------------------

include ../include/constants.inc

EXTERN PutPixel:PROC
EXTERN DrawRect:PROC

.model small
.code

;; ===========================
;; REGION: Draw Zorro ASCII (placeholder blocks)
;; ===========================
DrawZorro PROC
    mov cx, 120
    mov dx, 40
    mov si, 80
    mov di, 40
    mov al, 15
    call DrawRect
    ret
DrawZorro ENDP
;; END REGION


;; ===========================
;; REGION: Draw Button
;; ===========================
DrawButton PROC
    push ax
    mov al, 8
    call DrawRect
    pop ax
    ret
DrawButton ENDP
;; END REGION


;; ===========================
;; REGION: Show Main Menu
;; ===========================
ShowMainMenu PROC

    mov cx, 0
    mov dx, 0
    mov si, SCREEN_WIDTH
    mov di, SCREEN_HEIGHT
    mov al, 0
    call DrawRect

    call DrawZorro

    mov cx, 110
    mov dx, 120
    mov si, 100
    mov di, 20
    call DrawButton

    mov cx, 110
    mov dx, 150
    mov si, 100
    mov di, 20
    call DrawButton

    mov cx, 110
    mov dx, 180
    mov si, 100
    mov di, 20
    call DrawButton

    ret
ShowMainMenu ENDP
;; END REGION

end
