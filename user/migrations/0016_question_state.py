# Generated by Django 3.2.5 on 2022-05-14 13:42

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0015_questions_answer'),
    ]

    operations = [
        migrations.AddField(
            model_name='question',
            name='state',
            field=models.CharField(default=1, max_length=256, null=True),
        ),
    ]