# Define files and paths
$APP_NAME = "django_app"
$SCRIPT_FILE = (Get-Item -Path $PSCommandPath).FullName
$SCRIPT_PATH = Split-Path -Parent $SCRIPT_FILE
$START_FILE = Join-Path $SCRIPT_PATH start.ps1
$STOP_FILE = Join-Path $SCRIPT_PATH stop.ps1
$ROOT_PATH = Split-Path -Parent $SCRIPT_PATH

# Note: pgrep is not natively available in PowerShell.
# If you have WSL or MSYS2, you could try using 'Invoke-Expression' to run pgrep,
# but this might not work reliably. 
# You might need to find an alternative way to get the process ID based on the app name.

# Run stop script (replace with your stop logic)
Invoke-Expression "$STOP_FILE"

# Run start script (replace with your start logic)
Invoke-Expression "$START_FILE"
