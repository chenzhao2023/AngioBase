"""angio_base URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    patient1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    patient1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    patient1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
# from django.conf.urls import url
from django.conf import settings
from django.views.static import serve

from django.conf.urls import url
from django.contrib import admin
from django.urls import path, include, re_path
from AngioBaseA import views
from AngioBaseA.views import TestView
from user import views as user_views
urlpatterns = [
    url(r'^static/(?P<path>.*)$', serve,{'document_root': settings.STATIC_ROOT}),
    path('admin/', admin.site.urls,name='admin'),
    path('details/',views.details,name="details"),
    path('', views.index, name="myhome_index"),
    path('mainPage', views.mainPage, name="vessel_name_ide"),
    path('vessel_contour', views.mainPage2, name="vessel_contour_ide"),
    path('vessel_map', views.mainPage3, name="vessel_map_ide"),
    path('Projection', user_views.Projection, name="Projection"),

    path('index/',TestView.as_view(), name='vessel_map'),
    path('point/', views.point, name="point_details"),
    path('get_length/',views.get_length,name="get_length"),
    path('img_path/',views.get_patient_path,name="patient_path"),
    path('add/',views.get_add_png_path,name="get_add"),
    path('get_vessel/',views.get_vessel,name="get_vessel"),
    path('get_all_vessel/',views.get_all_vessel,name="get_all_vessel"),
    path('map_point/',views.map_point,name="map_point"),
    path('get_pat_count/',views.get_pat_count,name="get_pat_count"),
    path('get_pro_count/',views.get_pro_count,name="get_pro_count"),
    path('get_main_angle/',views.get_main_angle,name="get_main_angle"),
    path('get_path/',views.get_path,name="get_path"),
    path('Beta_info/',views.Beta_info,name="Beta_info"),
    path('web_favourite_handle/',views.web_favourite_handle,name="web_favourite_handle"),
    path('get_clv/',views.get_clv,name="get_clv"),






    path('register1/', user_views.register1, name='register1'),
    path('login1/',user_views.login1,name='login1'),
    path('logout1/', user_views.logout1,name='logout1'),
    path('Create_Message/', user_views.Create_Message,name='Create_Message'),
    path('All_Message/', user_views.All_Message,name='All_Message'),
    path('All_Message2/', user_views.All_Message2, name='All_Message2'),
    path('comment/<int:id1>/<int:id2>/<int:id>', user_views.comment, name='comment'),
    path('message_detail/<int:id>', user_views.message_detail, name='message_detail'),
    path('news_detail/<int:id>', user_views.news_detail, name='news_detail'),
    path('user_center', user_views.user_center, name='user_center'),
    path('edit_user', user_views.edit_user, name='edit_user'),
    path('change_password', user_views.change_password, name='change_password'),
    path('all_question_addmin', user_views.all_question_addmin, name='all_question_addmin'),
    path('edit_question/<int:id>', user_views.edit_question, name='edit_question'),
    path('del_question/<int:qid>', user_views.del_question, name='del_question'),

    path('imgload', user_views.imgload, name='imgload'),
    path('case_uploads', user_views.uploads, name='case_uploads'),
    path('upload_dicoms/', user_views.upload_dicoms, name='upload_dicoms'),
    path('questionmain/', user_views.questionmain, name='questionmain'),
    path('start/', user_views.start, name='start'),
    path('po/', user_views.po, name='po'),
    path('add_question/', user_views.add_question, name='add_question'),
    path(r'mdeditor/', include('mdeditor.urls')),
    path('return_cookies', user_views.return_cookies, name='return_cookies'),
    path('updatecookie', user_views.updatecookie, name='updatecookie'),
    
]

if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL, document_root = settings.STATIC_ROOT)
