from rest_framework import serializers
from .models import User
from .models import UserProfile
from .models import UserEducation


class TokenSerializer(serializers.ModelSerializer):
    class Meta:
        model=User
        fields=('token',)
    token = serializers.CharField(max_length=255)


class UserprofileSerializer(serializers.ModelSerializer):
    class Meta :
        model = UserProfile
        fields = ('id', "weight", "height","about", "license_number", "created", "updated","users_id")
        # exclude = ('users',)

class UserEducationSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserEducation
        fields = ('id', 'institution_name', 'start_date', 'end_date', 'created', 'updated','user_id')


class UserSerializer(serializers.ModelSerializer):

    profile = UserprofileSerializer(many=False,required=True)
    educations = UserEducationSerializer(many=True,required=False)

    class Meta:
        model = User
        fields = ('id', 'first_name', 'last_name', 'email', 'password', 'user_type', 'created', 'updated','last_login','profile','educations')
        #extra_kwargs = {'password': {'write_only': True}}
        extra_kwargs={'id':{'read_only':True},'password':{'write_only':True}}

    def create(self, validated_data):
        profile_data = validated_data.pop('profile')
        password = validated_data.pop('password')
        user = User.objects.create(**validated_data)
        user.set_password(password)
        user.save()
        profile_data['users_id'] = user.id
        prof = UserProfile.objects.create(**profile_data)
        user.profile_id = prof.id
        return user


class UserUpdateSerializer(serializers.ModelSerializer):
    class Meta :
        model = User
        exclude = ('id','created')


class UserProfileUpdateSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserProfile
        exclude =('id', 'created')


class UserEducationUpdateSerializer(serializers.ModelSerializer):
    class Meta :
        model = UserEducation
        exclude =('id','created','user')









