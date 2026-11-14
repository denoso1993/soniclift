@echo off
setlocal
title SonicLift - site local
cd /d "%~dp0"

echo.
echo  SonicLift site  -^>  http://127.0.0.1:8765/
echo  Feche esta janela para parar o servidor.
echo.

start /b cmd /c "timeout /t 2 >nul & start http://127.0.0.1:8765/"

where py >nul 2>nul
if %errorlevel%==0 (
  py -m http.server 8765 --bind 127.0.0.1
  goto :end
)

where python >nul 2>nul
if %errorlevel%==0 (
  python -m http.server 8765 --bind 127.0.0.1
  goto :end
)

echo Python nao encontrado.
echo Abra o arquivo index.html diretamente no navegador.
pause

:end
endlocal
