# perform a clean install
Write-Host ""
Write-Host "-----------------------------------------------------------------------"
$cleaninstall = Read-Host "Perform a clean install, current data will be lost? : "
if ($cleaninstall -eq "y") {
  Write-Host "Removing virtual environment"
  Remove-Item -Path ./venv -Recurse -Force
  Write-Host "Removing static files"
  Remove-Item -Path ./static -Recurse -Force
  Write-Host "Removing database"
  Remove-Item -Path ./databases/default.db.sqlite3 -Force
  Remove-Item -Path ./databases/development.db.sqlite3 -Force
  Write-Host "Removing temp files"
  Remove-Item -Path ./tmp\* -Recurse -Force
}

# create virtual env
Write-Host ""
Write-Host "-----------------------------------------------------------------------"
# Assuming Python is installed
python -m venv venv
# Assuming you have 'venv' activated in your PATH environment variable
# It's better to activate the environment within the script, but it depends on your needs
# For example:
# $env:PATH = "$env:PATH;$env:USERPROFILE\venv\Scripts" 
# Or, use a dedicated function for activation within the script.
# However, I'm omitting the activation syntax here, as it could vary based on your setup.

# Update and install requirements.
Write-Host ""
Write-Host "-----------------------------------------------------------------------"
# Assuming pip.exe is in your PATH
pip install -r ./requirements.txt

# Migrate  database.
Write-Host ""
Write-Host "-----------------------------------------------------------------------"
./manage.py makemigrations
./manage.py migrate

# Collect static files.
Write-Host ""
Write-Host "-----------------------------------------------------------------------"
./manage.py collectstatic --noinput

# Compile messages for locale
Write-Host ""
Write-Host "-----------------------------------------------------------------------"
./manage.py compilemessages -l pt_BR

# Install django-admin-interfaces themes.
Write-Host ""
Write-Host "-----------------------------------------------------------------------"
$installtheme = Read-Host "Install extra theme for django-admin-interfaces? : "
if ($installtheme -eq "y") {
  ./manage.py loaddata admin_interface_theme_django.json
  ./manage.py loaddata admin_interface_theme_bootstrap.json
  ./manage.py loaddata admin_interface_theme_uswds.json
  ./manage.py loaddata admin_interface_theme_foundation.json
}
