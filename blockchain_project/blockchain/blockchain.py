import hashlib
import json
from time import time
from .models import Block, Transaction


class Blockchain:

    def __init__(self):
        self.current_transactions = []
        if not Block.objects.exists():
            self.create_genesis_block()

    def create_genesis_block(self):
        self.new_block(proof=100, prev_hash="1")

    def new_block(self, proof, prev_hash):
        block = Block.objects.create(
            index = Block.objects.count() + 1,
            proof = proof,
            previous_hash = prev_hash
        )

        block.transactions.set(self.current_transactions)
        block.save()
        self.current_transactions = []
        return block
    
    def new_transaction(self, sender, recipient, amount):
        transaction = Transaction.objects.create(
            sender=sender,
            recipient=recipient,
            amount=amount
        )
        self.current_transactions.append(transaction)
        return Block.objects.count() + 1
    
    @staticmethod
    def hash(block):
        block_data = json.dumps({
            'index': block.index,
            'timestamp': str(block.timestamp),
            'proof': block.proof,
            'previous_hash': block.previous_hash
        }, sort_keys=True).encode()

        return hashlib.sha256(block_data).hexdigest()
    
    def proof_of_work(self, last_proof):
        proof = 0
        while not self.valid_proof(last_proof, proof):
            proof += 1
        return proof

    @staticmethod
    def valid_proof(last_proof, proof):
        guess = f'{last_proof}{proof}'.encode()
        guess_hash = hashlib.sha256(guess).hexdigest()
        return guess_hash[:4] == "0000"

