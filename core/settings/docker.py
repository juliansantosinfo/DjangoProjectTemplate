import environ
from core.settings.settings import *


env = environ.Env(
    # set casting, default value
    DEBUG=(bool, False),
    SECRET_KEY=(str, '{{secret_key}}'),
    ALLOWED_HOSTS=(list, "'*'"),
    CSRF_TRUSTED_ORIGINS=(list, "'https://*.127.0.0.1',"),
)

DEBUG = env('DEBUG')

SECRET_KEY = env('SECRET_KEY')

ALLOWED_HOSTS = env('ALLOWED_HOSTS')

CSRF_TRUSTED_ORIGINS=env('CSRF_TRUSTED_ORIGINS')

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'postgres',
        'USER': 'postgres',
        'PASSWORD': 'postgres',
        'HOST': 'postgres',
        'PORT': '5432'
    }
}