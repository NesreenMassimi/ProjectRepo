from rest_framework import status
from django.contrib.auth import authenticate, login
from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from rest_framework_jwt.settings import api_settings
from rest_framework import permissions
from django.utils import timezone
from rest_framework.response import Response
from main.permissions import IsOwnerOrReadOnly
from main.models import User
from main.models import UserProfile
from main.models import UserEducation
from main.serializer import *
from rest_framework import viewsets
from django.http import Http404
jwt_payload_handler = api_settings.JWT_PAYLOAD_HANDLER
jwt_encode_handler = api_settings.JWT_ENCODE_HANDLER

# Create your views here.

class ListUsersView(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    permission_classes = (permissions.AllowAny,)


    def list(self, request, **kwargs):

        all_users = User.objects.all()
        serializer = UserSerializer(instance = all_users,many=True)
        return Response(serializer.data)

    def create(self, request, **kwargs):
        serializer = UserSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class UserListview(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    permission_classes = (permissions.IsAuthenticatedOrReadOnly,IsOwnerOrReadOnly)
    authentication_classes = (JSONWebTokenAuthentication, )

    def destroy(self, request, *args, **kwargs):
        try:
            instance = self.get_object()
            self.perform_destroy(instance)
            instance.delete()
        except Http404:
            pass
        return Response(status=status.HTTP_204_NO_CONTENT)

    def update(self, request, *args, **kwargs):
        try:
            instance = self.get_object()
        except Http404:
            return Response(status=status.HTTP_404_NOT_FOUND)

        serializer = UserUpdateSerializer(instance, data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_update(serializer)
        return Response(serializer.data, status=status.HTTP_204_NO_CONTENT)

    def to_representation(self, instance):
        response = super().to_representation(instance)
        response['profile'] = UserprofileSerializer(instance.profile).data

        # response['education'] = UserEducationSerializer(instance.education).data
        return response


class UserProfileView(viewsets.ModelViewSet):
    queryset = UserProfile.objects.all()
    serializer_class = UserProfileUpdateSerializer
    permission_classes = (permissions.IsAuthenticated,IsOwnerOrReadOnly)
    authentication_classes = (JSONWebTokenAuthentication, )

    def update(self, request, pk, **kwargs):
        try:
            user = User.objects.get(pk = pk)

        except Http404:
            return Response(status=status.HTTP_404_NOT_FOUND)

        serializer = UserProfileUpdateSerializer(user.profile, data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_update(serializer)
        return Response(serializer.data, status=status.HTTP_204_NO_CONTENT)


class UserEducationView(viewsets.ModelViewSet):
    queryset = UserEducation.objects.all()
    serializer_class = UserEducationSerializer
    permission_classes = (permissions.IsAuthenticatedOrReadOnly,IsOwnerOrReadOnly)
    authentication_classes = (JSONWebTokenAuthentication, )

    def list(self, request, **kwargs):

        all_users = UserEducation.objects.get()
        serializer = UserEducationSerializer(all_users, many=True)
        return Response(serializer.data)

    def create(self, request,pk):
        serializer = UserEducationSerializer(data=request.data)
        if serializer.is_valid():
            serializer.validated_data['user_id'] = pk
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def update(self, request, *args, **kwargs):
        try:
            instance=UserEducation.objects.get(pk =kwargs['pk2'])
            #instance = self.get_object()
        except Http404:
            return Response(status=status.HTTP_404_NOT_FOUND)

        serializer = UserEducationUpdateSerializer(instance, data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_update(serializer)
        return Response(serializer.data, status=status.HTTP_204_NO_CONTENT)

    def destroy(self, request, *args, **kwargs):
        try:
            instance=UserEducation.objects.get(pk =kwargs['pk2'])
            #instance = self.get_object()
            self.perform_destroy(instance)
            instance.delete()
        except Http404:
            return Response(status=status.HTTP_404_NOT_FOUND)

        return Response(status=status.HTTP_204_NO_CONTENT)


class LoginView(viewsets.ModelViewSet):
    permission_classes = (permissions.AllowAny,)
    queryset = User.objects.all()

    def create(self, request, *args, **kwargs):

        email = request.data.get("email")
        password = request.data.get("password")
        #user = authenticate(request, username=email, password = password)
        user = User.objects.get(email=email)
        print (user.email)
        print (user.password)
        print(password)
        if user.check_password(password):
            print(user.password)

            # login saves the user’s ID in the session,
            # using Django’s session framework.
            login(request, user)
            user.last_login = timezone.now()
            serializer = TokenSerializer(data={
                "token": jwt_encode_handler(
                    jwt_payload_handler(user)
                )})
            serializer.is_valid()
            return Response(serializer.data)
        return Response(status=status.HTTP_401_UNAUTHORIZED)
