from django.shortcuts import render, get_object_or_404, redirect
from django.urls import reverse

from django.views.decorators.csrf import csrf_exempt

from django.contrib import messages
from django.contrib.auth import login, logout, authenticate

from django.contrib.auth.models import User

from .forms import RegisterForm, EncuentroForm
from django.utils.decorators import method_decorator
from django.views.decorators.csrf import csrf_exempt

from django.contrib.auth.decorators import login_required, user_passes_test

from django.http import Http404, JsonResponse, HttpResponseRedirect
import json

from core.models import CategoriaTest, Pregunta, Respuesta, Resultado,ResultadoUsuario, Encuentro, Puntuacion, TiempoJuego
from django.db.models import Count

from django.views import View
from datetime import datetime
from django.utils import timezone




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

def register(request):
    form = RegisterForm(request.POST or None)

    if request.method == 'POST' and form.is_valid():
        username = form.cleaned_data.get('username')
        email = form.cleaned_data.get('email')
        password = form.cleaned_data.get('password')
        first_name = form.cleaned_data.get('first_name')
        last_name = form.cleaned_data.get('last_name')

        if any(char.isdigit() for char in first_name):
            form.add_error('first_name', 'El nombre no puede contener números.')

        if any(char.isdigit() for char in last_name):
            form.add_error('last_name', 'El apellido no puede contener números.')

        if form.errors:
            return render(request, 'register.html', {'form': form})

        user = User.objects.create_user(
            username=username,
            email=email,
            password=password,
            first_name=first_name,
            last_name=last_name,
        )

        if user:
            login(request, user)
            messages.success(request, 'Usuario Creado Exitosamente')
            return redirect('inicio')

    return render(request, 'register.html', {'form': form})
@login_required
def inicio(request):
    
    if is_admin(request.user):
        return redirect('admin:index')
    return render(request, 'inicio.html', {
        
    })

@login_required
def categoria_detalle(request, categoria_id):
    categoria = get_object_or_404(CategoriaTest, id=categoria_id)
    return render(request, 'categoria_detalle.html', {'categoria': categoria})

@login_required
def preguntas_categoria(request, categoria_id):
    categoria = get_object_or_404(CategoriaTest, id=categoria_id)
    preguntas = Pregunta.objects.filter(categoria=categoria)
    return render(request, 'daily_test.html', {'categoria': categoria, 'preguntas': preguntas})


@login_required
def calcular_resultado(request, categoria_id):
    if request.method == 'POST':
        usuario = request.user
        fecha = datetime.now()

        respuestas_seleccionadas = request.POST
        respuestas_usuario = []

        puntuacion_total = 0

        for key, value in respuestas_seleccionadas.items():
            if key.startswith('pregunta_'):
                respuesta_id = int(value)
                respuesta = Respuesta.objects.get(id=respuesta_id)
                puntuacion_total += respuesta.valor
                respuestas_usuario.append(respuesta)

        resultado_usuario, created = ResultadoUsuario.objects.get_or_create(
            usuario=usuario,
            fecha=fecha,
            defaults={'total_puntos': puntuacion_total}
        )

        if not created:
            resultado_usuario.total_puntos = puntuacion_total
            resultado_usuario.save()

        if 10 <= puntuacion_total <= 30:
            return render(request, 'Encuentro.html', {})
        else:
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
    ultimo_resultado = ResultadoUsuario.objects.filter(usuario=request.user).order_by('-fecha').first()
    return render(request, 'mostrar_resultado.html', {'resultado': resultado, 'ultimo_resultado': ultimo_resultado})

def resultado_no_encontrado(request):
    return render(request, 'resultado_no_encontrado.html')


# ojo llego el errores





@csrf_exempt
@login_required
def guardar_puntuacion(request):
    if request.method == 'POST':
        respuestas_correctas = int(request.POST.get('respuestas_correctas', 0))
        usuario = request.user  # Obtener el usuario actual

        # Buscar la puntuación existente del usuario, si existe
        puntuacion_existente = Puntuacion.objects.filter(usuario=usuario).first()

        if puntuacion_existente:
            # Si hay una puntuación existente para el usuario, actualiza la puntuación
            puntuacion_existente.respuestas_correctas += respuestas_correctas
            puntuacion_existente.save()
        else:
            # Si no hay una puntuación existente, crea un nuevo registro
            puntuacion = Puntuacion(usuario=usuario, respuestas_correctas=respuestas_correctas)
            puntuacion.save()  # Guardar el objeto en la base de datos

        # Agregar un mensaje de éxito
        messages.success(request, 'Puntuación guardada exitosamente.')

        # Redirige o renderiza la vista mostrar_clasificacion para actualizar la tabla
    return redirect('clasificacion')

def mostrar_clasificacion(request):
    # Obtener todas las puntuaciones ordenadas de mayor a menor
    puntuaciones = Puntuacion.objects.order_by('-respuestas_correctas')

    return render(request, 'clasificacion.html', {'puntuaciones': puntuaciones})

def convertir_a_formato_tiempo(milisegundos):
    segundos, milisegundos = divmod(milisegundos, 1000)
    minutos, segundos = divmod(segundos, 60)
    horas, minutos = divmod(minutos, 60)
    return f"{horas:02d}:{minutos:02d}:{segundos:02d}"

# Vista para guardar el tiempo del juego
@csrf_exempt
@login_required
@login_required
def guardar_tiempo(request):
    if request.method == 'POST':
        tiempo_nuevo = int(request.POST.get('tiempo', 0))  # Obtener el tiempo enviado en la petición POST

        # Obtener el TiempoJuego del usuario actual, si existe
        tiempo_usuario = TiempoJuego.objects.filter(usuario=request.user).first()

        if tiempo_usuario is None or tiempo_nuevo < tiempo_usuario.tiempo_en_milisegundos:
            # Si el usuario no tiene un tiempo registrado o el nuevo tiempo es menor, guardar el nuevo tiempo
            if tiempo_usuario:
                # Eliminar el tiempo existente si hay uno
                tiempo_usuario.delete()

            # Crear un nuevo TiempoJuego con el tiempo más bajo
            nuevo_tiempo = TiempoJuego(usuario=request.user, tiempo_en_milisegundos=tiempo_nuevo)
            nuevo_tiempo.save()

            return JsonResponse({'message': 'Tiempo guardado correctamente.'}, status=200)

        return JsonResponse({'message': 'No se actualizó el tiempo existente.'}, status=400)

    return JsonResponse({}, status=400)


def tabla_tiempo(request):
    # Obtener todos los tiempos ordenados por el tiempo en milisegundos
    tiempos = TiempoJuego.objects.order_by('tiempo_en_milisegundos')

    # Renderizar la plantilla con los tiempos obtenidos
    return render(request, 'clasificacion2.html', {'tiempos': tiempos})


from django.http import HttpResponseRedirect
 # Ajusta la importación según la ubicación de tu modelo Encuentro

@login_required
def agendar_encuentro(request):
    context = {}

    if request.method == 'POST':
        documento = request.POST.get('Documento')
        nombre = request.POST.get('nombre')
        nacido = request.POST.get('nacido')
        hm = request.POST.get('hm')
        edad = request.POST.get('edad')
        email = request.POST.get('email')
        telefono = request.POST.get('telefono')
        jornada = request.POST.get('jornada')
        psicologo = request.POST.get('medico')
        fecha_encuentro = request.POST.get('fecha')
        razon = request.POST.get('cajaTexto') if request.POST.get('razones') == 'otro' else 'Determinado'

        # Verificar si es menor de edad y obtener datos del acompañante si corresponde
        if edad == 'menor':
            nombre_acompanante = request.POST.get('nombreAcompanante')
            tipo_acompanante = request.POST.get('tipoAcompanante')
            documento_acompanante = request.POST.get('documentoAcompanante')
        else:
            nombre_acompanante, tipo_acompanante, documento_acompanante = None, None, None

        # Marcar el encuentro como aceptado si la fecha es futura
        fecha_actual = datetime.now().date()
        fecha_encuentro = datetime.strptime(fecha_encuentro, '%Y-%m-%d').date()

        if fecha_encuentro > fecha_actual:
            encuentro = Encuentro(
                documento=documento,
                nombre=nombre,
                nacido=nacido,
                hm=hm,
                edad=edad,
                nombre_acompanante=nombre_acompanante,
                tipo_acompanante=tipo_acompanante,
                documento_acompanante=documento_acompanante,
                email=email,
                telefono=telefono,
                jornada=jornada,
                psicologo=psicologo,
                fecha_encuentro=fecha_encuentro,
                razon=razon,
                aceptado=True  # Marcando el encuentro como aceptado
            )
            encuentro.save()

        return HttpResponseRedirect(reverse('inicio'))

    encuentros = Encuentro.objects.all()
    context = {'encuentros': encuentros}
    return render(request, 'Encuentro.html', context)

def calendario_psicologo(request):
    encuentros_aceptados = Encuentro.objects.filter(aceptado=True)

    eventos_calendario = []
    for encuentro in encuentros_aceptados:
        evento = {
            'title': encuentro.nombre,
            'start': encuentro.fecha_encuentro.strftime('%Y-%m-%d'),
        }
        eventos_calendario.append(evento)

    return render(request, 'calendario.html', {'eventos': eventos_calendario})




def eventos_calendario(request):
    # Obtener todos los encuentros
    encuentros = Encuentro.objects.all()

    eventos_calendario = []
    for encuentro in encuentros:
        color = '#3366CC'  # Por defecto, color azul

        if encuentro.estado == 'Aprobado':
            color = '#33CC33'  # Color verde para aprobado
        elif encuentro.estado == 'Rechazado':
            # Verificar si el encuentro fue rechazado hace más de una hora
            if encuentro.timestamp_rechazo and timezone.now() > encuentro.timestamp_rechazo + timezone.timedelta(seconds=10):
                encuentro.delete()
                continue

            # Establecer timestamp_rechazo si aún no se ha configurado
            if not encuentro.timestamp_rechazo:
                encuentro.timestamp_rechazo = timezone.now()
                encuentro.save()
            
            color = '#CC3333'  # Color rojo para rechazado

        # Construir el título del evento con el nombre y el estado del encuentro
        title = f"{encuentro.nombre} - {encuentro.estado}"

        evento = {
            'title': title,
            'start': encuentro.fecha_encuentro.strftime('%Y-%m-%d'),
            'color': color,  # Establecer el color del evento según el estado
            # Puedes agregar más campos como 'end' si los necesitas
        }
        eventos_calendario.append(evento)

    return JsonResponse(eventos_calendario, safe=False)