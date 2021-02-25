@echo off

rem -----------------------------------------------------------------
rem Update PIP and install requirements.
rem -----------------------------------------------------------------
python -m pip install --upgrade pip
python -m pip install -r .\requirements.txt

rem -----------------------------------------------------------------
rem Apply migrations and collect static.
rem -----------------------------------------------------------------
python manage.py migrate
python manage.py collectstatic

rem -----------------------------------------------------------------
rem Install django-admin-interfaces themes.
rem -----------------------------------------------------------------
python manage.py loaddata admin_interface_theme_django.json
python manage.py loaddata admin_interface_theme_bootstrap.json
python manage.py loaddata admin_interface_theme_foundation.json
python manage.py loaddata admin_interface_theme_uswds.json

rem -----------------------------------------------------------------
rem Create Django Admin superuser.
rem -----------------------------------------------------------------
python manage.py createsuperuser