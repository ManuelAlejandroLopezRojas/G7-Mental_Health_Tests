# Create your models here.
from django.db import models
from django.contrib.auth.models import User
from django.contrib.auth.hashers import make_password, check_password
from django.utils.text import slugify

class DailyTest(models.Model):
    usuario = models.ForeignKey(User, on_delete=models.CASCADE)
    fecha = models.DateField(auto_now_add=True)

class Question(models.Model):
    texto_pregunta = models.TextField()

    def __str__(self):
        return self.texto_pregunta

class Answer(models.Model):
    question = models.ForeignKey(Question, on_delete=models.CASCADE, default=1)  # Utiliza el ID de la pregunta que deseas asignar por defecto
    texto_respuesta = models.TextField()
    tipo_respuesta = models.CharField(max_length=10)  # 'positiva', 'media' o 'mala'

    def __str__(self):
        return self.texto_respuesta

class DailyTestResponse(models.Model):
    daily_test = models.ForeignKey(DailyTest, on_delete=models.CASCADE)
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    selected_answer = models.ForeignKey(Answer, on_delete=models.CASCADE)

class DailyTestResult(models.Model):
    daily_test = models.OneToOneField(DailyTest, on_delete=models.CASCADE)
    count_positive = models.IntegerField(default=0)
    count_neutral = models.IntegerField(default=0)
    count_negative = models.IntegerField(default=0)

class DailyTestHistory(models.Model):
    usuario = models.ForeignKey(User, on_delete=models.CASCADE)
    fecha = models.DateField()
    result = models.OneToOneField(DailyTestResult, on_delete=models.CASCADE)

    def __str__(self):
        return f"Test diario de {self.usuario.username} - {self.fecha}"
