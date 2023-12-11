from django.shortcuts import render, get_object_or_404, redirect
from django.shortcuts import redirect

from django.contrib import messages
from django.contrib.auth import login, logout, authenticate

from django.contrib.auth.models import User

from .forms import RegisterForm

from django.contrib.auth.decorators import login_required, user_passes_test

from core.models import CategoriaTest, Pregunta, Respuesta, Resultado

from django.http import Http404

def is_admin(user):
    return user.is_superuser

def is_not_admin(user):
    return not user.is_superuser

def login_view (request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')

        user = authenticate(username=username, password=password)

        if user:
            login(request, user)
            messages.success(request, 'Bienvenido {}'.format(user.username))
            return redirect('inicio')
        else: 
            messages.error(request, 'Usuario o contraseña incorrectos')
    return render(request, 'login.html',{
    })

def logout_view (request):
    logout(request)
    return redirect('login')

def register (request):
    form = RegisterForm(request.POST or None)

    if request.method == 'POST' and form.is_valid():
        username = form.cleaned_data.get('username')
        email = form.cleaned_data.get('email')
        password = form.cleaned_data.get('password')
        first_name = form.cleaned_data.get('first_name')
        last_name = form.cleaned_data.get('last_name')
        
        user = User.objects.create_user(
            username=username,
            email=email,
            password=password,
            first_name=first_name,
            last_name=last_name, )

        if user:
            login(request, user)
            messages.success(request, 'Usuario Creado Exitosamente')
            return redirect('inicio')

    return render(request, 'register.html',{
        'form': form
    })
@login_required
def inicio(request):
    
    categoriatest = CategoriaTest.objects.all()

    if is_admin(request.user):
        return redirect('admin:index')
    return render(request, 'inicio.html', {
        'categoriatest': categoriatest,

    })
@login_required
def categoria_detalle(request, categoria_id):
    categoria = get_object_or_404(CategoriaTest, id=categoria_id)
    return render(request, 'categoria_detalle.html', {'categoria': categoria})
@login_required
def preguntas_categoria(request, categoria_id):
    categoria = get_object_or_404(CategoriaTest, id=categoria_id)
    preguntas = Pregunta.objects.filter(categoria=categoria)
    return render(request, 'preguntas_categoria.html', {'categoria': categoria, 'preguntas': preguntas})
@login_required
def calcular_resultado(request, categoria_id):
    if request.method == 'POST':
        # Obtén todas las respuestas enviadas en el formulario
        respuestas_seleccionadas = request.POST

        # Inicializa una variable para la puntuación total
        puntuacion_total = 0

        # Recorre todas las respuestas seleccionadas
        for key, value in respuestas_seleccionadas.items():
            if key.startswith('pregunta_'):
                respuesta_id = int(value)
                respuesta = Respuesta.objects.get(id=respuesta_id)
                puntuacion_total += respuesta.valor

        # Determina el resultado en función de la puntuación total
        resultado_id = determinar_resultado(puntuacion_total)

        # Verifica si no se encontró un resultado específico y redirige a una página de error
        if resultado_id is None:
            return render(request, 'resultado_no_encontrado.html')  # Crea este template

        # Redirige a la vista de mostrar resultado
        return redirect('mostrar_resultado', categoria_id=categoria_id, resultado_id=resultado_id)
@login_required
def determinar_resultado(puntuacion_total):
    resultados = Resultado.objects.all()
    for resultado in resultados:
        if resultado.puntuacion_min <= puntuacion_total <= resultado.puntuacion_max:
            return resultado.id
    # Si no coincide con ningún resultado, devuelve un valor predeterminado (puedes ajustarlo según tus necesidades)
    return 0  # Por ejemplo, 0 representa "Sin resultado"
@login_required
def mostrar_resultado(request, categoria_id, resultado_id):
    if resultado_id == 0:  # O el valor que represente la falta de un resultado específico
        raise Http404("No se encontró un resultado para esta puntuación.")
    resultado = get_object_or_404(Resultado, id=resultado_id)
    return render(request, 'mostrar_resultado.html', {'resultado': resultado})
@login_required
def resultado_no_encontrado(request):
    return render(request, 'resultado_no_encontrado.html')
