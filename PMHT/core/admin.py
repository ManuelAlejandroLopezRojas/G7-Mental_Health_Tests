from django.contrib import admin
from .models import CategoriaTest, Pregunta, Respuesta, Resultado, ResultadoUsuario, Puntuacion, TiempoJuego, Encuentro

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

@admin.register(ResultadoUsuario)
class ResultadoUsuarioAdmin(admin.ModelAdmin):
    list_display = ['usuario', 'fecha', 'total_puntos']
    search_fields = ['usuario__username']  # Permite buscar por nombre de usuario en el admin
    list_filter = ['usuario__username']



class PuntuacionJuegoAdmin(admin.ModelAdmin):
    list_display = ('usuario', 'respuestas_correctas', 'fecha',)
    search_fields = ('jugador__username',)
    list_filter = ('fecha',)

admin.site.register(Puntuacion, PuntuacionJuegoAdmin)

class TiempoJuegoAdmin(admin.ModelAdmin):
    list_display = ('usuario', 'get_tiempo')  # Reemplaza 'tiempo' con el método 'get_tiempo'
    list_filter = ('usuario',)  # Asegúrate de que 'usuario' sea un campo válido en el modelo

    def get_tiempo(self, obj):
        return obj.get_tiempo_formateado()  # Llama al método para obtener el tiempo formateado

    get_tiempo.short_description = 'Tiempo'  # Nombre que se mostrará en la interfaz admin

admin.site.register(TiempoJuego, TiempoJuegoAdmin)

class EncuentroAdmin(admin.ModelAdmin):
    list_display = ('nombre', 'fecha_creacion', 'fecha_encuentro', 'aceptado')  # Columnas que se mostrarán en el admin
    list_filter = ('aceptado',)  # Agrega un filtro para mostrar encuentros aceptados o rechazados


admin.site.register(Encuentro, EncuentroAdmin)