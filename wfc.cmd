@echo off

if "%~1"=="" (
    echo �f�B���N�g���p�X���w�肳��Ă��܂���
    exit /b 1
)

if not "%2"=="in" if not "%2"=="out" (
    echo �ʐM�������w�肳��Ă��܂���Bin, out�̂����ꂩ���w�肵�Ă�������
    exit /b 1
)

if not "%3"=="allow" if not "%3"=="block" (
    echo �A�N�V�������w�肳��Ă��܂���Ballow, block�̂����ꂩ���w�肵�Ă�������
    exit /b 1
)

if "%~4"=="" (
    echo ���[�������w�肳��Ă��܂���
    exit /b 1
)


set TARGET_PATH=%~f1
set DIRECTION=%2
set ACTION=%3
set NAME=%~4

echo �^�[�Q�b�g�p�X : %TARGET_PATH%

for /R "%TARGET_PATH%" %%f in (*.exe) do (
    echo �Ώ�exe�t�@�C��: %%f
    echo ���O: %NAME% %%~nxf
    netsh advfirewall firewall add rule name="%NAME% %%~nxf" dir="%DIRECTION%" program="%%f" action="%ACTION%" profile=any
)
