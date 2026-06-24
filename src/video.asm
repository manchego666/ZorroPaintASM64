; Video routines for ZorroPaintASM64
; © 2026 ZorroDev

.model small
.code

InitVideo PROC
    mov ax, 0013h
    int 10h
    ret
InitVideo ENDP

end
