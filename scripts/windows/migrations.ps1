# Migrate  database.
Write-Host ""
Write-Host "-----------------------------------------------------------------------"
./manage.py makemigrations
./manage.py migrate
./manage.py collectstatic --noinput
