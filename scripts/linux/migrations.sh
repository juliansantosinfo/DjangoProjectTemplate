#! /bin/bash

# Migrate  database.
./manage.py makemigrations backend
./manage.py makemigrations
./manage.py migrate
./manage.py collectstatic --noinput