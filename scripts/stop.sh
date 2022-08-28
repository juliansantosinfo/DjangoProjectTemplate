#! /bin/bash

# Define files and paths
APP_NAME="django_app"
SCRIPT_ID=$(pgrep -f "$APP_NAME")

# Check script is run and stop
if [ "$SCRIPT_ID" != "" ] ; then
    killall "gunicorn: master [$APP_NAME]"
fi
