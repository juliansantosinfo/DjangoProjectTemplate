# login in heroku
# Using 'Read-Host' instead of 'read' for user input
$login = Read-Host "Login in Heroku? : "
if ($login -eq 'y') {
  heroku login
}

# create new app.
$app_name = Read-Host "App name? : "
if ($app_name) {
  heroku create $app_name
}

# create postgres database.
$create_postgres = Read-Host "Create postgres database? : "
if ($create_postgres -eq 'y') {
  heroku addons:create heroku-postgresql:hobby-dev
}

# environment variables.
heroku config:set DJANGO_SETTINGS_MODULE=core.settings.heroku
heroku config:set DEBUG=False
heroku config:set SECRET_KEY='mysecretkey'
heroku config:set ALLOWED_HOSTS=*

# set ALLOWED_HOSTS.
$url_hosts = Read-Host "ALLOWED_HOSTS to heroku app? : "
if ($url_hosts) {
  heroku config:set ALLOWED_HOSTS=$url_hosts
}

# Assuming Git is installed and configured
git checkout master
git push heroku master

# Migrate  database.
heroku run ./manage.py makemigrations && ./manage.py migrate

# Install django-admin-interfaces themes.
heroku run ./manage.py loaddata admin_interface_theme_foundation.json

# Create superuser. 
$createadmin = Read-Host "Initialize database default? : "
if ($createadmin -eq 'y') {
  heroku run ./manage.py initialize_database
}

# Show app info
heroku apps:info

# Open app
$open = Read-Host "Open app in browser? : "
if ($open -eq 'y') {
  heroku apps:open
}
