import environ
from core.settings.settings import *


env = environ.Env(
    # set casting, default value
    DEBUG=(bool, False),
    SECRET_KEY=(str, '@r4xg#x-$uw($y13d&z1h_dku6=8n)u=s6zp#fcn2idsk@sr=4'),
    ALLOWED_HOSTS=(list, "'*'"),
)

DEBUG = env('DEBUG')

SECRET_KEY = env('SECRET_KEY')

ALLOWED_HOSTS = env('ALLOWED_HOSTS')