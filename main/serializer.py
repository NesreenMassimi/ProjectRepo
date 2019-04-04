from rest_framework import serializers
from .models import User
from .models import UserProfile


class UserprofileSerializer(serializers.ModelSerializer):
    class Meta :
        model = UserProfile
        fields = ("weight", "height", "license_number", "created", "updated")
        # exclude = ('users',)


class UserSerializer(serializers.ModelSerializer):

    profile = UserprofileSerializer(many=False)

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

    def update(self,validated_data ,**kwargs):
        instance = User(**validated_data)
        instance.email = instance.get('email',instance.email)
        instance.first_name = instance.get('first_name',instance.first_name)
        instance.last_name = instance.get('last_name',instance.last_name)
        instance.password = instance.get('password',instance.password)
        instance.user_type = instance.get('user_type',instance.user_type)
        instance.updated = instance.get('updated',instance.updated)

    def to_representation(self, instance):
        response = super().to_representation(instance)
        response['profile'] = UserprofileSerializer(instance.profile).data
        return response


class UserUpdateSerializer(serializers.ModelSerializer):
    class Meta :
        model = User
        exclude = ('created','profile')


class UserProfileUpdateSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserProfile
        exclude =('id', 'created')






    def update(self, validated_data,kwargs):

        instance = User(validated_data)
        instance.email = instance.get('email', instance.email)
        instance.first_name = instance.get('first_name', instance.first_name)
        instance.last_name = instance.get('last_name', instance.last_name)
        instance.password = instance.get('password', instance.password)
        instance.user_type = instance.get('user_type', instance.user_type)
        instance.updated = instance.get('updated', instance.updated)







