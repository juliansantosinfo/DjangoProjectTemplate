import requests
from django.core.management.base import BaseCommand, CommandError
from django.contrib.auth.models import User

class Command(BaseCommand):
    help = 'Add user admin to DjangoAdmin interface.'

    def handle(self, *args, **options):
        
        # Add user admin
        superuser = User.objects.create_superuser(
            username="admin",
            email="",
            password="admin")
        superuser.save()
        self.stdout.write(self.style.SUCCESS('Add user admin in database.'))