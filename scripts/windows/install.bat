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
rem Create virtual environment..
rem -----------------------------------------------------------------
pip install virtualenv
virtualenv venv
set path=%cd%\venv\Scripts;%path%
set PYTHONPATH=%cd%\venv\Scripts;%cd%\core

rem -----------------------------------------------------------------
rem Install requirements.
rem -----------------------------------------------------------------
pip install -r requirements.txt

rem -----------------------------------------------------------------
rem Apply migrations and collect static.
rem -----------------------------------------------------------------
python .\manage.py migrate
python .\manage.py collectstatic --noinput

rem -----------------------------------------------------------------
rem Install django-admin-interfaces themes.
rem -----------------------------------------------------------------
python .\manage.py loaddata admin_interface_theme_foundation.json

rem -----------------------------------------------------------------
rem Create Django Admin default data.
rem -----------------------------------------------------------------
python .\manage.py admin_initialize

pause