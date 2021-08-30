from django.db import models

class Batch(models.Model):
    product = models.ForeignKey("configuration.ProductConfig", null=True, on_delete=models.SET_NULL)
    scheduled_start_date = models.DateField()