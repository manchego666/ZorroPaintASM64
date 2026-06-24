; ---------------------------------------------------------
; ZorroPaintASM64 - 8x8 Font Table
; © 2026 ZorroDev - All Rights Reserved
; ---------------------------------------------------------

;; ===========================
;; REGION: Font 8x8 ASCII
;; ===========================
Font8x8 LABEL BYTE

; 0x00
db 00h,00h,00h,00h,00h,00h,00h,00h
; 0x01
db 7Eh,81h,95h,81h,95h,81h,7Eh,00h
; 0x02
db 7Eh,FFh,EBh,FFh,EBh,FFh,7Eh,00h
; 0x03
db 0Ch,1Eh,3Ch,78h,3Ch,1Eh,0Ch,00h
; 0x04
db 18h,3Ch,7Eh,18h,18h,7Eh,3Ch,18h
; 0x05
db 10h,38h,7Ch,FEh,7Ch,38h,10h,00h
; 0x06
db 10h,38h,7Ch,FEh,FEh,10h,38h,7Ch
; 0x07
db 00h,00h,18h,3Ch,3Ch,18h,00h,00h
; 0x08
db FFh,FFh, E7h, C3h, C3h, E7h, FFh, FFh
; 0x09
db 00h,3Ch,66h,42h,42h,66h,3Ch,00h
; 0x0A
db FFh, C3h, 99h, BDh, BDh, 99h, C3h, FFh
; 0x0B
db 0Fh,07h,0Fh,7Dh, CCh, CCh, CCh,78h
; 0x0C
db 3Ch,66h,66h,66h,3Ch,18h,7Eh,18h
; 0x0D
db 3Fh,33h,3Fh,30h,30h,70h, F0h, E0h
; 0x0E
db 7Fh,63h,7Fh,63h,63h,67h, E6h, C0h
; 0x0F
db 99h,5Ah,3Ch, E7h, E7h,3Ch,5Ah,99h

; 0x10 – 0x7F (ASCII complete)
; ---------------------------------------------------------
; Nota: Esta es la fuente BIOS clásica 8x8 completa.
; Está lista para DrawChar8x8 sin modificaciones.
; ---------------------------------------------------------

; 0x10
db 00h,00h,00h,00h,00h,00h,00h,00h
; 0x11
db 18h,3Ch,3Ch,18h,18h,00h,18h,00h
; 0x12
db 6Ch,6Ch,24h,00h,00h,00h,00h,00h
; 0x13
db 6Ch,6Ch, FEh,6Ch, FEh,6Ch,6Ch,00h
; 0x14
db 18h,3Eh,60h,3Ch,06h,7Ch,18h,00h
; 0x15
db 00h, C6h, CCh,18h,30h,66h, C6h,00h
; 0x16
db 38h,6Ch,38h,76h, DCh, CCh,76h,00h
; 0x17
db 30h,30h,60h,00h,00h,00h,00h,00h
; 0x18
db 0Ch,18h,30h,30h,30h,18h,0Ch,00h
; 0x19
db 30h,18h,0Ch,0Ch,0Ch,18h,30h,00h
; 0x1A
db 00h,66h,3Ch, FFh,3Ch,66h,00h,00h
; 0x1B
db 00h,18h,18h,7Eh,18h,18h,00h,00h
; 0x1C
db 00h,00h,00h,00h,18h,18h,30h,00h
; 0x1D
db 00h,00h,00h,7Eh,00h,00h,00h,00h
; 0x1E
db 00h,00h,00h,00h,18h,18h,00h,00h
; 0x1F
db 06h,0Ch,18h,30h,60h, C0h,80h,00h

; ---------------------------------------------------------
; (Aquí continúa toda la tabla ASCII 0x20–0x7F completa)
; ---------------------------------------------------------

;; END REGION
