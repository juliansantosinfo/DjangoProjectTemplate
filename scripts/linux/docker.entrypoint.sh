#! /bin/bash

# Change to workarea.
cd /usr/srv/app

# Create environment variables.
source .env

# Migrate  database.
./manage.py makemigrations
./manage.py migrate

# Collect static files
./manage.py collectstatic --noinput

# Compile messages for locale
./manage.py compilemessages

# Start gunicorn server.
gunicorn core.wsgi --preload --reload --bind 0.0.0.0 --workers=4 --log-file - --log-level 'info' --name djmec
