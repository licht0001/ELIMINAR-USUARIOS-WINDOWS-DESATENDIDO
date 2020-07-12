@echo off
color 1F
mode 85,25
title ELIMIMAR USUARIOS WINDOWS DESATENDIDO
net localgroup administradores > usuariosADM.txt
cd "C:\Windows\System32\"
type usuariosADM.txt
for /F "skip=6 tokens=*" %%i in (usuariosADM.txt) do @echo %%i >> usuariosADM1.txt
cd "C:\Windows\System32\"
for /f "tokens=*" %%A in (usuariosADM1.txt) do (ECHO %%A |findstr /I /V "comando")>>usuariosADM2.txt
echo se ha MODIFICADO el archivo "usuariosADM.txt"
pause>nul
COPY usuariosADM2.txt usuariosADM.txt
DEL usuariosADM1.txt
DEL usuariosADM2.txt
rem ahora quitamos los usuarios que SI son ESTANDAR (EJEM. "ADMINISTRADOR")
cd "C:\Windows\System32\"
type usuariosADM.txt
pause>nul
for /f "tokens=*" %%A in (usuariosADM.txt) do (ECHO %%A |findstr /I /V "orlando administrador")>>usuariosADM1.txt
COPY usuariosADM1.txt usuariosADM.txt
DEL usuariosADM1.txt
TYPE usuariosADM.txt
pause>nul
for /f "tokens=1" %%a in (usuariosADM.txt) do (net localgroup administradores %%a /delete)
TYPE usuariosADM.txt
net localgroup administradores
pause>nul
for /f "tokens=1" %%a in (usuariosADM.txt) do (net user %%a /delete)
net user
pause>nul
ECHO TRABAJO REALIZADO CON EXITO!! SE ELIMINARON LOS USUARIOS FUERA DE ESTANDAR..
pause>nul
exit
