# Generated by Django 4.2.5 on 2023-09-21 23:29

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('first_name', models.CharField(max_length=40, verbose_name='Primer nombre')),
                ('second_name', models.CharField(max_length=40, verbose_name='Segundo nombre')),
                ('last_name', models.CharField(max_length=150, verbose_name='Apellidos')),
                ('id_doc', models.CharField(max_length=20, unique=True, verbose_name='Número de documento')),
                ('date_joined', models.DateTimeField(default=datetime.datetime.now, verbose_name='Fecha de registro')),
                ('date_creation', models.DateTimeField(auto_now=True)),
                ('date_updated', models.DateTimeField(auto_now_add=True)),
                ('age', models.PositiveIntegerField(default=0)),
                ('salary', models.DecimalField(decimal_places=2, default=0.0, max_digits=9)),
                ('state', models.BooleanField(default=True)),
                ('photo', models.ImageField(blank=True, null=True, upload_to='photo/%Y/%m/%d')),
                ('file', models.FileField(blank=True, null=True, upload_to='file/%Y/%m/%d')),
            ],
            options={
                'verbose_name': 'Usuario',
                'verbose_name_plural': 'Usuarios',
                'db_table': 'usuario',
                'ordering': ['id'],
            },
        ),
    ]
