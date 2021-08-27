from django.apps import AppConfig
from django.utils.translation import gettext, gettext_lazy as _


class BackendConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'apps.backend'
