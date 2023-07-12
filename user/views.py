import os

from django.shortcuts import render, reverse, redirect, HttpResponseRedirect
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.http import HttpResponse, JsonResponse
from . import models
from .models import Userform, Leave_Message
from django.contrib.auth.forms import UserCreationForm, UserChangeForm, PasswordChangeForm
from django.utils import timezone
from django.contrib.auth.forms import UserCreationForm, UserChangeForm, AuthenticationForm
from .forms import selfform, editform, loginform
from django.contrib.auth import authenticate, login, logout
from django.core.paginator import Paginator
from django.views.generic import ListView
import json
import random
from django.contrib import messages
import datetime
import SimpleITK as sitk
import cv2
import numpy as np


# Create your views here.

def is_error(t):
    if t.find("errorlist", 0, len((t))):
        return True
    else:
        return False


def find_error(t):
    res = []
    l = t.find("<li>", 0, len(t))
    while t[l:l + 4] == '<li>':
        l += 4
        r = t.find("</li>", 0, len(t))
        res.append(t[l:r])
        r += 4
        t = t[r:]
        l = t.find("<li>", 0, len(t))
    return res


def register1(request):
    if request.method == 'POST':
        registerform = selfform(request.POST)
        print(registerform)
        try:
            registerform.save()
            user = authenticate(username=registerform.cleaned_data['username'],
                                password=registerform.cleaned_data['password1'])
            user.email = registerform.cleaned_data['email']
            Userform(user=user).save()
            user.userform.nickname = registerform.cleaned_data['nickname']
            user.userform.save()
            login(request, user)
            loads = f'static/users/{user.username}/uploads'
            os.makedirs(loads, mode=0o777)
            return redirect('myhome_index')
        except Exception as e:
            res = []
            t = str(registerform)
            if is_error(t):
                res = find_error(t)
            if res:
                messages.error(request, res)
            else:
                messages.error(request, e)
            return HttpResponseRedirect(reverse('register1'))
    else:
        return render(request, 'register.html')


def login1(request):
    if request.method == 'POST':
        loginform1 = loginform(data=request.POST)
        print(loginform1)
        user = authenticate(request, username=loginform1.cleaned_data['username'],
                            password=loginform1.cleaned_data['password'])
        if loginform1.is_valid():
            user = authenticate(request, username=loginform1.cleaned_data['username'],
                                password=loginform1.cleaned_data['password'])
            login(request, user)
            print("登录成功")
            return redirect('vessel_name_ide')
        else:
            url = reverse('login1')
            return HttpResponse(f'<script>alert("Illegal account password");location.href="' + url + '";</script>')
    else:
        loginform1 = loginform()
        print("shibai")
    context = {'loginform1': loginform1, 'user': request.user}
    return render(request, 'login.html', context)


@login_required()
def logout1(request):
    logout(request)
    return redirect('vessel_name_ide')


@login_required(login_url='login1')
def Create_Message(request):
    if request.method == 'POST':
        user = request.user
        data = request.POST.dict()
        data.pop('csrfmiddlewaretoken')
        data['uid'] = user
        add = models.Leave_Message(**data)
        add.save()

        all_messages = models.Leave_Message.objects.filter(flag=1).order_by('-id')
        paginator = Paginator(all_messages, 6)
        page_number = 1
        page_obj = paginator.get_page(page_number)
        try:
            page_number = int(page_number)
        except Exception as e:
            page_number = 1
        page_obj = paginator.get_page(page_number)
        id_paginator = True if paginator.num_pages > 1 else False
        new = {'page_obj': page_obj, 'paginator': paginator, 'id_paginator': id_paginator}
        return render(request, 'all_message.html', new)
    else:
        return render(request, 'create_message.html')


@login_required()
def All_Message(request):
    all_messages = models.Leave_Message.objects.filter(flag=1).order_by('-id')
    paginator = Paginator(all_messages, 6)
    page_number = 1
    page_obj = paginator.get_page(page_number)
    try:
        page_number = int(page_number)
    except Exception as e:
        page_number = 1
    page_obj = paginator.get_page(page_number)
    id_paginator = True if paginator.num_pages > 1 else False
    new = {'page_obj': page_obj, 'paginator': paginator, 'id_paginator': id_paginator}
    return render(request, 'all_message.html', new)


@login_required()
def message_comment(request, id1, data):
    user = request.user
    print("进到1了")
    message = models.Leave_Message.objects.get(id=id1)
    if len(data['content']) == 0:
        return 0
    ans = {
        "uid": user,
        "content": data['content'],
        "username": message.uid.userform.nickname,
        'message_id': message,
        "message_user_id": message.uid,
        "message_user_username": message.uid.userform.nickname,
        "parent": None,
        "parent_user_id": None,
        "parent_user_username": False,
        "comment_level": 1,
    }
    res = models.Comment(**ans)
    res.save()
    return 1


# @login_required()
def com_comment(request, id1, data):
    print("进到2了")
    user = request.user
    comment = models.Comment.objects.get(id=id1)
    if len(data['content']) == 0:
        return 0
    ans = {
        "uid": user,
        "content": data['content'],
        "username": comment.uid.userform.nickname,
        'message_id': None,
        "message_user_id": None,
        "message_user_username": False,
        "parent": comment,
        "parent_user_id": comment.uid,
        "parent_user_username": comment.uid.userform.nickname,
        "comment_level": 2,
    }
    res = models.Comment(**ans)
    res.save()
    return 1


@login_required()
def comment(request, id1, id2, id):
    print(1, request)
    # id ,id1,id2 = str(id),str(id1),str(id2)
    # 一级评论是GET请求，二级评论是POST请求
    if request.method == 'GET':
        user = request.user
        print(user, type(user))
        data = request.GET
        print(id1, id2, data)
        if id2 == 0:
            res = message_comment(request, id1, data)
        elif id2 == 1:
            res = com_comment(request, id1, data)
        return redirect('message_detail', id=id1)
    elif request.method == 'POST':
        user = request.user
        data = request.POST
        if id2 == 0:
            res = message_comment(request, id1, data)
        elif id2 == 1:
            res = com_comment(request, id1, data)
        return redirect('message_detail', id=id)


from django.core.paginator import *



@login_required()
class CommentsListView(ListView):
    paginate_by = 5
    model = models.Comment


dic_com = {
    "main_comment": None,
    "son_comments": [],
}


# @login_required()
def message_detail(request, id):
    result = []
    message = models.Leave_Message.objects.get(id=id)
    comments = message.message_comment.filter(flag=1).order_by('-id')
    dic = {
        "comment": None,
        'children': [],
    }
    for i in comments:
        print(i, i.comment_first_son.filter(flag=1).count())
        dic = {
            "comment": None,
            'children': [],
            'children_count': 0,
        }
        comment_son(i.id, dic)
        dic_com = {
            "comment": i,
            "son_comments": dic,
            'children_count': i.comment_first_son.filter(flag=1).count(),
        }
        result.append(dic_com)
    print(result)
    paginator = Paginator(comments, 5)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    try:
        page_number = int(page_number)
    except Exception as e:
        page_number = 1
    page_obj = paginator.get_page(page_number)
    print(page_obj)
    id_paginator = True if paginator.num_pages > 1 else False
    new = {'page_obj': page_obj, 'paginator': paginator, 'id_paginator': id_paginator, 'message': message}
    return render(request, 'new_comments.html', new)


@login_required()
def All_Message2(request):
    if request.method == 'GET':

        all_messages = models.Leave_Message.objects.filter(flag=1).order_by('-id')
        paginator = Paginator(all_messages, 6)
        page_number = request.GET['page']
        page_obj = paginator.get_page(page_number)
        try:
            page_number = int(page_number)
        except Exception as e:
            page_number = 1
        page_obj = paginator.get_page(page_number)
        id_paginator = True if paginator.num_pages > 1 else False
        new = {'page_obj': page_obj, 'paginator': paginator, 'id_paginator': id_paginator}
        return render(request, 'all_message.html', new)


dic = {
    "comment": None,
    'children': [],
    'children_count': 0,
}


# 这里一定不要加装饰器
# @login_required()
def comment_son(id, dic):
    comment = models.Comment.objects.get(id=id)
    son_comments = comment.comment_first_son.filter(flag=1).order_by('-id')
    for item in son_comments:
        di = {
            "comment": item,
            'children': [],
            'children_count': item.comment_first_son.filter(flag=1).count(),
        }
        comment_son(item.id, di)
        dic['children'].append(di)


import markdown


def time_convert_list(t):
    res = {
        'year': int(t[0:4]),
        'month': int(t[5:7]),
        'day': int(t[8:10]),
        'h': int(t[11:13]),
        'm': int(t[14:16]),
    }
    return res


def is_morethan(t3, t4, h):
    res1 = time_convert_list(t3)
    res2 = time_convert_list(t4)
    if res1['year'] > res2['year']:
        return True
    elif res1['month'] > res2['month']:
        return True
    elif res1['day'] > res2['day']:
        return True
    elif res1['h'] > res2['h']:
        return True
    elif res1['m'] - res2['m'] >= h:
        return True
    print(res1, res2)
    # if res1['year'] > res2['year'] or res1['month'] > res2['month'] or res1['day'] > res2['day'] or res1['h'] > res2['h']:
    #     return True
    # if res1['h'] == res2['h'] and res1['m'] - res2['m'] >= h:
    #     return True
    # else:
    #     return False


@login_required()
def news_detail(request, id):
    try:
        news_detail = models.Notice.objects.get(id=id)
        flag = False
        flag_first = False
        try:
            views_c = models.Views_count.objects.get(uid=request.user, nid=news_detail)
            print(views_c)
        except Exception as e:

            flag_first = True
            models.Views_count(uid=request.user, nid=news_detail).save()
            views_c = models.Views_count.objects.get(uid=request.user, nid=news_detail)
        current_datetime = datetime.datetime.now()
        if flag_first:
            views_c.last_view_time = current_datetime
            views_c.save()
            news_detail.views += 1
            news_detail.save()
        else:
            print(current_datetime, views_c.last_view_time)
            print(current_datetime, views_c.last_view_time)
            flag = is_morethan(str(current_datetime), str(views_c.last_view_time), 5)
            if flag:
                views_c.last_view_time = current_datetime
                views_c.save()
                news_detail.views += 1
                news_detail.save()
        news = {
            'id': news_detail.id,
            'title': news_detail.title,
            'content': news_detail.content,
            'year': str(news_detail.create_time)[0:4],
            'month': str(news_detail.create_time)[5:7],
            'day': str(news_detail.create_time)[8:11],
            'create_time': news_detail.create_time,
            'time': str(news_detail.create_time)[0:11],
            'views': int(news_detail.views),
        }
        content = news_detail.content
        content = markdown.markdown(content, extensions=[
            'markdown.extensions.extra',
            'markdown.extensions.codehilite',
            'markdown.extensions.toc',
        ])
        context = {'news': news, 'content': content}
        return render(request, 'newsDetail.html', context)
    except:
        return render(request, '404.html')


import cv2 as cv


@login_required()
def user_center(request):
    user = request.user
    context = {'user': user}
    print(user.username)
    return render(request, 'user_center.html', context)


@login_required()
def edit_user(request):
    user = request.user
    if request.method == 'POST':
        print(request.POST)
        editform1 = editform(request.POST, instance=request.user)
        print(editform1)
        if editform1.is_valid():
            editform1.save()
            request.user.username = editform1.cleaned_data['username']
            request.user.userform.nickname = editform1.cleaned_data['nickname']
            request.user.userform.email = editform1.cleaned_data['email']
            if editform1.cleaned_data['gender'] == "Male":
                request.user.userform.gender = 1
            elif editform1.cleaned_data['gender'] == "Female":
                request.user.userform.gender = 0
            elif editform1.cleaned_data['gender'] == "Unknown":
                request.user.userform.gender = 2
            else:
                request.user.userform.gender = request.user.userform.gender
            user.save()
            user.userform.save()
            return redirect('user_center')
    elif request.method == 'GET':
        editform1 = editform(instance=request.user)
        gender = ['Male', 'Female','Unknown']
        context = {'editform1': editform1, 'user': request.user, 'gender': gender}
        return render(request, 'edit_user.html', context)


@login_required(login_url='login1')
def change_password(request):
    if request.method == 'POST':
        changeform1 = PasswordChangeForm(data=request.POST, user=request.user)
        if changeform1.is_valid():
            changeform1.save()
            return redirect('login1')
    else:
        changeform1 = PasswordChangeForm(user=request.user)
    context1 = {'changeform1': changeform1, 'user': request.user}
    return render(request, 'change_password.html', context1)


def imgload(request):
    if request.method == 'GET':
        user = request.user
        if user.is_superuser:
            return render(request, 'addimg.html')
        else:
            url = reverse('All_Message')
            return HttpResponse(f'<script>alert("permission");location.href="' + url + '";</script>')
    else:
        user = request.user
        if user.is_superuser:
            file = request.FILES.get('img', None)
            print(file)
            import random, time
            import os, sys, stat
            if file:
                print("now::", sys.argv[0])
                zh = file.name.split('.').pop()
                name = str(random.randint(10000, 99999) + time.time()) + '.' + zh
                loads = f'static/users/{user.username}/uploads'
                filename = f'static/users/{user.username}/uploads/{name}'
                # os.remove(loads)
                if os.path.exists(loads):
                    print('exist')
                    with open(filename, 'wb+') as fp:
                        for chunk in file.chunks():
                            fp.write(chunk)
                else:
                    os.makedirs(loads, mode=0o777)
                    os.chmod(loads, stat.S_IRWXG)
                    with open(filename, 'wb+') as fp:
                        for chunk in file.chunks():
                            fp.write(chunk)
                    filename = f'static/{user.username}/uploads/{name}'
                imgmodel = models.Img(uid=user, name=filename, img=loads).save()
                url = reverse('All_Message')
                return HttpResponse(f'<script>alert("Added successfully");location.href="' + url + '";</script>')
            else:
                url = reverse('All_Message')
                return HttpResponse(f'<script>alert("add failed");location.href="' + url + '";</script>')
        else:
            url = reverse('All_Message')
            return HttpResponse(f'<script>alert("No permission");location.href="' + url + '";</script>')


def uploads(request):
    if request.method == 'GET':
        return render(request, 'uploads.html')
        # user = request.user
        # if user.is_superuser:
        #     return render(request, 'uploads.html')
        # else:
        #     url = reverse('All_Message')
        #     return HttpResponse(f'<script>alert("无权限");location.href="' + url + '";</script>')
    elif request.method == 'POST':
        file1 = request.FILES.get('png1', None)
        file2 = request.FILES.get('png2', None)
        file3 = request.FILES.get('json1', None)
        file4 = request.FILES.get('json2', None)
        print(file1, file2, file3, file4)
        filename = [file1, file2, file3, file4]
        a = file1.name[-4:]
        print(a, type(a))
        print(file1.name[-4:], file2.name[-4:], file3.name[-5:], file4.name[-5:])
        if file1.name[-4:] == ".png" and file2.name[-4:] == ".png" and file3.name[-5:] == ".json" and file4.name[
                                                                                                      -5:] == ".json":
            loads = f'static/json'
            filePath = f'static/json'
            all_patiens = os.listdir(filePath)
            shuzi_list = []
            for i in all_patiens:
                shuzi_list.append(int(i[4:]))
            print(all_patiens)
            print(shuzi_list)
            new = sorted(shuzi_list)
            now_max = new[-1]
            new_patient = str(all_patiens[-1])[0:4] + str(now_max + 1)

            print(new_patient)
            LAOpictureurl= os.path.join('../static/json/{}/LAO.png'.format(new_patient))
            RAOpictureurl= os.path.join('../static/json/{}/RAO.png'.format(new_patient))
            LAOjsurl= os.path.join('static/json/{}/LAO.json'.format(new_patient))
            RAOjsurl= os.path.join('static/json/{}/RAO.json'.format(new_patient))
            models.picturnameandeurl.objects.create(patient_name=new_patient,LAOpictureurl=LAOpictureurl,RAOpictureurl=RAOpictureurl,LAOjsurl=LAOjsurl,RAOjsurl=RAOjsurl)
            new_patient_load = f'static/json/{new_patient}'
            os.makedirs(new_patient_load, mode=0o777)
            for i in filename:
                loads = f'static/json/{new_patient}/{i}'
                with open(loads, 'wb+') as fp:
                    for chunk in i.chunks():
                        fp.write(chunk)
            url = reverse('case_uploads')
            return HttpResponse(f'<script>alert("Success!");location.href="' + url + '";</script>')
        else:
            url = reverse('case_uploads')
            return HttpResponse(
                f'<script>alert("Please follow the instructions on the page to upload the correct file!");location.href="' + url + '";</script>')



id = 11111
def transform_image_from_simpleitk(dicom_dir, save_dir):
    image = []
    print(dicom_dir)
    dicom_file = sitk.ReadImage(dicom_dir)
    dicom_data = sitk.GetArrayFromImage(dicom_file)
    # dicom_file = pydicom.dcmread(dicom_dir)
    # dicom_data = dicom_file.pixel_array
    print("this")
    print(dicom_data.shape)

    if len(dicom_data.shape) == 2:
        dicom_data = np.expand_dims(dicom_data, 0)
        print(dicom_data.shape)
    for index in range(dicom_data.shape[0]):
        file = dicom_data[index]
        from PIL import Image
        im = Image.fromarray(file)
        image.append(im)
    for index in range(dicom_data.shape[0]):
        save_img_dir = os.path.join(save_dir, "{}.png".format(index + 1))
        cv2.imwrite(save_img_dir, dicom_data[index])

    fff(image,id=id)
    id += 1

def transform_image_from_simpleitk2(dicom_dir, save_dir,id,i,question):
    image = []
    print(dicom_dir)
    dicom_file = sitk.ReadImage(dicom_dir)
    dicom_data = sitk.GetArrayFromImage(dicom_file)
    # dicom_file = pydicom.dcmread(dicom_dir)
    # dicom_data = dicom_file.pixel_array
    print("this")
    print(dicom_data.shape)

    if len(dicom_data.shape) == 2:
        dicom_data = np.expand_dims(dicom_data, 0)
        print(dicom_data.shape)
    for index in range(dicom_data.shape[0]):
        file = dicom_data[index]
        print(type(file))
        from PIL import Image
        im = Image.fromarray(file)
        im = im.resize((512,512),Image.ANTIALIAS)
        # im = cv2.resize(im,(512,512))
        image.append(im)
    # for index in range(dicom_data.shape[0]):
    #     save_img_dir = os.path.join(save_dir, "{}.png".format(index + 1))
    #     cv2.imwrite(save_img_dir, dicom_data[index])

    fff(image,id=id,i=i,question=question)

def fff(gif_images,id,i,question):
    import os
    import imageio
    path = f'static//question//q//QB{id}'
    gif_name = f'static//question//q//QB{id}//QB{id}_{i}.gif'
    if not os.path.exists(path):
        os.makedirs(path, mode=0o777)
    imageio.mimsave(gif_name, gif_images, 'GIF', duration=0.1)
    url = f'\\static\\question\\q\\QB{id}\\QB{id}_{i}.gif'
    models.Questiongif(q_url=url,qid=question).save()

from angio_base.settings import BASE_DIR
from os.path import isdir, dirname, join
from os import mkdir, listdir

ZIP_DIR = os.path.join(BASE_DIR, "static")
DATA_DIR = os.path.join(os.path.join(BASE_DIR, "static"), "users")
upload_subjects = []


@login_required(login_url='login1')
def upload_dicoms(request):
    global upload_subjects
    dcm_file = False
    upload_subjects = []
    DATA_DIR1 = os.path.join(DATA_DIR, request.user.username)
    if request.method == 'POST':
        # Get uploaded files
        # DATA_DIR = os.path.join(os.path.join(BASE_DIR, "static"), "users")
        # DATA_DIR = os.path.join(os.path.join(BASE_DIR, "static"), "users")
        uploadedFile_list = request.FILES.getlist('Scores')
        for uploadedFile in uploadedFile_list:
            if not uploadedFile:
                return render(request, 'upload_dicoms.html', {'msg': 'No file selected'})
            if uploadedFile.name.rfind(".") != -1:
                if uploadedFile.name.rfind("DCM") == -1 and uploadedFile.name.rfind("dcm") == -1:
                    return render(request, 'upload_dicoms.html', {'msg': 'Must choose dicom file'})
                else:
                    dcm_file = True
        # Create a folder to store uploaded files
        for uploadedFile in uploadedFile_list:
            if dcm_file == True:
                uploadDir = os.path.join(DATA_DIR1, uploadedFile.name[:-4])
            else:
                uploadDir = os.path.join(DATA_DIR1, uploadedFile.name)
            while (os.path.exists(uploadDir)):
                if dcm_file == True:
                    uploadedFile.name = uploadedFile.name[:-4] + "_1.DCM"
                    uploadDir = os.path.join(DATA_DIR1, uploadedFile.name[:-4])
                else:
                    uploadedFile.name = uploadedFile.name + "_1"
                    uploadDir = os.path.join(DATA_DIR1, uploadedFile.name)
            if not isdir(uploadDir):
                mkdir(uploadDir)
                imgsDir = os.path.join(uploadDir, "images")
                mkdir(imgsDir)
                predictDir = os.path.join(uploadDir, "predict")
                mkdir(predictDir)
            # Upload
            dstFilename = join(uploadDir, uploadedFile.name)
            if dcm_file == True:
                upload_subjects.append(uploadedFile.name[:-4])
            else:
                upload_subjects.append(uploadedFile.name)
            with open(dstFilename, 'wb') as fp:
                for chunk in uploadedFile.chunks():
                    fp.write(chunk)
            transform_image_from_simpleitk(dstFilename, imgsDir)
        context = {}
        context['msg'] = 'Success'
        return render(request, 'upload_dicoms.html', context)
    else:
        return render(request, 'upload_dicoms.html', {'msg': None})



@login_required(login_url='login1')
def questionmain(request):
    if request.method == 'GET':
        return render(request,'questionmain.html')


@login_required(login_url='login1')
def start(request):
    if request.method == 'GET':
        user = request.user
        data = request.GET
        exams = models.Examrecord.objects.filter(uid=user).order_by('-id')
        exam = exams[0]
        res = exam.jiagong()
        exam_id = exam.id
        points_sum = exam.grade
        paginator = Paginator(res, 1)
        page_number = request.GET['page']
        page_obj = paginator.get_page(page_number)
        try:
            page_number = int(page_number)
        except Exception as e:
            page_number = 1
        page_obj = paginator.get_page(page_number)
        id_paginator = True if paginator.num_pages > 1 else False
        print(page_obj)
        for i in page_obj.object_list:
            print(1212,i,type(i))
            qs_id = i['question'].id
        print('now:',page_number)
        # if page_number == 1000:
        #     return HttpResponse("This set of papers has been finished")
        context = {'page_obj': page_obj, 'paginator': paginator, 'id_paginator': id_paginator, 'xu': page_number,'exam_id':exam_id,'qs_id':qs_id,'points_sum':points_sum}
        return render(request, 'nes_test_question.html', context)
    elif request.method == 'POST':


        data = request.POST

        print('im in post')
        answer_id = data['flexRadioDefault1']
        exam_id = data['exam_id']
        qs_id = data['qs_id']
        # 返回值代表的含义
        # 0 代表写错了
        # 1 代表写对了
        # 3 本题已经做过，之前做错了,不能再写了
        # 4 本题已经做过，之前做对了,不能再写了
        # -1 运行出错
        exam = models.Examrecord.objects.get(id=exam_id)
        res = {
            'code':-1,
            'points_sum':exam.grade,
            'xu':0
        }
        try:
            exam = models.Examrecord.objects.get(id=exam_id)
            exam_qs = models.questions.objects.filter(Exam=exam).order_by('-id')
            last_q = exam_qs[0]
            questions = models.questions.objects.get(id=qs_id)

            answer = models.AnswerTable.objects.get(id=answer_id)
            question = answer.qid
            print(last_q.id,qs_id)
            if int(last_q.id) == int(qs_id):
                res['xu'] = 1
            print(res)
            if questions.flag != '0': # 已经做过，无法再次做
                if questions.flag == '-1': # 之前做错了
                    res['code'] = 3
                    res['points_sum'] = exam.grade
                    return JsonResponse(res)
                    # return HttpResponse(3)
                elif questions.flag == '1': # 之前做对了
                    res['code'] = 4
                    res['points_sum'] = exam.grade
                    return JsonResponse(res)
                    # return HttpResponse(4)

            else:  # 第一次做
                if answer.answerstate == '0':
                    questions.flag = -1 # 代表错误
                    questions.answer = answer
                    exam.grade += 0
                    exam.save()
                    questions.save()
                    print("0000")
                    di = {
                        '':0
                    }
                    res['code'] = 0
                    res['points_sum'] = exam.grade
                    return JsonResponse(res)
                    # return JsonResponse(di)
                    # return HttpResponse(0)
                elif answer.answerstate == '1':
                    questions.flag = 1  # 代表正确
                    questions.answer = answer
                    exam.grade += 10
                    exam.save()
                    questions.save()
                    print("1111")
                    res['code'] = 1
                    res['points_sum'] = exam.grade
                    return JsonResponse(res)
                    # return HttpResponse(1)
        except:
            print("-1-1-1-1")
            res['code'] = -1
            return JsonResponse(res)
            # return HttpResponse(-1)


def po(request):
    if request.method == 'GET':
        data = request.GET
        user = request.user
        exam = user.userform.zujuan()
        return render(request, 'questionmain1.html')


dic = {
    'A':1,
    'B':2,
    'C':3,
    'D':4,
    'E':5
}

@login_required(login_url='login1')
def add_question(request):
    if request.method == 'GET':
        user = request.user
        if user.is_superuser:
            return render(request, 'add_question2.html')
        else:
            url = reverse('myhome_index')
            return HttpResponse(f'<script>alert("permission");location.href="' + url + '";</script>')
    elif request.method == 'POST':
        user = request.user
        if user.is_superuser:
            data = request.POST
            print(data)
            uploadedFile_list = request.FILES.getlist('Scores')
            dcm_file = False
            for uploadedFile in uploadedFile_list:
                if not uploadedFile:
                    return render(request, 'add_question.html', {'msg': 'No file selected'})
                if uploadedFile.name.rfind(".") != -1:
                    if uploadedFile.name.rfind("DCM") == -1 and uploadedFile.name.rfind("dcm") == -1:
                        return render(request, 'add_question.html', {'msg': 'Must choose dicom file'})
                    else:
                        dcm_file = True


            print(uploadedFile_list)
            models.Question(qname=data['question'],explanation=data['explanation'],references=data['references']).save()
            question = models.Question.objects.filter(qname=data['question'],explanation=data['explanation'],references=data['references'])
            question = question[0]
            right = dic[data['right_answer']]
            answers = [data['answer1'],data['answer2'],data['answer3'],data['answer4'],data['answer5']]
            id = question.id
            dicom_up(uploadedFile_list, dcm_file=dcm_file, qid=id,question=question)
            file = request.FILES.get('img_url', None)
            if file:
                loads = f'static\\question\\e\\{id}.png'
                with open(loads, 'wb+') as fp:
                    for chunk in file.chunks():
                        fp.write(chunk)
                url = f'\\static\\question\\e\\{id}.png'
                models.Questionex(qid=question,e_url=url).save()
            j = 1
            for i in answers:
                flag = 0
                if j == right:
                    flag = 1
                models.AnswerTable(qid=question,answer=i,answerstate=flag).save()
                j += 1
            url = reverse('add_question')
            return HttpResponse(f'<script>alert("You have successfully added a question！");location.href="' + url + '";</script>')
        else:
            url = reverse('myhome_index')
            return HttpResponse(f'<script>alert("permission");location.href="' + url + '";</script>')
        # return redirect('all_question_addmin')
        # return render(request,'admin_all_question.html',context)
        # return HttpResponse(1)




def dicom_up(uploadedFile_list,dcm_file,qid,question):
    DATA_DIR1 = os.path.join(os.path.join(BASE_DIR, "static"),"recent_dicom")
    # Create a folder to store uploaded files
    i = 1
    for uploadedFile in uploadedFile_list:
        if dcm_file == True:
            uploadDir = os.path.join(DATA_DIR1, uploadedFile.name[:-4])
        else:
            uploadDir = os.path.join(DATA_DIR1, uploadedFile.name)
        while (os.path.exists(uploadDir)):
            if dcm_file == True:
                uploadedFile.name = uploadedFile.name[:-4] + "_1.DCM"
                uploadDir = os.path.join(DATA_DIR1, uploadedFile.name[:-4])
            else:
                uploadedFile.name = uploadedFile.name + "_1"
                uploadDir = os.path.join(DATA_DIR1, uploadedFile.name)
        if not isdir(uploadDir):
            mkdir(uploadDir)
            imgsDir = os.path.join(uploadDir, "images")
            mkdir(imgsDir)
            predictDir = os.path.join(uploadDir, "predict")
            mkdir(predictDir)
        # Upload
        dstFilename = join(uploadDir, uploadedFile.name)
        if dcm_file == True:
            upload_subjects.append(uploadedFile.name[:-4])
        else:
            upload_subjects.append(uploadedFile.name)
        with open(dstFilename, 'wb') as fp:
            for chunk in uploadedFile.chunks():
                fp.write(chunk)
        transform_image_from_simpleitk2(dstFilename, imgsDir,id=qid,i=i,question=question)
        i += 1



@login_required(login_url='login1')
def all_question_addmin(request):
    if request.method == 'GET':
        user = request.user
        if user.is_superuser:
            res_list = []
            questions = models.Question.objects.filter(state=1)
            count = questions.count()
            ii = 1
            for q in questions:
                res_list.append({'q':q,'xu':ii})
                ii += 1
            # count = questions.count()
            # list_count = range(1,count+1)
            # res = zip(questions,list_count)
            # res = list(res)

            paginator = Paginator(res_list, 10)
            page_number = request.GET['page']
            page_obj = paginator.get_page(page_number)
            try:
                page_number = int(page_number)
            except Exception as e:
                page_number = 1
            page_obj = paginator.get_page(page_number)
            print(page_obj)
            for p in page_obj.object_list:
                print(p,type(p))
            id_paginator = True if paginator.num_pages > 1 else False
            context = {'page_obj': page_obj, 'paginator': paginator, 'id_paginator': id_paginator, 'xu': page_number}
            return render(request,'admin_all_question.html',context)
        else:
            url = reverse('myhome_index')
            return HttpResponse(f'<script>alert("permission");location.href="' + url + '";</script>')


@login_required(login_url='login1')
def edit_question(request,id):
    if request.method == 'GET':
        user = request.user
        if user.is_superuser:
            question = models.Question.objects.get(id=id)
            answers = models.AnswerTable.objects.filter(qid=question)
            options = ['A', 'B', 'C', 'D', 'E']
            a_s = zip(answers,options)
            answer1 = answers[0]
            answer2 = answers[1]
            answer3 = answers[2]
            answer4 = answers[3]
            answer5 = answers[4]
            for a in answers:
                print(a)
            for answer, option in a_s:
                print(answer,option)
                if answer.answerstate == '1':
                    right_option = option
            print(a_s)
            print(right_option)
            context = {'question':question,'right_option':right_option,'answers':answers,'answer1':answer1,'answer2':answer2,'answer3':answer3,'answer4':answer4,'answer5':answer5}
            return render(request,'edit_question2.html',context)
        else:
            url = reverse('myhome_index')
            return HttpResponse(f'<script>alert("permission");location.href="' + url + '";</script>')
    elif request.method == 'POST':
        user = request.user
        if user.is_superuser:
            data = request.POST
            print(data)
            try :
                right = dic[data['right_answer']]
            except :
                right = -1
            print(right)
            question = models.Question.objects.get(id=data['id'])
            answers = models.AnswerTable.objects.filter(qid=question)
            question.qname = data['question']
            question.explanation = data['explanation']
            question.references = data['references']
            question.save()
            answers_cd = [data['answer1'] , data['answer2'],data['answer3'],data['answer4'],data['answer5']]
            xu = [1, 2, 3, 4, 5]
            a_x = zip(answers, xu)
            for answer, x in a_x:
                answer.answer = answers_cd[x - 1]
                answer.save()

            if right == -1:
                pass
            else:
                for answer in answers:
                    if answer.answerstate == '1':
                        answer.answerstate = '0'
                        answer.save()
                xu = [1, 2, 3, 4, 5]
                a_x = zip(answers, xu)
                for answer,x in a_x:
                    print('sdfg')
                    if x == right:
                        answer.answerstate = '1'
                        answer.save()
            url = reverse('edit_question',args=(question.id,))
            return HttpResponse(f'<script>alert("modify successfully ");location.href="' + url + '";</script>')
        else:
            url = reverse('myhome_index')
            return HttpResponse(f'<script>alert("permission");location.href="' + url + '";</script>')


def del_question(request,qid):
    if request.method == 'GET':
        question = models.Question.objects.get(id=qid)
        question.state = '0'
        question.save()
        url = reverse('all_question_addmin')
        return HttpResponse(f'<script>alert("delate successfully ");location.href="' + url + '?page=1''";</script>')

def Projection(request):
    if request.method == 'GET':
        return render(request, 'Projection.html')

def return_cookies(request):
    if request.method == 'GET':
        try:
            value = request.COOKIES['mode']
        except KeyError:
            value = 'light'
        return JsonResponse({'data':value})

def updatecookie(request):
    if request.method == 'POST':
        name = request.POST['name']
        value = request.POST['value']
        response = HttpResponse("OK")
        response.set_cookie(name, value)
        return response