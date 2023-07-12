from django.contrib.auth.forms import UserCreationForm, UserChangeForm , AuthenticationForm ,PasswordChangeForm
from django.contrib.auth.models import User
from django import forms

class loginform(AuthenticationForm):
    pass

class editform(UserChangeForm):
    nickname = forms.CharField(required=False, max_length=50)
    phonenumber = forms.CharField(required=False, max_length=20)
    money = forms.FloatField(required=False)
    delivery_address = forms.CharField(required=False,max_length=50)
    signature = forms.CharField(required=False, max_length=50)
    img_url = forms.CharField(max_length=150,required=False)
    recharged_money = forms.FloatField(required=False )
    gender = forms.CharField(required=False, max_length=50)
    class Meta:
        model = User
        fields = ('username', 'password', 'email', 'nickname', 'phonenumber', 'money', 'delivery_address','signature')
        # fields = ('__all__')

    def __int__(self, *args, **kwargs):
        super().__int__(*args, **kwargs)
        self.fields['username'].error_messages = {'unique': '用户名已存在', 'invaild': '格式不对'}


class selfform(UserCreationForm):
    nickname = forms.CharField(required=False, max_length=50)
    class Meta:
        model = User
        fields = ('username', 'password1', 'password2', 'email', 'nickname')
        # fields = ('__all__')

    def __int__(self, *args, **kwargs):
        super().__int__(*args, **kwargs)
        self.fields['username'].error_messages = {'unique': '用户名已存在', 'invaild': '格式不对'}
