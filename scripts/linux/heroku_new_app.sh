#! /bin/bash

# login in heroku
read -p "Login in Heroku? : " login
if [[ $login == "y" ]]
    then
        heroku login
fi

# create new app.
read -p "App name? : " app_name
if [[ $app_name != "" ]]
    then
        heroku create $app_name
fi

# create postgres database.
read -p "Create postgres database? : " create_postgres
if [[ $create_postgres == "y" ]]
    then
        heroku addons:create heroku-postgresql:hobby-dev
fi


# environment variables.
heroku config:set DJANGO_SETTINGS_MODULE=core.settings.heroku
heroku config:set DEBUG=False
heroku config:set SECRET_KEY='mysecretkey'
heroku config:set ALLOWED_HOSTS=*

# set ALLOWED_HOSTS.
read -p "ALLOWED_HOSTS to heroku app? : " url_hosts
if [[ $url_hosts != "" ]]
    then
        heroku config:set ALLOWED_HOSTS=$url_hosts
fi

git checkout master
git push heroku master

# Migrate  database.
heroku run ./manage.py makemigrations && ./manage.py migrate

# Install django-admin-interfaces themes.
heroku run ./manage.py loaddata admin_interface_theme_foundation.json

# Create superuser.
read -p "Initialize database default? : " createadmin
if [[ $createadmin == "y" ]]
    then
        heroku run ./manage.py initialize_database
fi

# Show app info
heroku apps:info

# Open app
read -p "Open app in browser? : " open
if [[ $open == "y" ]]
    then
        heroku apps:open
fi