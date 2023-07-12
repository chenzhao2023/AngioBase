from django.db import models
from django.contrib.auth.models import User
class UserInfo(models.Model):
    #继承
    username = models.CharField(max_length=64)
    #昵称
    password = models.CharField(max_length=128)

