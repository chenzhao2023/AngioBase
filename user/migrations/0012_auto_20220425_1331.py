# Generated by Django 3.2.5 on 2022-04-25 05:31

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0011_alter_questions_qid'),
    ]

    operations = [
        migrations.AddField(
            model_name='examrecord',
            name='gread',
            field=models.CharField(default=0, max_length=150, null=True),
        ),
        migrations.AddField(
            model_name='questions',
            name='flag',
            field=models.CharField(default=0, max_length=256),
        ),
    ]
