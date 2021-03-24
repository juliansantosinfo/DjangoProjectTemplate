from environ import Env
from core.settings.settings import *

env = Env()

DEBUG = env.bool('DEBUG')

SECRET_KEY = env('SECRET_KEY')

ALLOWED_HOSTS = env.list('ALLOWED_HOSTS')

DATABASES = {
    'default': env.db(),
}
