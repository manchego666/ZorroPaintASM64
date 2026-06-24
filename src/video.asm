; ---------------------------------------------------------
; ZorroPaintASM64 - Video Module
; © 2026 ZorroDev - All Rights Reserved
; ---------------------------------------------------------

.model small
.code

;; REGION: Init Video Mode (320x200 Mode 13h)
InitVideo PROC
    mov ax, 0013h
    int 10h
    mov ax, 0A000h
    mov es, ax
    ret
InitVideo ENDP
;; END REGION

;; REGION: PutPixel
; CX = X, DX = Y, AL = Color
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

end
