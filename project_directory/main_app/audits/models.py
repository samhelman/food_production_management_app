from django.contrib.contenttypes.fields import GenericForeignKey
from django.contrib.contenttypes.models import ContentType
from django.db import models

class Note(models.Model):
    message = models.CharField(max_length=255)
    created_on = models.DateTimeField(auto_now_add=True)
    created_by = models.ForeignKey("users.User", null=True, on_delete=models.SET_NULL)

    # GENERIC FK
    content_type = models.ForeignKey(ContentType, on_delete=models.CASCADE)
    object_id = models.PositiveIntegerField()
    content_object = GenericForeignKey('content_type', 'object_id')
