from main import views
from django.urls import path
from .views import UserListview
from .views import UserProfileView
from .views import UserEducationView

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

profile_details = UserProfileView.as_view (
    {
        'put' : 'update'
})

educations = UserEducationView.as_view({
    'get': 'list',
    'post':'create'

})
education_details = UserEducationView.as_view({
    'put': 'update',
    'delete': 'destroy'

})

urlpatterns = [path('Users/', users,name='users'),
               path('Users/<int:pk>/',user_details,name='user_details'),
               path('profiles/<int:pk>/', profile_details,name='profile_details'),
               path('Users/<int:pk>/education', educations, name='educations'),
               path('Users/education/<int:pk>/', education_details, name='education_details')
               ]

# Users/<int:pk>/