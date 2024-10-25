#! /bin/bash

# Define files and paths
SCRIPT_FILE=$(readlink -f "$0")
SCRIPT_PATH=$(dirname "$SCRIPT_FILE")
ROOT_PATH=$(dirname "$SCRIPT_PATH")
SCRIPT_ID=$(pgrep -f "django_app")

# Check script is run
if [ "$SCRIPT_ID" != "" ] ; then
    exit
fi

# Check current directory
if [ "$PWD" != "$ROOT_PATH" ] ; then
    cd $ROOT_PATH
fi

# Check log file
if [ -f "$ROOT_PATH/logs/gunicorn.log" ]; then
    touch "$ROOT_PATH/logs/gunicorn.log"
fi

# Activate virtual env
source venv/bin/activate

# Create environment variables.
export DJANGO_SETTINGS_MODULE="core.settings.localhost"
export DEBUG=False
export ALLOWED_HOSTS=*

# start gunicorn server.
gunicorn core.wsgi --preload --reload --bind 0.0.0.0 --workers=2 --log-file logs/gunicorn.log --log-level 'info' --name django_app &
