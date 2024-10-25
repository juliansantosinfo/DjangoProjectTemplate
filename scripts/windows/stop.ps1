# Define files and paths
$APP_NAME = "django_app"

# Note: pgrep is not natively available in PowerShell.
# You might need to find an alternative way to get the process ID based on the app name.
# For example, using 'Get-Process':
$SCRIPT_ID = (Get-Process -Name "django_app").Id
# Or, using 'Get-WmiObject':
#$SCRIPT_ID = (Get-WmiObject Win32_Process -Filter "Name = 'django_app'").ProcessID

# Check if the script is already running and stop
if ($SCRIPT_ID) {
  # killall "gunicorn: master [$APP_NAME]"
  # This command is not directly available in PowerShell.
  # You can find all the processes with the 'gunicorn' name and kill them.
  Get-Process -Name "gunicorn" | ForEach-Object { $_.Kill() }
  
  # Alternatively, you can utilize a more specific process filter 
  # using 'Get-WmiObject' and searching for ProcessName like "gunicorn: master [django_app]":
  Get-WmiObject Win32_Process -Filter "Name like 'gunicorn: master %django_app%'" | 
    ForEach-Object {$_.Terminate()}
}

