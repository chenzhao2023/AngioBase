# Generated by Django 3.2.16 on 2023-07-12 13:10

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0020_alter_notice_title'),
    ]

    operations = [
        migrations.CreateModel(
            name='Case',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('case', models.CharField(max_length=60)),
            ],
            options={
                'db_table': 'case',
            },
        ),
        migrations.AlterField(
            model_name='img',
            name='img',
            field=models.CharField(max_length=5000, null=True),
        ),
        migrations.AlterField(
            model_name='question',
            name='explanation',
            field=models.TextField(max_length=5000),
        ),
        migrations.CreateModel(
            name='CltCase',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('clt_relation_case', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='user.case')),
                ('who_clt', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='user.userform')),
            ],
            options={
                'db_table': 'cltcase',
            },
        ),
    ]
