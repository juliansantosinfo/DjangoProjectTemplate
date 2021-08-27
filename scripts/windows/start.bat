@echo off

cls

echo ADICIONANDO PYTHON AO PATH DO WINDOWS.
echo ...

set path=%cd%\venv\Scripts;%path%
set PYTHONPATH=%cd%\venv\Scripts;%cd%\core

echo LOCALIZANDO IP DA MAQUINA.
echo ...
echo    Endereco IPv4. . . . . . . .  . . . . . . . : 127.0.0.1
ipconfig | findstr IPv4
echo ...

set DJANGO_SETTINGS_MODULE=core.settings.localhost
set DEBUG=False
set ALLOWED_HOSTS=*

python -m waitress --host=0.0.0.0 --port=8000 core.wsgi:application

pause