from django.db import models

class Note(models.Model):
    message = models.CharField(max_length=255)
    created_on = models.DateTimeField(auto_now_add=True)
    created_by = models.ForeignKey("users.User", null=True, on_delete=models.SET_NULL)
