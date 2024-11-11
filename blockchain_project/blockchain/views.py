# blockchain_app/views.py
from rest_framework.decorators import api_view
from rest_framework.response import Response
from .blockchain import Blockchain
from .models import Block
from .serializers import BlockSerializer

blockchain = Blockchain()

@api_view(['POST'])
def new_transaction(request):
    data = request.data
    required = ['sender', 'recipient', 'amount']
    if not all(k in data for k in required):
        return Response({'message': 'Missing values'}, status=400)
    
    index = blockchain.new_transaction(data['sender'], data['recipient'], data['amount'])
    return Response({'message': f'Transaction will be added to Block {index}'})

@api_view(['GET'])
def mine_block(request):
    last_block = Block.objects.latest('id')
    proof = blockchain.proof_of_work(last_block.proof)
    previous_hash = blockchain.hash(last_block)
    block = blockchain.new_block(proof, previous_hash)
    serializer = BlockSerializer(block)
    return Response({
        'message': 'New Block Mined!',
        'block': serializer.data
    })

@api_view(['GET'])
def full_chain(request):
    blocks = Block.objects.all()
    serializer = BlockSerializer(blocks, many=True)
    return Response({
        'chain': serializer.data,
        'length': len(serializer.data)
    })
