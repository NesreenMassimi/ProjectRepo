from main import views
from django.urls import path, include
from .views import UserListview

users = UserListview.as_view({
    'get': 'list',
    'post': 'create'
})
'''regester = Creteviewset.as_view(
 {
    'post':'createnew'

  })'''
user_details = UserListview.as_view(
 {  
     'get' : 'retrieve'
})

urlpatterns = [path('Users/', users,name='users'),
               path('Users/<int:pk>/',user_details,name='user_details')]