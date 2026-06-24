; ---------------------------------------------------------
; ZorroPaintASM64 - ZorroFont 8x8 (Minimal)
; © 2026 ZorroDev - All Rights Reserved
; ---------------------------------------------------------

.model small
.data

;; ===========================
;; REGION: ZorroFont 8x8
;; ===========================
ZorroFont8x8 LABEL BYTE

; 0 = espacio
db 00h,00h,00h,00h,00h,00h,00h,00h

; 1 = A
db 18h,24h,42h,7Eh,42h,42h,42h,00h

; 2 = B
db 7Ch,42h,42h,7Ch,42h,42h,7Ch,00h

; 3 = C
db 3Ch,42h,40h,40h,40h,42h,3Ch,00h

; 4 = D
db 78h,44h,42h,42h,42h,44h,78h,00h

; 5 = E
db 7Eh,40h,40h,7Ch,40h,40h,7Eh,00h

; 6 = F
db 7Eh,40h,40h,7Ch,40h,40h,40h,00h

; 7 = G
db 3Ch,42h,40h,4Eh,42h,42h,3Ch,00h

; 8 = H
db 42h,42h,42h,7Eh,42h,42h,42h,00h

; 9 = I
db 7Eh,18h,18h,18h,18h,18h,7Eh,00h

; 10 = J
db 7Eh,04h,04h,04h,04h,44h,38h,00h

; 11 = K
db 42h,44h,48h,70h,48h,44h,42h,00h

; 12 = L
db 40h,40h,40h,40h,40h,40h,7Eh,00h

; 13 = M
db 42h,66h,5Ah,5Ah,42h,42h,42h,00h

; 14 = N
db 42h,62h,52h,4Ah,46h,42h,42h,00h

; 15 = O
db 3Ch,42h,42h,42h,42h,42h,3Ch,00h

; 16 = P
db 7Ch,42h,42h,7Ch,40h,40h,40h,00h

; 17 = Q
db 3Ch,42h,42h,42h,4Ah,44h,3Ah,00h

; 18 = R
db 7Ch,42h,42h,7Ch,48h,44h,42h,00h

; 19 = S
db 3Ch,42h,40h,3Ch,02h,42h,3Ch,00h

; 20 = T
db 7Eh,18h,18h,18h,18h,18h,18h,00h

; 21 = U
db 42h,42h,42h,42h,42h,42h,3Ch,00h

; 22 = V
db 42h,42h,42h,42h,24h,24h,18h,00h

; 23 = W
db 42h,42h,42h,5Ah,5Ah,66h,42h,00h

; 24 = X
db 42h,24h,18h,18h,18h,24h,42h,00h

; 25 = Y
db 42h,24h,18h,18h,18h,18h,18h,00h

; 26 = Z
db 7Eh,04h,08h,10h,20h,40h,7Eh,00h

; 27 = 0
db 3Ch,42h,46h,4Ah,52h,62h,3Ch,00h

; 28 = 1
db 18h,38h,18h,18h,18h,18h,7Eh,00h

; 29 = 2
db 3Ch,42h,02h,3Ch,40h,40h,7Eh,00h

; 30 = 3
db 3Ch,42h,02h,1Ch,02h,42h,3Ch,00h

; 31 = 4
db 08h,18h,28h,48h,7Eh,08h,08h,00h

;; END REGION

end
