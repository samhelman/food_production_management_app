from django.db import models

class ParentOrganisation(models.Model):
    pass

class ChildOrganisation(models.Model):
    parent = models.ForeignKey("organisations.ParentOrganisation", on_delete=models.CASCADE)
