# Generated by Django 3.2.9 on 2021-11-03 14:15

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('AngioBaseA', '0003_userinfo'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='userinfo',
            options={},
        ),
        migrations.RenameField(
            model_name='userinfo',
            old_name='passwprd',
            new_name='passwpod',
        ),
        migrations.RemoveField(
            model_name='userinfo',
            name='phone',
        ),
    ]
