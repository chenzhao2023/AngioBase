# Generated by Django 3.2.5 on 2022-02-08 12:22

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('user', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='views_count',
            name='nid',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='user.notice'),
        ),
        migrations.AlterField(
            model_name='views_count',
            name='uid',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
        ),
    ]
