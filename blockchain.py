# import hashlib
# import json
# from time import time

# class Blockchain:

#     def __init__(self):
#         "This will store the blockchain"
#         self.chain = []
#         "List of Unconfirmed Transaction"
#         self.current_transactions = []
#         "creating genesis block"
#         self.new_block(proof= 100, prev_hash= "1")


#     def new_block(self, proof, prev_hash):
#         """
#         Create a new block and add it to the blockchain
#         :param proof: The proof given by the Proof of Work algorithm
#         :param previous_hash: Hash of the previous Block
#         :return: New Block
#         """

#         block = {
#             'index': len(self.chain) + 1,
#             'timestamp': time(),
#             'transactions': self.current_transactions,
#             'proof': proof,
#             'previous_hash': prev_hash or self.hash(self.chain[-1]),
#         }

#         # Reset the list of current transactions
#         self.current_transactions = []

#         # Add a new block to the chain
#         self.chain.append(block)
#         return block
    

#     def new_transaction(self, sender, recipient, amount):
#         """
#         Creates a new transaction to go into the next mined Block
#         :param sender: Address of the Sender
#         :param recipient: Address of the Recipient
#         :param amount: Amount
#         :return: The index of the Block that will hold this transaction
#         """

#         self.current_transactions.append({
#             'sender': sender,
#             'recipient': recipient,
#             'amount': amount,
#         })

#         return self.last_block['index'] + 1
    

#     @staticmethod
#     def hash(block):
#         """
#         Hashes a Block
#         :param block: Block
#         :return: <str>
#         """

#         # Convert the block into a JSON string and ensure it's ordered to have consistent hashes
#         block_string = json.dumps(block, sort_keys=True).encode()
#         return hashlib.sha256(block_string).hexdigest()
    
    
#     @property
#     def last_block(self):
#         # return the last block of chain
#         return self.chain[-1]
    

#     def proof_of_work(self, last_proof):
#         """
#         Simple Proof of Work Algorithm:
#          - Find a number p' such that hash(pp') contains leading 4 zeros
#          - p is the previous proof, and p' is the new proof
#         :param last_proof: <int>
#         :return: <int>
#         """

#         proof = 0
#         while self.valid_proof(last_proof, proof) is False:
#             proof+=1

#         return proof
    

#     @staticmethod
#     def valid_proof(last_proof, proof):
#         """
#         Validates the Proof
#         :param last_proof: <int> Previous Proof
#         :param proof: <int> Current Proof
#         :return: <bool> True if correct, False if not.
#         """

#         guess = f'{last_proof}{proof}'.encode()
#         guess_hash = hashlib.sha256(guess).hexdigest()
#         return guess_hash[:4] == "0000" # Adjust the number of leading zeros for difficulty
    

# # Instantiate the Blockchain
# blockchain = Blockchain()

# # Add some transactions
# blockchain.new_transaction('Karan', 'Kunal', 60)
# blockchain.new_transaction('Karan', 'Shivam', 70)

# # Mine a block
# last_proof = blockchain.last_block['proof']
# proof = blockchain.proof_of_work(last_proof)

# # Create a new block
# previoush_hash = blockchain.hash(blockchain.last_block)
# block = blockchain.new_block(proof, previoush_hash)

# print("new_block", block)
# print("blockchain", blockchain.chain)





import hashlib
import json
from time import time

class Blockchain:

    def __init__(self):
        print("Initializing Blockchain...")
        # This will store the blockchain
        self.chain = []
        # List of Unconfirmed Transactions
        self.current_transactions = []
        # Creating the genesis block
        print("Creating the genesis block...")
        self.new_block(proof=100, prev_hash="1")
        print("Genesis block created.\n")

    def new_block(self, proof, prev_hash=None):
        """
        Create a new block and add it to the blockchain
        :param proof: The proof given by the Proof of Work algorithm
        :param previous_hash: Hash of the previous Block
        :return: New Block
        """
        print(f"Creating a new block with proof: {proof} and previous hash: {prev_hash}")
        block = {
            'index': len(self.chain) + 1,
            'timestamp': time(),
            'transactions': self.current_transactions,
            'proof': proof,
            'previous_hash': prev_hash or self.hash(self.chain[-1]),
        }

        # Reset the list of current transactions
        self.current_transactions = []

        # Add a new block to the chain
        self.chain.append(block)
        print(f"Block created and added to chain: {block}\n")
        return block

    def new_transaction(self, sender, recipient, amount):
        """
        Creates a new transaction to go into the next mined Block
        :param sender: Address of the Sender
        :param recipient: Address of the Recipient
        :param amount: Amount
        :return: The index of the Block that will hold this transaction
        """
        print(f"Adding new transaction: Sender: {sender}, Recipient: {recipient}, Amount: {amount}")
        self.current_transactions.append({
            'sender': sender,
            'recipient': recipient,
            'amount': amount,
        })

        transaction_index = self.last_block['index'] + 1
        print(f"Transaction will be added to block index: {transaction_index}\n")
        return transaction_index

    @staticmethod
    def hash(block):
        """
        Hashes a Block
        :param block: Block
        :return: <str>
        """
        # Convert the block into a JSON string and ensure it's ordered to have consistent hashes
        block_string = json.dumps(block, sort_keys=True).encode()
        hashed_block = hashlib.sha256(block_string).hexdigest()
        print(f"Hashing block: {block}\nHash: {hashed_block}\n")
        return hashed_block

    @property
    def last_block(self):
        # Returns the last block of chain
        return self.chain[-1]

    def proof_of_work(self, last_proof):
        """
        Simple Proof of Work Algorithm:
         - Find a number p' such that hash(pp') contains leading 4 zeros
         - p is the previous proof, and p' is the new proof
        :param last_proof: <int>
        :return: <int>
        """
        print(f"Starting proof of work for last proof: {last_proof}")
        proof = 0
        while self.valid_proof(last_proof, proof) is False:
            proof += 1
        print(f"Proof of work found: {proof}\n")
        return proof

    @staticmethod
    def valid_proof(last_proof, proof):
        """
        Validates the Proof
        :param last_proof: <int> Previous Proof
        :param proof: <int> Current Proof
        :return: <bool> True if correct, False if not.
        """
        guess = f'{last_proof}{proof}'.encode()
        guess_hash = hashlib.sha256(guess).hexdigest()
        is_valid = guess_hash[:4] == "0000"
        return is_valid


# Instantiate the Blockchain
print("Creating a blockchain instance...\n")
blockchain = Blockchain()

# Add some transactions
print("Adding transactions...")
blockchain.new_transaction('Karan', 'Kunal', 60)
blockchain.new_transaction('Karan', 'Shivam', 70)

# Mine a block
print("Starting mining process...")
last_proof = blockchain.last_block['proof']
proof = blockchain.proof_of_work(last_proof)

# Create a new block
previous_hash = blockchain.hash(blockchain.last_block)
block = blockchain.new_block(proof, previous_hash)

print("New Block Mined:", block)
print("\nFull Blockchain:", blockchain.chain)
