#! /bin/bash

# Update and install requirements.
pip install --upgrade pip
pip install -r ./requirements.txt

# Migrate  database.
./manage.py makemigrations
./manage.py migrate

# Collect static files.
./manage.py collectstatic

# Install django-admin-interfaces themes.
./manage.py loaddata admin_interface_theme_django.json
./manage.py loaddata admin_interface_theme_bootstrap.json
./manage.py loaddata admin_interface_theme_foundation.json
./manage.py loaddata admin_interface_theme_uswds.json