from rest_framework import permissions
from main.models import User

class IsOwnerOrReadOnly(permissions.BasePermission):
    """
    Custom permission to only allow owners of an object to edit it.
    """
    def has_permission(self, request, view):
        obj = User.objects.get(pk=view.kwargs['pk'])
        return obj.email == request.user.email

    def has_object_permission(self, request, view, obj):
        print("in has object permission")
        """
        Return True if permission is granted, False otherwise.
        """
        if request.method in permissions.SAFE_METHODS: # SAFE_METHODS = GET,HEAD,OPTIONS
            return True

        # Write permissions are only allowed to the owner of the snippet.
        else :
            return request.user and request.user.is_authenticated