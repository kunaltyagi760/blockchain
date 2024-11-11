# blockchain_app/serializers.py
from rest_framework import serializers
from .models import Block, Transaction

class TransactionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Transaction
        fields = ['sender', 'recipient', 'amount']

class BlockSerializer(serializers.ModelSerializer):
    transactions = TransactionSerializer(many=True)

    class Meta:
        model = Block
        fields = ['index', 'timestamp', 'proof', 'previous_hash', 'transactions']
