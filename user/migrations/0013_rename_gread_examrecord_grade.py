# Generated by Django 3.2.5 on 2022-04-27 14:50

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0012_auto_20220425_1331'),
    ]

    operations = [
        migrations.RenameField(
            model_name='examrecord',
            old_name='gread',
            new_name='grade',
        ),
    ]