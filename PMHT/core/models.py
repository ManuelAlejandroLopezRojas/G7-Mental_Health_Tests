# Create your models here.
from django.db import models
from django.contrib.auth.models import User
from django.contrib.auth.hashers import make_password, check_password
from django.utils.text import slugify
from datetime import datetime
from django.utils import timezone



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

class ResultadoUsuario(models.Model):
    usuario = models.ForeignKey(User, on_delete=models.CASCADE)
    fecha = models.DateTimeField(default=datetime.now)
    total_puntos = models.DecimalField(max_digits=100, decimal_places=2)

    def __str__(self):
        return f"Resultado para {self.usuario.username} el {self.fecha}"

    class Meta:
        ordering = ['-fecha']

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


class Usuarios(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, null=True)
    username = models.CharField(max_length=14, null=True, verbose_name='Usuario')
    email = models.EmailField(max_length=140, null=True, verbose_name='Correo Electronico')
    first_name = models.CharField(max_length=40, null=True, verbose_name='Nombres')
    last_name = models.CharField(max_length=150, null=True, verbose_name='Apellidos')
    password1 = models.CharField(max_length=15, null=True, verbose_name='Contraseña')
    password2 = models.CharField(max_length=15, null=True, verbose_name='Confirmar Contraseña')
    puntuacion = models.IntegerField(default=0)  # Campo para almacenar la puntuación


    def __str__(self):
        return self.username

    class Meta:
        verbose_name = "Usuarios"
        db_table = "Usuarios"
        ordering = ["id"]

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




# permisos de usuario
class UserProfile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    is_admin = models.BooleanField(default=False)

    def __str__(self):
        return self.user.username



class Puntuacion(models.Model):
    usuario = models.ForeignKey(User, on_delete=models.CASCADE)
    respuestas_correctas = models.IntegerField()
    fecha = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Puntuación de {self.usuario.username}: {self.respuestas_correctas} respuestas correctas"
    
class TiempoJuego(models.Model):
    usuario = models.ForeignKey('auth.User', on_delete=models.CASCADE)
    tiempo_en_milisegundos = models.IntegerField()

    def __str__(self):
        return f"Tiempo de {self.usuario}: {self.get_tiempo_formateado()}"

    def get_tiempo_formateado(self):
        minutos, segundos = divmod(self.tiempo_en_milisegundos // 1000, 60)
        return f"{minutos:02}:{segundos:02}.{self.tiempo_en_milisegundos % 1000:03}"
    
class Encuentro(models.Model):
    documento = models.CharField(max_length=50)
    nombre = models.CharField(max_length=100)
    nacido = models.IntegerField()
    hm = models.CharField(max_length=1)
    edad = models.CharField(max_length=10, default='adulto', blank=False)
    nombre_acompanante = models.CharField(max_length=100, blank=True, null=True, default='')
    tipo_acompanante = models.CharField(max_length=50, blank=True, null=True, default='')
    documento_acompanante = models.CharField(max_length=50, blank=True, null=True, default='')
    email = models.EmailField(default='', blank=False)
    telefono = models.CharField(max_length=15, default='', blank=False)
    razon = models.TextField(default='Determinado')
    aceptado = models.BooleanField(default=False)  # Campo para registrar si acepto los terminos y condiciones
    estado = models.CharField(max_length=20, choices=[('Pendiente', 'Pendiente'), ('Aprobado', 'Aprobado'), ('Rechazado', 'Rechazado')], default='Pendiente')
    timestamp_rechazo = models.DateTimeField(blank=True, null=True)



    # Nuevos campos agregados
    jornada = models.CharField(max_length=50, blank=True, null=True, default='')
    psicologo = models.CharField(max_length=100, blank=True, null=True, default='')
    fecha_encuentro = models.DateField(null=True, blank=True)
    fecha_creacion = models.DateTimeField(default=datetime.now)  # Campo para la fecha de creación

    def __str__(self):
        return self.nombre