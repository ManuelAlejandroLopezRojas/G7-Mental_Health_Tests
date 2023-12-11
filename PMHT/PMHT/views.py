from django.shortcuts import render, get_object_or_404, redirect

from django.contrib import messages
from django.contrib.auth import login, logout, authenticate

from django.contrib.auth.models import User

from .forms import RegisterForm

from django.contrib.auth.decorators import login_required, user_passes_test

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
    
    if is_admin(request.user):
        return redirect('admin:index')
    return render(request, 'inicio.html', {
        
    })
