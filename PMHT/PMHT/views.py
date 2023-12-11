from django.shortcuts import render, get_object_or_404, redirect

from django.contrib import messages
from django.contrib.auth import login, logout, authenticate

from django.contrib.auth.models import User

from .forms import RegisterForm, EncuentroForm

from django.contrib.auth.decorators import login_required, user_passes_test

from django.http import Http404, JsonResponse

from core.models import CategoriaTest, Pregunta, Respuesta, Resultado, Encuentro, Evento
from django.db.models import Count

from django.views import View


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
def juego1(request):
    return render(request, 'juego1.html')
def juego2(request):
    return render(request, 'juego2.html')
def juego3(request):
    return render(request, 'juego3.html')


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

def inicio(request):
    
    if is_admin(request.user):
        return redirect('admin:index')
    return render(request, 'inicio.html', {
        
    })

@login_required
def categoria_detalle(request, categoria_id):
    # Cambia la siguiente línea para obtener la instancia de CategoriaTest con el ID 1
    categoria = CategoriaTest.objects.get(id=1)
    return render(request, 'categoria_detalle.html', {
        'categoria': categoria
    })


def preguntas_categoria(request, categoria_id):
    categoria = get_object_or_404(CategoriaTest, id=categoria_id)
    preguntas = Pregunta.objects.filter(categoria=categoria)
    return render(request, 'daily_test.html', {'categoria': categoria, 'preguntas': preguntas})

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

        if 10 <= puntuacion_total <= 30:
            # Redirect to the agendamiento_encuentro view
            return render(request, 'Encuentro.html',{})

        # Continue with the existing logic for other score ranges
        else:
            # Continue with the existing logic for other score ranges
            resultado_id = determinar_resultado(puntuacion_total)
            if resultado_id is None:
                return render(request, 'resultado_no_encontrado.html')
            return redirect('mostrar_resultado', categoria_id=categoria_id, resultado_id=resultado_id)

def determinar_resultado(puntuacion_total):
    resultados = Resultado.objects.all()
    for resultado in resultados:
        if resultado.puntuacion_min <= puntuacion_total <= resultado.puntuacion_max:
            return resultado.id
    # Si no coincide con ningún resultado, devuelve un valor predeterminado (puedes ajustarlo según tus necesidades)
    return 0  # Por ejemplo, 0 representa "Sin resultado"

def mostrar_resultado(request, categoria_id, resultado_id):
    if resultado_id == 0:  # O el valor que represente la falta de un resultado específico
        raise Http404("No se encontró un resultado para esta puntuación.")
    resultado = get_object_or_404(Resultado, id=resultado_id)
    return render(request, 'mostrar_resultado.html', {'resultado': resultado})

def resultado_no_encontrado(request):
    return render(request, 'resultado_no_encontrado.html')


# ojo llego el errores
def agendamiento_encuentro(request):
    if request.method == 'POST':
        form = EncuentroForm(request.POST)
        if form.is_valid():
            form.save()  # Esto guardará el formulario en la base de datos
            return redirect('agendar_encuentro')  # Redirige a una página exitosa
    else:
        form = EncuentroForm()

    return render(request, 'Encuentro.html', {'form': form})

#aqui esta el error # En PNBM/views.

# Importaciones y otros métodos ...

# Otras importaciones y métodos ...

class CalendarioPsicologoView(View):
    template_name = 'calendario.html'

    def get_eventos_data(self):
        # Aquí deberías implementar la lógica para obtener los datos de eventos
        # desde tu base de datos u otra fuente de datos
        # Este es solo un ejemplo, deberías ajustarlo según tu aplicación
        return [{'titulo': 'Evento 1', 'fecha': '2023-12-05'}, {'titulo': 'Evento 2', 'fecha': '2023-12-10'}]

    def get(self, request, *args, **kwargs):
        # Lógica para obtener datos del calendario
        eventos_data = self.get_eventos_data()
        return render(request, self.template_name, {'eventos_data': eventos_data})


def mostrar_encuentros(request):
    # Lógica para obtener datos de encuentros
    encuentros = Encuentro.objects.all()
    return render(request, 'mostrar_encuentros.html', {'encuentros': encuentros})


class EventosCalendarioView(View):
    def get(self, request, *args, **kwargs):
        eventos = Evento.objects.all()
        eventos_data = [
            {
                'title': evento.title,
                'start': evento.start.strftime('%Y-%m-%dT%H:%M:%S'),
                'color': evento.color,
                'editable': evento.editable,
            }
            for evento in eventos
        ]
        return JsonResponse(eventos_data, safe=False)

class AgendamientoEncuentroView(View):
    def get(self, request, *args, **kwargs):
        fecha_seleccionada = request.GET.get('fecha')
        # Resto de la lógica...
