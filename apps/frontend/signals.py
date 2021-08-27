from django.dispatch import receiver
from django.db.models.signals import (
    pre_init, post_init, pre_save, post_save, pre_delete, 
    post_delete, pre_migrate, post_migrate, class_prepared, m2m_changed
)


# Register your signals here.
