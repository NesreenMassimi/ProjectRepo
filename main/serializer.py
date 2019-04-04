from rest_framework import serializers
from .models import User
from .models import UserProfile
from .models import UserEducation


class UserprofileSerializer(serializers.ModelSerializer):
    class Meta :
        model = UserProfile
        fields = ("weight", "height", "license_number", "created", "updated")
        # exclude = ('users',)

class UserEducationSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserEducation
        fields = ('id', 'institution_name', 'start_date', 'end_date', 'created', 'updated','user')

        def create(self,validated_data):
            edu = UserEducation(**validated_data)
            edu.save()
            return edu

class UserSerializer(serializers.ModelSerializer):

    profile = UserprofileSerializer(many=False)
    education = UserEducationSerializer(many=True)


    class Meta:
        model = User
        fields = ('id', 'first_name', 'last_name', 'email', 'password', 'user_type', 'created', 'updated', 'profile',
                  'education')
        extra_kwargs = {'password': {'write_only': True}}

    def create(self, validated_data):
        profile_data = validated_data.pop('profile')
        education_data = validated_data.pop('education')
        password = validated_data.pop('password')
        user = User(**validated_data)
        user.set_password(password)
        user.save()
        for education_data in education_data:
            education = UserEducation.objects.create(user=user, **education_data)
        UserProfile.objects.create(user=user, **profile_data)
        return user

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


class UserEducationUpdateSerializer(serializers.ModelSerializer):
    class Meta :
        model = UserEducation
        exclude =('id','created')









