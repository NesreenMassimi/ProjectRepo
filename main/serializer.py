from rest_framework import serializers
from .models import User
from .models import UserProfile


class UserprofileSerializer(serializers.ModelSerializer):
    class Meta :
        model = UserProfile
        fields = ("weight", "height", "about", "license_number", "created", "updated", "id", "users")


class UserSerializer(serializers.ModelSerializer):

    profile = UserprofileSerializer(many=True,required=True)

    class Meta:
        model = User
        fields = ('id', 'first_name', 'last_name', 'email', 'password', 'user_type', 'created', 'updated', 'profile')
        extra_kwargs = {'password': {'write_only': True}}

    def create(self, validated_data):
        profile_data = validated_data.pop('profile')
        password = validated_data.pop('password')
        user = User(**validated_data)
        user.set_password(password)
        user.save()
        UserProfile.objects.create(user=user, **profile_data)
        UserProfile.objects.create(user=user, **profile_data)
        return user

    def to_representation(self, instance):
        response = super().to_representation(instance)
        response['profile'] = UserprofileSerializer(instance.profile).data
        return response











