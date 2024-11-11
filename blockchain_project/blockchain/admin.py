from django.contrib import admin
from .models import Transaction, Block

admin.site.register(Block)
admin.site.register(Transaction)

# Register your models here.
