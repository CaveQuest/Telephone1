@echo off
asm68k /o op+ /o os+ /o ow+ /o oz+ /o oaq+ /o osq+ /o omq+ /q /p /o ae- sonic1.asm, s1built.bin
rompad.exe s1built.bin 255 0
fixheadr.exe s1built.bin
pause