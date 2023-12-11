from django import forms

from django.contrib.auth.models import User

from core.models import Encuentro

class RegisterForm(forms.Form):
    first_name = forms.CharField(label='Nombre(s)',
                                required=True,
                                min_length=3, max_length=50,
                                widget=forms.TextInput(attrs={
                                    'class': 'form-control',
                                    'id': 'first_name',
                                    'placeholder': 'Nombre',
                                }))
    last_name = forms.CharField(label='Apellido(s)',
                                required=True,
                                min_length=3, max_length=50,
                                widget=forms.TextInput(attrs={
                                    'class': 'form-control',
                                    'id': 'last_name',
                                    'placeholder': 'Apellido',
                                }))
    username = forms.CharField(label='Nombre de usuario',
                                required=True,
                                min_length=4, max_length=50,
                                widget=forms.TextInput(attrs={
                                    'class': 'form-control',
                                    'id': 'username'
                                }))
    email = forms.EmailField(label='Correo',
                                required=True,
                                widget=forms.EmailInput(attrs={
                                    'class': 'form-control',
                                    'id': 'email',
                                    'placeholder': 'example@gmail.com'
                                }))
    password = forms.CharField(label='Contraseña',
                                required=True,
                                widget=forms.PasswordInput(attrs={
                                    'class': 'form-control'
                                }))
    password2 = forms.CharField(label='confirmar contraseña',
                                required=True, 
                                widget=forms.PasswordInput(attrs={ 
                                    'class' : 'form-control'
                                }))
    

    def clean_username(self):
        username = self.cleaned_data.get('username')

        username = username.strip()

        if ' ' in username:
            raise forms.ValidationError('El nombre de usuario no puede contener espacios en blanco.')

        if User.objects.filter(username=username).exists():
            raise forms.ValidationError('El username ya se encuentra en uso')

        return username
    
    def clean_email(self):
        email = self.cleaned_data.get('email')

        email = email.strip()

        if ' ' in email:
            raise forms.ValidationError('El correo no puede contener espacios en blanco.')

        if User.objects.filter(email=email).exists():
            raise forms.ValidationError('El email ya se encuentra en uso')

        return email

    def clean(self):
        cleaned_data = super().clean()

        if cleaned_data.get('password2') != cleaned_data.get('password'):
            self.add_error('password2', 'el password no coincide')

class EncuentroForm(forms.ModelForm):
    class Meta:
        model = Encuentro
        fields = '__all__'