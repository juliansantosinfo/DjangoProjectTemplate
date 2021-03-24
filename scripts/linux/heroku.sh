#! /bin/bash

# login in heroku
read -p "Login in Heroku? : " login
if [[ $login == "y" ]]
    then
        heroku login
fi

# Push changes to heroku.
read -p "Deploy changes in Heroku? : " deploy
if [[ $deploy == "y" ]]
    then
        git checkout main
        git push heroku main
fi

# Migrate  database.
heroku run ./manage.py makemigrations backend && ./manage.py migrate

# Install django-admin-interfaces themes.
heroku run ./manage.py loaddata admin_interface_theme_foundation.json

# Create superuser.
heroku run ./manage.py admin_initialize

# fakedatabase
read -p "Generate fake database? : " fakedatabase
if [[ $fakedatabase == "y" ]]
    then
        # Initialize fake database to customers/vendors.
        heroku run ./manage.py customers_initialize_fakedatabase && ./manage.py vendors_initialize_fakedatabase
fi

# Show app info
heroku apps:info

# fakedatabase
read -p "Open app in browser? : " open
if [[ $open == "y" ]]
    then
        heroku apps:open
fi