# Generated by Django 3.2.16 on 2023-02-26 09:15

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0019_betainfo'),
    ]

    operations = [
        migrations.AlterField(
            model_name='notice',
            name='title',
            field=models.CharField(max_length=50, verbose_name='标题 '),
        ),
    ]
