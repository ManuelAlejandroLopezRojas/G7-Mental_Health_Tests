from django.contrib import admin
from .models import CategoriaTest, Pregunta, Respuesta, Resultado, Evento, RespuestaUsuario

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
class RespuestaUsuarioAdmin(admin.ModelAdmin):
    list_display = ['usuario', 'pregunta', 'respuesta_seleccionada', 'fecha_respuesta']
    readonly_fields = ['usuario', 'pregunta', 'respuesta_seleccionada', 'fecha_respuesta']
    list_filter = ('usuario',)

admin.site.register(RespuestaUsuario, RespuestaUsuarioAdmin)

@admin.register(Evento)
class EventoAdmin(admin.ModelAdmin):
    list_display = ('title', 'start', 'color', 'editable')
    search_fields = ['title']