# login in heroku
$login = Read-Host "Login in Heroku? : "
if ($login -eq 'y') {
  heroku login
}

# Push changes to heroku.
$deploy = Read-Host "Deploy changes in Heroku? : "
if ($deploy -eq 'y') {
  git checkout main 
  git push heroku main
}

# Migrate  database.
heroku run ./manage.py makemigrations backend && ./manage.py migrate

# Install django-admin-interfaces themes.
heroku run ./manage.py loaddata admin_interface_theme_foundation.json

# Show app info
heroku apps:info

# Open app
$open = Read-Host "Open app in browser? : "
if ($open -eq 'y') {
  heroku apps:open
}
