from django.contrib import admin
from .models import CategoriaTest, Pregunta, Respuesta, Resultado, Evento

@admin.register(CategoriaTest)
class CategoriaTestAdmin(admin.ModelAdmin):
    list_display = ('nombre', 'descripcion', 'slug')
    search_fields = ('nombre', 'descripcion')

@admin.register(Pregunta)
class PreguntaAdmin(admin.ModelAdmin):
    list_display = ('texto_pregunta', 'categoria')
    list_filter = ('categoria',)

@admin.register(Respuesta)
class RespuestaAdmin(admin.ModelAdmin):
    list_display = ('pregunta', 'texto_respuesta', 'valor')
    list_filter = ('pregunta',)

@admin.register(Resultado)
class ResultadoAdmin(admin.ModelAdmin):
    list_display = ('titulo', 'puntuacion_min', 'puntuacion_max')
    search_fields = ('titulo',)

@admin.register(Evento)
class EventoAdmin(admin.ModelAdmin):
    list_display = ('title', 'start', 'color', 'editable')
    search_fields = ['title']