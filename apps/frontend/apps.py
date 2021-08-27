from django.apps import AppConfig
from django.utils.translation import gettext, gettext_lazy as _


class FrontendConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'apps.frontend'
