; ---------------------------------------------------------
; ZorroPaintASM64 - Main Entry Point
; © 2026 ZorroDev - All Rights Reserved
; ---------------------------------------------------------

include include/constants.inc

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

start:
    ; segmento de datos
    mov ax, @data
    mov ds, ax

    ; inicializar video
    call InitVideo

    ; paleta profesional
    call InitPalette16

    ; mouse
    call InitMouse
    call ShowMouseCursor

MainLoop:
    ; mostrar menú principal
    call ShowMainMenu

    ; ShowMainMenu solo regresa si el usuario eligió EDITOR
    call ShowEditor

    ; después del editor, exportar 
    ; call ExportCanvasASM

    jmp MainLoop

ExitProgram:
    mov ax, 4C00h
    int 21h

end start
