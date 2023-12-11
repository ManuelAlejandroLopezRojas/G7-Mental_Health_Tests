# Create your models here.
from django.db import models
from django.contrib.auth.models import User
from django.contrib.auth.hashers import make_password, check_password
from django.utils.text import slugify

class CategoriaTest(models.Model):
    nombre = models.CharField(verbose_name='Nombre', max_length=100)
    descripcion = models.TextField(verbose_name='Descripción')
    slug = models.SlugField(unique=True, blank=True, null=True)

    def save(self, *args, **kwargs):
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

    def __str__(self):
        return self.texto_pregunta

class Respuesta(models.Model):
    pregunta = models.ForeignKey(Pregunta, on_delete=models.CASCADE)
    texto_respuesta = models.TextField()
    valor = models.DecimalField(max_digits=5, decimal_places=2)

    def __str__(self):
        return self.texto_respuesta

class Resultado(models.Model):
    titulo = models.CharField(max_length=100)
    descripcion = models.TextField()
    puntuacion_min = models.DecimalField(max_digits=5, decimal_places=2, default=0.0)
    puntuacion_max = models.DecimalField(max_digits=5, decimal_places=2, default=0.0)
    slug = models.SlugField(unique=True, blank=True, null=True)

    def __str__(self):
        return self.titulo

class ResultadoPregunta(models.Model):
    respuesta = models.ForeignKey(Respuesta, on_delete=models.CASCADE)
    resultado = models.ForeignKey(Resultado, on_delete=models.CASCADE)

    def __str__(self):
        return f"Resultado para {self.respuesta} -> {self.resultado}"

######
class Evento(models.Model):
    title = models.CharField(max_length=255)
    start = models.DateTimeField()
    color = models.CharField(max_length=20)
    editable = models.BooleanField(default=True)

    def __str__(self):
        return self.title
# En core/models.py
# Define las opciones una vez para ser reutilizadas
DOCUMENTO_CHOICES = [
    ('Cedula de ciudadania', 'C.C'),
    ('tarjeta de identidad', 'T.I'),
    ('Cedula de extranjeria', 'C.T'),
    ('Permiso Especial de Permanencia', 'P.P'),
    ('Permiso por proteccion temporal', 'P.T'),
]

JORNADA_CHOICES = [
    ('mañana', 'Jornada de la Mañana (6 AM - 12 PM)'),
    ('tarde', 'Jornada de la Tarde (1 PM - 6 PM)'),
    ('noche', 'Jornada de la Noche (7 PM - 10 PM)'),
    ('madrugada', 'Jornada de la Madrugada (10 PM - 6 AM)'),
    ('finesdesemana', 'Jornada de Fines de semana (8 AM - 5 PM)'),
]

PSICOLOGO_CHOICES = [
    ('Maria Camila Vega', 'Maria Camila Vega'),
    ('Rosa Telma Cortes', 'Rosa Telma Cortes'),
    ('Daniela Ortiz', 'Daniela Ortiz'),
    ('Magerli Flores', 'Magerli Flores'),
    # Agrega más psicólogos según sea necesario
]

class Evento(models.Model):
    title = models.CharField(max_length=255)
    start = models.DateTimeField()
    color = models.CharField(max_length=20)
    editable = models.BooleanField(default=True)

    def __str__(self):
        return self.title

class Encuentro(models.Model):
    documento = models.CharField(max_length=31, choices=DOCUMENTO_CHOICES)
    nombre = models.CharField(max_length=255)
    nacido = models.IntegerField()
    hm = models.CharField(max_length=1)
    edad = models.CharField(max_length=10)
    nombre_acompanante = models.CharField(max_length=100, blank=True, null=True)
    tipo_acompanante = models.CharField(max_length=20, choices=[('tutor', 'Tutor'), ('representante', 'Representante')], blank=True, null=True)
    documento_acompanante = models.CharField(max_length=20, blank=True, null=True)
    email = models.EmailField()
    telefono = models.CharField(max_length=10)
    jornada = models.CharField(max_length=20, choices=JORNADA_CHOICES)
    psicologo = models.CharField(max_length=100, choices=PSICOLOGO_CHOICES)
    fecha_encuentro = models.DateField()
    razon = models.TextField()
    acepta_terminos = models.BooleanField()

    def __str__(self):
        return f"{self.nombre} - {self.fecha_encuentro}"

    class Meta:
        verbose_name_plural = 'Encuentros'
# permisos de usuario
class UserProfile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    is_admin = models.BooleanField(default=False)

    def __str__(self):
        return self.user.username