; ---------------------------------------------------------
; ZorroPaintASM64 - Main Entry Point
; © 2026 ZorroDev - All Rights Reserved
; ---------------------------------------------------------

include ../include/constants.inc
include ../include/macros.inc

.model small
.stack 100h

;; ===========================
;; REGION: External Modules
;; ===========================
EXTERN InitVideo:PROC
EXTERN InitMouse:PROC
EXTERN ShowMainMenu:PROC
;; END REGION


;; ===========================
;; REGION: Global Data
;; ===========================
.data
CurrentProject db "RPG2026",0
;; END REGION


;; ===========================
;; REGION: Main Code
;; ===========================
.code

start:
    call InitVideo
    call InitMouse
    call ShowMainMenu

ExitProgram:
    mov ax, 4C00h
    int 21h
;; END REGION

end start
