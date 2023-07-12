# Generated by Django 3.2.5 on 2022-03-11 13:38

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0005_auto_20220311_2129'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='question',
            name='Exam',
        ),
        migrations.CreateModel(
            name='questions',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Exam', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='Examrecords', to='user.examrecord')),
                ('qid', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='user.question')),
            ],
        ),
    ]