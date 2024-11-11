from django.db import models

class Transaction(models.Model):
    sender = models.CharField(max_length=100)
    recipient = models.CharField(max_length=100)
    amount = models.DecimalField(max_digits=10, decimal_places=2)

    def __str__(self):
        return f"{self.sender} -> {self.recipient}: {self.amount}"

class Block(models.Model):
    index = models.IntegerField()
    timestamp = models.DateTimeField(auto_now_add=True)
    proof = models.IntegerField()
    previous_hash = models.CharField(max_length=64)
    transactions = models.ManyToManyField(Transaction, related_name='blocks')

    def __str__(self):
        return f"Block {self.index}"

