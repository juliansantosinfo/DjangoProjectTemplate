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
        echo "Removing temp files"
        rm -rf ./tmp/*
fi

# create virtual env
echo ""
echo "-----------------------------------------------------------------------"
virtualenv venv
source venv/bin/activate

# Update and install requirements.
echo ""
echo "-----------------------------------------------------------------------"
pip install -r ./requirements.txt

# Migrate  database.
echo ""
echo "-----------------------------------------------------------------------"
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
        ./manage.py loaddata admin_interface_theme_foundation.json
fi
