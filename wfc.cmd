@echo off

if "%~1"=="" (
    echo ディレクトリパスが指定されていません
    exit /b 1
)

if not "%2"=="in" if not "%2"=="out" (
    echo 通信方向が指定されていません。in, outのいずれかを指定してください
    exit /b 1
)

if not "%3"=="allow" if not "%3"=="block" (
    echo アクションが指定されていません。allow, blockのいずれかを指定してください
    exit /b 1
)

if "%~4"=="" (
    echo ルール名が指定されていません
    exit /b 1
)


set TARGET_PATH=%~f1
set DIRECTION=%2
set ACTION=%3
set NAME=%~4

echo ターゲットパス : %TARGET_PATH%

for /R "%TARGET_PATH%" %%f in (*.exe) do (
    echo 対象exeファイル: %%f
    echo 名前: %NAME% %%~nxf
    netsh advfirewall firewall add rule name="%NAME% %%~nxf" dir="%DIRECTION%" program="%%f" action="%ACTION%" profile=any
)
