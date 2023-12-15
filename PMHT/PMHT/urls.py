from django.contrib import admin
from django.urls import path
from .views import  agendar_encuentro, mostrar_resultado
from . import views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    # URLs para las vistas de la aplicación

    # Guardar tiempo del juego
    path('guardar_tiempo/', views.guardar_tiempo, name='guardar_tiempo'),
    path('clasificacion_tiempo', views.tabla_tiempo, name='clasificacion_tiempo'),

    # Guardar puntuación
    path('guardar_puntuacion/', views.guardar_puntuacion, name='guardar_puntuacion'),

    # Mostrar clasificación
    path('clasificacion/', views.mostrar_clasificacion, name='clasificacion'),

    # Otras URLs de la aplicación
    path('', views.login_view, name='login'),
    path('registro', views.register, name='register'),  
    path('logout', views.logout_view, name='logout'),
    path('inicio', views.inicio, name='inicio'),  
    path('admin/', admin.site.urls),      

    path('juego1', views.juego1, name='juego1'),
    path('juego2', views.juego2, name='juego2'),
    path('juego3', views.juego3, name='juego3'),

    path('categoria/<int:categoria_id>/', views.categoria_detalle, name='categoria_detalle'),
    path('categoria/<int:categoria_id>/preguntas/', views.preguntas_categoria, name='preguntas_categoria'),
    path('categoria/<int:categoria_id>/calcular_resultado/', views.calcular_resultado, name='calcular_resultado'),
    path('categoria/<int:categoria_id>/mostrar_resultado/<int:resultado_id>/', views.mostrar_resultado, name='mostrar_resultado'),
    path('resultado_no_encontrado/', views.resultado_no_encontrado, name='resultado_no_encontrado'),


    # Otras vistas relacionadas con encuentros y calendario
    path('agendar_encuentro/', agendar_encuentro, name='agendar_encuentro'),
    path('calendario', views.calendario_psicologo, name='calendario'),
    path('eventos_calendario/', views.eventos_calendario, name='eventos_calendario'),



]
