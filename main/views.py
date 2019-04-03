from rest_framework import status
from rest_framework.response import Response
from main.models import User
from main.serializer import UserSerializer
from rest_framework import viewsets
from django.http import Http404



# Create your views here.

class UserListview(viewsets.ModelViewSet):
	queryset = User.objects.all()
	serializer_class = UserSerializer

	def list(self, request, **kwargs):

		all_users = User.objects.all()
		serializer = UserSerializer(all_users, many=True)
		return Response(serializer.data)

	def create(self, request, **kwargs):
		serializer = UserSerializer(data=request.data)
		if serializer.is_valid():
			serializer.save()
			return Response(serializer.data, status=status.HTTP_201_CREATED)
		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

	def destroy(self, request, *args, **kwargs):
		try:
			instance = self.get_object(*args)
			self.perform_destroy(instance)
			instance.delete()
		except Http404:
			pass
		return Response(status=status.HTTP_204_NO_CONTENT)







