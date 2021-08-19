import environ
from core.settings.settings import *


env = environ.Env(
    # set casting, default value
    DEBUG=(bool, True),
    SECRET_KEY=(str, 'mysecretkey'),
    ALLOWED_HOSTS=(list, "'*'"),
)

DEBUG = env('DEBUG')

SECRET_KEY = env('SECRET_KEY')

ALLOWED_HOSTS = env('ALLOWED_HOSTS')

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': '',
        'USER': '',
        'PASSWORD': '',
        'HOST': '',
        'PORT': '5432'
    }
}