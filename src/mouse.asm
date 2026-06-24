; ---------------------------------------------------------
; ZorroPaintASM64 - Mouse Module
; © 2026 ZorroDev - All Rights Reserved
; ---------------------------------------------------------

.model small
.code

;; ===========================
;; REGION: Init Mouse
;; ===========================
InitMouse PROC
    mov ax, 0
    int 33h
    ret
InitMouse ENDP
;; END REGION

end
