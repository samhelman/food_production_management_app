from django.contrib.auth.models import AbstractUser
from django.core.exceptions import ValidationError
from django.db import models

from organisations.models import (
    ParentOrganisation,
    ChildOrganisation,
)

class User(AbstractUser):
    employer = models.ForeignKey(ParentOrganisation, on_delete=models.CASCADE)
    assigned_child_organisation = models.ForeignKey(ChildOrganisation, null=True, on_delete=models.SET_NULL)

    def clean_assigned_child_organisation(self):
        """
            Raises validation error if the assigned child_organisation's parent is not
            the same as the employer.
        """
        if assigned_child_organisation.parent != employer:
            raise(ValidationError("Assigned child organisation must be the same as the employer"))