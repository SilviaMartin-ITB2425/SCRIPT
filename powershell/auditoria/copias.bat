chcp 1252
@echo off

REM Realizar la copia en otro disco con la opcion /E (copia los subdirectorios)

robocopy C:\Oficinistes E:\Copies\Oficinistes /E /XD *.V6
robocopy C:\Fàbrica E:\Copies\Fàbrica /E /XD *.V6
robocopy C:\Director E:\Copies\Director /E /XD *.V6
echo Copia completada.
pause