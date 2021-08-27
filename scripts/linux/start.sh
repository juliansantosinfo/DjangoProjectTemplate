#! /bin/bash

# Activate virtual env
source venv/bin/activate

# Create environment variables.
export DJANGO_SETTINGS_MODULE="core.settings.localhost"
export DEBUG=False
export ALLOWED_HOSTS=*

# start gunicorn server.
gunicorn core.wsgi --log-file -