import environ
from core.settings.settings import *


env = environ.Env()

DEBUG = env.bool("DEBUG", False)  # Set debug mode to False by default

# Use a secure default SECRET_KEY or obtain one from a dedicated service
SECRET_KEY = env.str("SECRET_KEY", "YOUR_SECURE_SECRET_KEY_HERE")

ALLOWED_HOSTS = env.list("ALLOWED_HOSTS")  # No default value, must be specified

# Always use a secure default for CSRF_TRUSTED_ORIGINS, never use '*'
# Replace with your actual trusted origins
CSRF_TRUSTED_ORIGINS = env.list("CSRF_TRUSTED_ORIGINS") 

# Configure your database settings
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': env.str("DATABASE_NAME", ""),
        'USER': env.str("DATABASE_USER", ""),
        'PASSWORD': env.str("DATABASE_PASSWORD", ""),
        'HOST': env.str("DATABASE_HOST", ""),
        'PORT': env.int("DATABASE_PORT", 5432),
    }
}