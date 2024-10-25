# Define files and paths
$SCRIPT_FILE = (Get-Item -Path $PSCommandPath).FullName
$SCRIPT_PATH = Split-Path -Parent $SCRIPT_FILE
$ROOT_PATH = Split-Path -Parent $SCRIPT_PATH

# Note: pgrep is not natively available in PowerShell.
# You might need to find an alternative way to get the process ID based on the app name.
# For example, using 'Get-Process':
$SCRIPT_ID = (Get-Process -Name "django_app").Id
# Or, using 'Get-WmiObject':
#$SCRIPT_ID = (Get-WmiObject Win32_Process -Filter "Name = 'django_app'").ProcessID

# Check if the script is already running
if ($SCRIPT_ID) {
  exit
}

# Check current directory
if ($PWD -ne $ROOT_PATH) {
  cd $ROOT_PATH
}

# Check log file
if (Test-Path "$ROOT_PATH\logs\gunicorn.log") {
  New-Item -ItemType File -Path "$ROOT_PATH\logs\gunicorn.log" -Force
}

# Activate virtual env (Assuming 'venv' is in your PATH)
# or navigate and activate, for example:
# cd venv
# venv\Scripts\activate
# Consider setting 'env:PATH' to include the virtual env directory if it's not in your PATH.


# Create environment variables.
$env:DJANGO_SETTINGS_MODULE = "core.settings.localhost"
$env:DEBUG = $false
$env:ALLOWED_HOSTS = "*"

# start gunicorn server.
# replace '..' with the path to your executable
Invoke-Expression "..gunicorn core.wsgi --preload --reload --bind 0.0.0.0 --workers=2 --log-file logs/gunicorn.log --log-level 'debug' --name django_app &"

