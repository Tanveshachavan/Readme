from django.urls import path
from Departapp.views import Dept,ShowDept,DeleteDept,EditDept,UpdateDept

urlpatterns = [
    path('',Dept,name='Dept'),
    path('showdept',ShowDept,name='showdept'),
    path('deletdept/<int:dept_id>/',DeleteDept,name='deletdept'),
    path('editdept/<int:dept_id>/',EditDept,name='editdept'),
    path('updatedept/<int:dept_id>/',UpdateDept,name='updatedept'),
]
