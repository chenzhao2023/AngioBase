# Generated by Django 2.0.patient1 on 2021-11-03 07:56

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('AngioBaseA', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='userinfo',
            name='user',
        ),
        migrations.DeleteModel(
            name='UserInfo',
        ),
    ]
