#! /bin/bash

# Update and Instal library requirements
if apk info gettext &> /dev/null; then
    apk update
    apk add gettext
fi

# Change to workarea.
cd /usr/srv/app

# Install requirements.tx
pip install -r ./requirements.txt

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
gunicorn core.wsgi --preload --reload --bind 0.0.0.0 --workers=4 --log-file - --log-level 'debug' --name djmec
