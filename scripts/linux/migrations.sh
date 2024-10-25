#! /bin/bash

# Migrate  database.
echo ""
echo "-----------------------------------------------------------------------"
./manage.py makemigrations
./manage.py migrate
./manage.py collectstatic --noinput