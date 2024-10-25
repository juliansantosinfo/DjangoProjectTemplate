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
        rm -rf ./databases/default.db.sqlite3
        rm -rf ./databases/development.db.sqlite3
        echo "Removing temp files"
        rm -rf ./tmp/*
fi

# create virtual env
echo ""
echo "-----------------------------------------------------------------------"
python3 -m venv venv
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

# Compile messages for locale
echo ""
echo "-----------------------------------------------------------------------"
./manage.py compilemessages -l pt_BR

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
