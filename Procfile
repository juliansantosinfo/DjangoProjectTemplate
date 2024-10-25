web: gunicorn core.wsgi --preload --reload --bind 0.0.0.0 --workers=2 --log-file logs/gunicorn.log --log-level 'info' --name django_app
migrate: ./manage.py makemigrations && ./manage.py migrate
collectstatic: ./manage.py collectstatic --noinput
compilemessages: ./manage.py compilemessages
