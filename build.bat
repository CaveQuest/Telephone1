@echo off
asm68k /m /p sonic1.asm, s1built.bin, , .lst > err.txt
type err.txt

REM check if built file does not exist. If does not, show error and pause. Else continue and exit.
IF NOT EXIST s1built.bin goto LABLERR
REM rompad.exe s1built.bin 255 0 <- nope, not padding ROM here, you silly people :V
fixheadr.exe s1built.bin
goto EOF

:LABLERR
pause
