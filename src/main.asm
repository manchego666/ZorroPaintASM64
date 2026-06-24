; ---------------------------------------------------------
; ZorroPaintASM64 - Main
; © 2026 ZorroDev
; ---------------------------------------------------------

include const4.inc

EXTRN InitVideo:NEAR
EXTRN InitPalette16:NEAR
EXTRN InitMouse:NEAR
EXTRN ShowMouseCursor:NEAR

EXTRN ShowMainMenu:NEAR
EXTRN ShowEditor:NEAR
EXTRN ExportCanvasASM:NEAR

.model small
.stack 100h

.data
; si const4.inc define data, aquí no va nada

.code

start:
    mov ax, @data
    mov ds, ax

    call InitVideo
    call InitPalette16
    call InitMouse
    call ShowMouseCursor

MainLoop:
    call ShowMainMenu
    call ShowEditor
    jmp MainLoop

ExitProgram:
    mov ax, 4C00h
    int 21h

end start
