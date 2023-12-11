from django.db import models
from django.contrib.auth.models import User
from django.utils.text import slugify  # Importa la función slugify

class Usuarios(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, null=True)
    username = models.CharField(max_length=14, null=True, verbose_name='Usuario')
    email = models.EmailField(max_length=140, null=True, verbose_name='Correo Electronico')
    first_name = models.CharField(max_length=40, null=True, verbose_name='Nombres')
    last_name = models.CharField(max_length=150, null=True, verbose_name='Apellidos')
    password1 = models.CharField(max_length=15, null=True, verbose_name='Contraseña')
    password2 = models.CharField(max_length=15, null=True, verbose_name='Confirmar Contraseña')

    def __str__(self):
        return self.username


    class Meta:
        verbose_name = "Usuarios"
        db_table = "Usuarios"
        ordering = ["id"]


class CategoriaTest(models.Model):
    nombre = models.CharField(verbose_name='Nombre', max_length=100)
    descripcion = models.TextField(verbose_name='Descripción')
    slug = models.SlugField(unique=True, blank=True, null=True)  # Agrega un campo Slug

    def save(self, *args, **kwargs):
        # Genera automáticamente el Slug a partir del nombre si no se proporciona
        if not self.slug:
            self.slug = slugify(self.nombre)
        super().save(*args, **kwargs)

    def __str__(self):
        return self.nombre
    
    class Meta:
        verbose_name = 'Categoría'
        verbose_name_plural = 'Categorías'
        db_table = 'category'
        ordering = ['id']


class Pregunta(models.Model):
    texto_pregunta = models.TextField()
    categoria = models.ForeignKey(CategoriaTest, on_delete=models.CASCADE)
    # Otros campos relacionados con las preguntas, como opciones de respuesta, puntajes, etc.

    def __str__(self):
        return self.texto_pregunta


class Respuesta(models.Model):
    pregunta = models.ForeignKey(Pregunta, on_delete=models.CASCADE)
    texto_respuesta = models.TextField()
    valor = models.DecimalField(max_digits=5, decimal_places=2)
    # Otros campos relacionados con las respuestas, como retroalimentación, etc.

    def __str__(self):
        return self.texto_respuesta


class Resultado(models.Model):
    titulo = models.CharField(max_length=100)
    descripcion = models.TextField()
    puntuacion_min = models.DecimalField(max_digits=5, decimal_places=2, default=0.0)  # Valor predeterminado agregado
    puntuacion_max = models.DecimalField(max_digits=5, decimal_places=2, default=0.0)  # Valor predeterminado agregado
    slug = models.SlugField(unique=True, blank=True, null=True)

    # Otros campos y métodos

    def __str__(self):
        return self.titulo

class ResultadoPregunta(models.Model):
    respuesta = models.ForeignKey(Respuesta, on_delete=models.CASCADE)
    resultado = models.ForeignKey(Resultado, on_delete=models.CASCADE)

    def __str__(self):
        return f"Resultado para {self.respuesta} -> {self.resultado}"

