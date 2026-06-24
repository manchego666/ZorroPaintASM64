; ---------------------------------------------------------
; ZorroPaintASM64 - Mouse Module
; © 2026 ZorroDev - All Rights Reserved
; ---------------------------------------------------------

.model small
.data
MouseX      dw 0
MouseY      dw 0
MouseBtn    db 0

.code

;; ===========================
;; REGION: InitMouse
;; ===========================
InitMouse PROC
    mov ax, 0
    int 33h
    ret
InitMouse ENDP
;; END REGION


;; ===========================
;; REGION: ShowMouseCursor
;; ===========================
ShowMouseCursor PROC
    mov ax, 1
    int 33h
    ret
ShowMouseCursor ENDP
;; END REGION


;; ===========================
;; REGION: HideMouseCursor
;; ===========================
HideMouseCursor PROC
    mov ax, 2
    int 33h
    ret
HideMouseCursor ENDP
;; END REGION


;; ===========================
;; REGION: GetMouseState
;; Actualiza MouseX, MouseY, MouseBtn
;; ===========================
GetMouseState PROC
    mov ax, 3
    int 33h

    mov MouseBtn, bl

    mov ax, cx
    shr ax, 1
    mov MouseX, ax

    mov ax, dx
    shr ax, 1
    mov MouseY, ax

    ret
GetMouseState ENDP
;; END REGION


;; ===========================
;; REGION: IsMouseOver
;; CX,DX = x,y   SI = w   DI = h
;; Retorna: AL = 1 si está encima, 0 si no
;; ===========================
IsMouseOver PROC
    mov ax, MouseX
    cmp ax, cx
    jb NotInside

    mov bx, cx
    add bx, si
    cmp ax, bx
    jae NotInside

    mov ax, MouseY
    cmp ax, dx
    jb NotInside

    mov bx, dx
    add bx, di
    cmp ax, bx
    jae NotInside

    mov al, 1
    ret

NotInside:
    mov al, 0
    ret
IsMouseOver ENDP
;; END REGION


;; ===========================
;; REGION: IsMouseClicked
;; Retorna AL = 1 si botón izquierdo presionado
;; ===========================
IsMouseClicked PROC
    mov al, MouseBtn
    and al, 1
    ret
IsMouseClicked ENDP
;; END REGION

end
