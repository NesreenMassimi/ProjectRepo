# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models
from django.contrib.auth.models import AbstractBaseUser
from django.contrib.auth.models import BaseUserManager


class Post(models.Model):
    content = models.TextField()
    created = models.DateField(blank=True, null=True)
    updated = models.DateField(blank=True, null=True)
    speciality = models.ForeignKey('Speciality', models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'post'


class Speciality(models.Model):
    code = models.CharField(unique=True, max_length=45)
    name = models.CharField(max_length=200)
    created = models.DateTimeField()
    updated = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'speciality'


class User(AbstractBaseUser):
    first_name = models.CharField(max_length=45)
    last_name = models.CharField(max_length=45)
    email = models.CharField(unique=True, max_length=45)
    user_type = models.CharField(max_length=45)
    created = models.DateField(auto_now_add=True)
    updated = models.DateField(auto_now=True)
    last_login = models.DateTimeField(blank=True, null=True)
    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []

    objects = BaseUserManager()
    class Meta:
        managed = True
        db_table = 'user'

class UserEducation(models.Model):

    institution_name = models.CharField(max_length=45)
    start_date = models.DateField()
    end_date = models.DateField()
    created = models.DateField(auto_now_add=True)
    updated = models.DateField(auto_now=True)
    user = models.ForeignKey(User,models.DO_NOTHING,related_name='educations' ,blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'user_education'


class UserProfile(models.Model):
    weight = models.FloatField()
    height = models.FloatField()
    about = models.TextField(blank=True, null=True)
    license_number = models.IntegerField(unique=True)
    created = models.DateField(auto_now_add=True)
    updated = models.DateField(auto_now=True)
    users = models.OneToOneField(User, models.DO_NOTHING, blank=True, null=True,related_name='profile')

    class Meta:
        managed = False
        db_table = 'user_profile'
