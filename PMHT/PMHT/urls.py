"""
URL configuration for PMHT project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from .views import  CalendarioPsicologoView, agendamiento_encuentro, mostrar_encuentros, EventosCalendarioView
from . import views


urlpatterns = [
    path('', views.login_view, name='login'),
    path('juego1', views.juego1, name='juego1'),
    path('juego2', views.juego2, name='juego2'),
    path('juego3', views.juego3, name='juego3'),

    path('logout', views.logout_view, name='logout'),
    path('registro', views.register, name='register'),
    path('inicio', views.inicio, name='inicio'),

    path('categoria/<int:categoria_id>/', views.categoria_detalle, name='categoria_detalle'),
    path('categoria/<int:categoria_id>/preguntas/', views.preguntas_categoria, name='preguntas_categoria'),
    path('categoria/<int:categoria_id>/calcular_resultado/', views.calcular_resultado, name='calcular_resultado'),
    path('categoria/<int:categoria_id>/mostrar_resultado/<int:resultado_id>/', views.mostrar_resultado, name='mostrar_resultado'),
    path('resultado_no_encontrado/', views.resultado_no_encontrado, name='resultado_no_encontrado'),
    path('admin/', admin.site.urls),
    
    path('mostrar_encuentros/', mostrar_encuentros, name='mostrar_encuentros'),
    path('calendario/', CalendarioPsicologoView.as_view(), name='calendario_psicologo'),
    path('agendar_encuentro/', agendamiento_encuentro, name='agendar_encuentro'),
    path('eventos-calendario/', EventosCalendarioView.as_view(), name='eventos_calendario'),
   










]
