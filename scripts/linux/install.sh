#! /bin/bash

# perform a clean install
echo ""
echo "-----------------------------------------------------------------------"
read -p "Perform a clean install, current data will be lost? : " cleaninstall
if [[ $cleaninstall == "y" ]]
    then 
        echo "Removing virtual environment"
        rm -rf ./venv
        echo "Removing static files"
        rm -rf ./static
        echo "Removing database"
        rm -rf ./db.sqlite3
fi

# create virtual env
echo ""
echo "-----------------------------------------------------------------------"
virtualenv venv --python=python3.8
source venv/bin/activate

# Update and install requirements.
echo ""
echo "-----------------------------------------------------------------------"
pip install --upgrade pip
pip install -r ./requirements.txt

# Migrate  database.
echo ""
echo "-----------------------------------------------------------------------"
./manage.py makemigrations backend
./manage.py makemigrations
./manage.py migrate

# Collect static files.
echo ""
echo "-----------------------------------------------------------------------"
./manage.py collectstatic --noinput

# Install django-admin-interfaces themes.
echo ""
echo "-----------------------------------------------------------------------"
read -p "Install extra theme for django-admin-interfaces? : " installtheme
if [[ $installtheme == "y" ]]
    then
        ./manage.py loaddata admin_interface_theme_django.json
        ./manage.py loaddata admin_interface_theme_bootstrap.json
        ./manage.py loaddata admin_interface_theme_uswds.json
fi
./manage.py loaddata admin_interface_theme_foundation.json

# Create superuser.
echo ""
echo "-----------------------------------------------------------------------"
read -p "Create superuser admin? : " createadmin
if [[ $createadmin == "y" ]]
    then
        ./manage.py admin_initialize
fi