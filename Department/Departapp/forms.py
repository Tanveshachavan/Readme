from django import forms
from .models import Department

class Departmentform(forms.ModelForm):
    class Meta:
        model = Department
        fields = "__all__"