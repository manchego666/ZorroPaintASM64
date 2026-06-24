; ---------------------------------------------------------
; ZorroPaintASM64 - Main
; © 2026 ZorroDev
; ---------------------------------------------------------

include constants.inc

EXTERN InitVideo:PROC
EXTERN InitPalette16:PROC
EXTERN InitMouse:PROC
EXTERN ShowMouseCursor:PROC

EXTERN ShowMainMenu:PROC
EXTERN ShowEditor:PROC
EXTERN ExportCanvasASM:PROC

.model small
.stack 100h

.code

; Init
start:
    mov ax, @data
    mov ds, ax

    call InitVideo
    call InitPalette16
    call InitMouse
    call ShowMouseCursor

; Loop
MainLoop:
    call ShowMainMenu
    call ShowEditor
    jmp MainLoop

; Exit
ExitProgram:
    mov ax, 4C00h
    int 21h

end start
