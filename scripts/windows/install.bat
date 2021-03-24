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
rem Install python embed
rem -----------------------------------------------------------------
.\scripts\windows\7z\7za.exe x .\scripts\windows\python.zip
set path=%cd%\python;%cd%\python\wkhtmltox\bin;%path%
set PYTHONPATH=%cd%;%cd%\core

rem -----------------------------------------------------------------
rem Recreate database.
rem -----------------------------------------------------------------

if exist db.sqlite3 (

	echo ------------------------------------------------
	echo LOCALIZANDO BANCO DE DADOS.
	echo ...
	timeout 1 > nul

	choice /C sn /M "BANCO DE DADOS LOCALIZADO, GOSTARIA DE RECRIAR?, TODOS OS DADOS SERAO PERDIDOS"
	IF ERRORLEVEL 1 SET choice=s
	IF ERRORLEVEL 2 SET choice=n

	if "%choice%" == "s" (

		echo ------------------------------------------------
		echo EXCLUINDO BANCO DE DADOS.
		echo ...
		timeout 1 > nul

		del /s /q db.sqlite3

		echo ------------------------------------------------
		echo EXCLUINDO DIRETORIO STATIC.
		echo ...
		timeout 1 > nul

		rmdir /s /q static
	)
)

rem -----------------------------------------------------------------
rem Apply migrations and collect static.
rem -----------------------------------------------------------------
python .\manage.py makemigrations backend
python .\manage.py makemigrations frontend
python .\manage.py makemigrations
python .\manage.py migrate
python .\manage.py collectstatic --noinput

rem -----------------------------------------------------------------
rem Install django-admin-interfaces themes.
rem -----------------------------------------------------------------
python .\manage.py loaddata admin_interface_theme_foundation.json

rem -----------------------------------------------------------------
rem Create Django Admin superuser.
rem -----------------------------------------------------------------
python .\manage.py admin_initialize