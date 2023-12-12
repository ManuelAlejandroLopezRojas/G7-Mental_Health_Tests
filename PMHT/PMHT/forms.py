from django import forms
from django.contrib.auth.models import User
from django.core.exceptions import ValidationError
from core.models import Encuentro

class NoNumbersValidator:
    def __init__(self, message="No se permiten números en este campo."):
        self.message = message

    def __call__(self, value):
        if any(char.isdigit() for char in value):
            raise ValidationError(self.message)

class PasswordValidator:
    def __init__(self, message="La contraseña debe tener al menos 8 caracteres, un número y una mayúscula."):
        self.message = message

    def __call__(self, value):
        if len(value) < 8 or not any(char.isdigit() for char in value) or not any(char.isupper() for char in value):
            raise ValidationError(self.message)

class RegisterForm(forms.Form):
    first_name = forms.CharField(
        label='Nombre(s)',
        required=True,
        min_length=3, max_length=20,
        widget=forms.TextInput(attrs={
            'class': 'form-control',
            'id': 'first_name',
            'placeholder': 'Nombre',
        })
    )
    
    last_name = forms.CharField(
        label='Apellido(s)',
        required=True,
        min_length=3, max_length=20,
        widget=forms.TextInput(attrs={
            'class': 'form-control',
            'id': 'last_name',
            'placeholder': 'Apellido',
        })
    )
    
    username = forms.CharField(
        label='Nombre de usuario',
        required=True,
        min_length=4, max_length=10,
        widget=forms.TextInput(attrs={
            'class': 'form-control',
            'id': 'username'
        })
    )
    
    email = forms.EmailField(
        label='Correo',
        required=True,
        widget=forms.EmailInput(attrs={
            'class': 'form-control',
            'id': 'email',
            'placeholder': 'example@gmail.com'
        })
    )
    
    password = forms.CharField(
        label='Contraseña',
        required=True,
        validators=[PasswordValidator()],
        widget=forms.PasswordInput(attrs={
            'class': 'form-control'
        })
    )
    
    password2 = forms.CharField(
        label='Confirmar contraseña',
        required=True, 
        widget=forms.PasswordInput(attrs={ 
            'class' : 'form-control'
        })
    )

    def clean_first_name(self):
        first_name = self.cleaned_data.get('first_name')

        if any(char.isdigit() for char in first_name):
            raise ValidationError('El nombre no puede contener números.')

        return first_name

    def clean_last_name(self):
        last_name = self.cleaned_data.get('last_name')

        if any(char.isdigit() for char in last_name):
            raise ValidationError('El apellido no puede contener números.')

        return last_name

    def clean_username(self):
        username = self.cleaned_data.get('username')

        username = username.strip()

        if ' ' in username:
            raise forms.ValidationError('El nombre de usuario no puede contener espacios en blanco.')

        if User.objects.filter(username=username).exists():
            raise forms.ValidationError('El nombre de usuario ya se encuentra en uso')

        return username
    
    def clean_email(self):
        email = self.cleaned_data.get('email')

        email = email.strip()

        if ' ' in email:
            raise forms.ValidationError('El correo no puede contener espacios en blanco.')

        if User.objects.filter(email=email).exists():
            raise forms.ValidationError('El correo ya se encuentra en uso')

        return email

    def clean(self):
        cleaned_data = super().clean()

        if cleaned_data.get('password2') != cleaned_data.get('password'):
            self.add_error('password2', 'La contraseña no coincide')

class EncuentroForm(forms.ModelForm):
    class Meta:
        model = Encuentro
        fields = ['documento', 'nombre' ]
        widgets = {
             forms.DateTimeInput(attrs={'class': 'form-control'}),
        }
