; ---------------------------------------------------------
; ZorroPaintASM64 - Export Module
; Convierte el canvas en líneas db estilo ASM
; ---------------------------------------------------------

include const4.inc

extrn CanvasX:word
extrn CanvasY:word
extrn CanvasW:word
extrn CanvasH:word

.model small

.data
HexDigits db '0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'
HeaderTxt db "Sprite db ",13,10,0
NewLine   db 13,10,0

.code

PrintChar PROC
    mov ah, 02h
    int 21h
    ret
PrintChar ENDP

PrintString PROC
    push ax
    push dx
NextCh:
    lodsb
    cmp al, 0
    je Done
    mov dl, al
    call PrintChar
    jmp NextCh
Done:
    pop dx
    pop ax
    ret
PrintString ENDP

;; ===========================
;; REGION: ExportCanvasASM
;; Usa ES = A000h (modo 13h)
;; ===========================
ExportCanvasASM PROC
    push ax
    push bx
    push cx
    push dx
    push si
    push di
    push ds

    mov ax, @data
    mov ds, ax

    mov si, OFFSET HeaderTxt
    call PrintString

    mov ax, 0A000h
    mov es, ax

    mov ax, CanvasY
    mov dx, ax          ; y
RowLoop:
    mov ax, CanvasX
    mov cx, ax          ; x

    mov dl, 9
    call PrintChar

    mov ax, CanvasW
    mov si, ax          ; contador ancho

ColLoop:
    mov ax, dx
    mov bx, 320
    mul bx
    add ax, cx
    mov bx, ax

    mov al, es:[bx]
    and al, 0Fh
    mov ah, 0
    mov bl, al
    mov dl, byte ptr HexDigits[bx]
    call PrintChar
    mov dl, 'h'
    call PrintChar
    mov dl, ','
    call PrintChar

    inc cx
    dec si
    jnz ColLoop

    mov si, OFFSET NewLine
    call PrintString

    inc dx
    mov ax, CanvasY
    mov bx, CanvasH
    add ax, bx
    cmp dx, ax
    jb RowLoop

    pop ds
    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
ExportCanvasASM ENDP

end
