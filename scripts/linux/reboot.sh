#! /bin/bash

# Define files and paths
APP_NAME="django_app"
SCRIPT_FILE=$(readlink -f "$0")
SCRIPT_PATH=$(dirname "$SCRIPT_FILE")
START_FILE=$SCRIPT_PATH/start.sh
STOP_FILE=$SCRIPT_PATH/stop.sh
ROOT_PATH=$(dirname "$SCRIPT_PATH")
SCRIPT_ID=$(pgrep -f "$APP_NAME")

# Run stop script
$STOP_FILE

# Run start script
$START_FILE
