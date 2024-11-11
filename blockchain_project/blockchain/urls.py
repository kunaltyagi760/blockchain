# blockchain_app/urls.py
from django.urls import path
from . import views

urlpatterns = [
    path('transactions/new/', views.new_transaction, name='new_transaction'),
    path('mine/', views.mine_block, name='mine_block'),
    path('chain/', views.full_chain, name='full_chain'),
]
