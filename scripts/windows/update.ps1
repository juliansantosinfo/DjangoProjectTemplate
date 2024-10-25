# Update fonts from GitHUb
Write-Host ""
Write-Host "-----------------------------------------------------------------------"
git pull --all

# create virtual env
Write-Host ""
Write-Host "-----------------------------------------------------------------------"
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
