@echo off

cls

rem -----------------------------------------------------------------
rem Valid folder
rem -----------------------------------------------------------------
if not exist manage.py (
	echo ------------------------------------------------
	echo ESSE ARQUIVO DE SER EXECUTADO NO DIRETORIO RAIZ.
	pause
	exit
)

rem -----------------------------------------------------------------
rem Add python to path windows.
rem -----------------------------------------------------------------

echo ------------------------------------------------
echo ADICIONANDO PYTHON AO PATH DO WINDOWS.
echo ...
timeout 1 > nul

set path=%cd%\python;%cd%\python\wkhtmltox\bin;%path%
set PYTHONPATH=%cd%;%cd%\core

rem -----------------------------------------------------------------
rem Apply migrations and collect static.
rem -----------------------------------------------------------------
python .\manage.py makemigrations backend
python .\manage.py makemigrations
python .\manage.py migrate
python .\manage.py collectstatic --noinput

pause