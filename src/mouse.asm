; Mouse routines for ZorroPaintASM64
; © 2026 ZorroDev

.model small
.code

InitMouse PROC
    mov ax, 0
    int 33h
    ret
InitMouse ENDP

end
