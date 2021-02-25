set DJANGO_SETTINGS_MODULE=core.settings.localhost
set DEBUG=False
set ALLOWED_HOSTS=localhost,127.0.0.1

python -m waitress core.wsgi:application