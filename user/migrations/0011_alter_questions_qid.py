# Generated by Django 3.2.5 on 2022-03-13 10:13

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0010_auto_20220313_0115'),
    ]

    operations = [
        migrations.AlterField(
            model_name='questions',
            name='qid',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='user.question'),
        ),
    ]
