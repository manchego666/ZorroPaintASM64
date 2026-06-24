; ---------------------------------------------------------
; ZorroPaintASM64 - Main Entry Point
; © 2026 ZorroDev - All Rights Reserved
; ---------------------------------------------------------

.model small
.stack 100h

; ---------------------------------------------------------
; External modules (we will implement these later)
; ---------------------------------------------------------
EXTERN InitVideo:PROC
EXTERN InitMouse:PROC
EXTERN ShowMainMenu:PROC

.data
    ; Global variables will go here
    CurrentProject db "RPG2026",0

.code

start:
    ; Initialize video mode (320x200, mode 13h)
    call InitVideo

    ; Initialize mouse driver
    call InitMouse

    ; Show main menu (Zorro ASCII + options)
    call ShowMainMenu

ExitProgram:
    mov ax, 4C00h
    int 21h

end start
