@echo off
title Batch Optimization Menu

:: Check for administrative privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process cmd -ArgumentList '/c %~dpnx0' -Verb RunAs"
    exit /b
)

:: Menu to ask if the user wants to run all optimizations
:menu
cls
echo ==============================
echo       Optimization Menu
echo ==============================
echo 1. Run All Optimizations
echo 2. Exit
echo ==============================
set /p choice=Please enter your choice (1-2): 

if %choice%==1 goto run_optimizations
if %choice%==2 goto exit
goto invalid

:run_optimizations
echo Running all optimizations...
rem Run the optimizations
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies" /f
reg delete "HKCU\Software\Microsoft\WindowsSelfHost" /f
reg delete "HKCU\Software\Policies" /f
reg delete "HKLM\Software\Microsoft\Policies" /f
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies" /f
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate" /f
reg delete "HKLM\Software\Microsoft\WindowsSelfHost" /f
reg delete "HKLM\Software\Policies" /f
reg delete "HKLM\Software\WOW6432Node\Microsoft\Policies" /f
reg delete "HKLM\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Policies" /f
reg delete "HKLM\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate" /f

echo Thank you for using this file. The following optimizations were performed:
echo - Deleted "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies"
echo - Deleted "HKCU\Software\Microsoft\WindowsSelfHost"
echo - Deleted "HKCU\Software\Policies"
echo - Deleted "HKLM\Software\Microsoft\Policies"
echo - Deleted "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies"
echo - Deleted "HKLM\Software\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate"
echo - Deleted "HKLM\Software\Microsoft\WindowsSelfHost"
echo - Deleted "HKLM\Software\Policies"
echo - Deleted "HKLM\Software\WOW6432Node\Microsoft\Policies"
echo - Deleted "HKLM\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Policies"
echo - Deleted "HKLM\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate"
pause
cls
goto menu

:exit
echo Exiting...
pause
exit

:invalid
echo Invalid choice, please select a valid option.
pause
goto menu