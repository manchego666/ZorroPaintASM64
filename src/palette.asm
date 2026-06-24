; ---------------------------------------------------------
; ZorroPaintASM64 - Palette Module
; © 2026 ZorroDev - All Rights Reserved
; ---------------------------------------------------------

.model small

.data
; 16 colores (R,G,B) en rango 0–63
; índice 0 = fondo, 15 = blanco
Palette16 db \
    0,  0,  0,      ; 0  negro
    0,  0, 42,      ; 1  azul
    0, 42,  0,      ; 2  verde
    0, 42, 42,      ; 3  cian
    42, 0,  0,      ; 4  rojo
    42, 0, 42,      ; 5  magenta
    42,21, 0,       ; 6  marrón
    42,42,42,       ; 7  gris claro
    21,21,21,       ; 8  gris oscuro
    21,21,63,       ; 9  azul claro
    21,63,21,       ; 10 verde claro
    21,63,63,       ; 11 cian claro
    63,21,21,       ; 12 rojo claro
    63,21,63,       ; 13 magenta claro
    63,63,21,       ; 14 amarillo
    63,63,63        ; 15 blanco
.code

;; ===========================
;; REGION: InitPalette16
;; Configura los primeros 16 colores VGA
;; ===========================
InitPalette16 PROC
    push ax
    push bx
    push cx
    push dx
    push si

    ; seleccionar índice inicial 0
    mov dx, 3C8h
    mov al, 0
    out dx, al

    ; ahora escribir RGB en 3C9h
    inc dx              ; DX = 3C9h
    mov si, OFFSET Palette16
    mov cx, 16*3        ; 16 colores * 3 componentes

WriteLoop:
    mov al, [si]
    out dx, al
    inc si
    loop WriteLoop

    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
InitPalette16 ENDP
;; END REGION

end
