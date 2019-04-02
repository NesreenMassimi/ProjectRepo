# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models
from django.contrib.auth.models import AbstractBaseUser

class Post(models.Model):
    content = models.TextField()
    created = models.DateField(blank=True, null=True)
    updated = models.DateField(blank=True, null=True)
    #id = models.AutoField(unique=True)
    speciality = models.ForeignKey('Speciality', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'post'


class Speciality(models.Model):
    code = models.CharField(unique=True, max_length=45)
    name = models.CharField(max_length=200)
    #category = models.ForeignKey('SpecialityCategory', models.DO_NOTHING)
    created = models.DateTimeField()
    updated = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'speciality'


class User(AbstractBaseUser):
    first_name = models.CharField(max_length=45)
    last_name = models.CharField(max_length=45, blank=True, null=True)
    email = models.EmailField(unique=True, max_length=45)
    #password = models.CharField(max_length=45)
    #last_login_date = models.DateTimeField(blank=True, null=True)
    user_type = models.CharField(max_length=45)
    created = models.DateField(blank=True, null=True)
    updated = models.DateField(blank=True, null=True)
    profile = models.OneToOneField('UserProfile', on_delete=models.CASCADE, related_name='User', blank=True, null=True)
    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []



    class Meta:
        managed = True
        db_table = 'user'


class UserEducation(models.Model):
    institution_name = models.IntegerField()
    start_date = models.DateField()
    end_date = models.DateField()
    created = models.DateField()
    updated = models.DateField()
    user = models.ForeignKey(User, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'user_education'


class UserProfile(models.Model):
    weight = models.FloatField()
    height = models.FloatField()
    about = models.TextField(blank=True, null=True)
    license_number = models.IntegerField(unique=True)
    created = models.DateField(blank=True, null=True)
    updated = models.DateField(blank=True, null=True)
    #id = models.AutoField(unique=True)
    users = models.ForeignKey(User, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'user_profile'
