from django.db import models

class AbstractConfig(models.Model):
    class Meta:
        abstract = True

    code = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    description = models.CharField(max_length=255)
    created_on = models.DateTimeField(auto_now_add=True)
    created_by = models.ForeignKey(
        "users.User", 
        null=True, 
        related_name="%(class)s_created_by",
        on_delete=models.SET_NULL
    )
    updated_on = models.DateTimeField(auto_now_add=True)
    updated_by = models.ForeignKey(
        "users.User", 
        null=True,
        related_name="%(class)s_updated_by",
        on_delete=models.SET_NULL
    )
    active = models.BooleanField()

    def __str__(self):
        return self.name

class ProductConfig(AbstractConfig):
    pass

class RecipeConfig(AbstractConfig):
    product = models.ForeignKey("configuration.ProductConfig", on_delete=models.CASCADE)

class RecipeStepConfig(AbstractConfig):
    recipe = models.ForeignKey("configuration.RecipeConfig", on_delete=models.CASCADE)