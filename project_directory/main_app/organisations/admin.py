from django.contrib import admin

from organisations.models import (
    ParentOrganisation,
    ChildOrganisation,
)

admin.site.register(ParentOrganisation)
admin.site.register(ChildOrganisation)