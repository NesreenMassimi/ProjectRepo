from main import views
from django.urls import path
from .views import UserListview

users = UserListview.as_view({
    'get': 'list',
    'post': 'create'
})

user_details = UserListview.as_view(
 {
     'get' : 'retrieve',
     'delete': 'destroy',
     'put' : 'update'

 })



urlpatterns = [path('Users/', users,name='users'),
               path('Users/<int:pk>/',user_details,name='user_details')]
