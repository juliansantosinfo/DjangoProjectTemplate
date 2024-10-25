web: gunicorn core.wsgi --preload --reload --bind 0.0.0.0 --workers=4 --log-file - --log-level 'debug' --name djmec
migrate: ./manage.py makemigrations && ./manage.py migrate
collectstatic: ./manage.py collectstatic --noinput
compilemessages: ./manage.py compilemessages
