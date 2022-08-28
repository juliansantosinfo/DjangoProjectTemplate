#! /bin/bash

# Update fonts from GitHUb
echo ""
echo "-----------------------------------------------------------------------"
git pull --all

# create virtual env
echo ""
echo "-----------------------------------------------------------------------"
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
