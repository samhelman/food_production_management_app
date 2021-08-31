from django.contrib import admin

from configuration.models import (
    ProductConfig,
    RecipeConfig,
    RecipeStepConfig,
)

admin.site.register(ProductConfig)
admin.site.register(RecipeConfig)
admin.site.register(RecipeStepConfig)