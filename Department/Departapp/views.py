from django.shortcuts import render,redirect
from .models import Department
from .forms import Departmentform 

# Create your views here.
def Dept(request):
    if request.method == 'POST':
        data = Departmentform(request.POST)
        
        if data.is_valid():
            data.save()
            return redirect('showdept')
        
    else:
        data = Departmentform()
    return render(request,'Departapp/Department.html',{'form':data})

def ShowDept(request):
    data = Department.objects.all()
    return render(request,'Departapp/DepartmentShow.html',{'range':data})

def EditDept(request,dept_id):
    data = Department.objects.get(dept_id=dept_id)
    return render(request,'Departapp/DepartmentEdit.html',{'range':data})

def UpdateDept(request,dept_id):
    obj = Department.objects.get(dept_id=dept_id)
    data = Departmentform(request.POST,instance=obj)
    
    if data.is_valid():
        data.save()
        return redirect('showdept')

def DeleteDept(request,dept_id):
    data = Department.objects.get(dept_id=dept_id)
    data.delete()
    return redirect('showdept')