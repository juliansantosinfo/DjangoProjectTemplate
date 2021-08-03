#! /bin/bash

# Migrate  database.
./manage.py makemigrations
./manage.py migrate
./manage.py collectstatic --noinput