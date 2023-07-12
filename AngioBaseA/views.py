import datetime
import shutil

from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect
import os
from angio_base.settings import BASE_DIR
from django.shortcuts import render
from rest_framework.views import View
from rest_framework.response import Response
import numpy as np
import cv2
import user.models
from django.contrib.auth.decorators import login_required
import json

import xlwt


class TestView(View):
    def dispatch(self, request, *args, **kwargs):
        """
        请求到来之后，都要执行dispatch方法，dispatch方法根据请求方式不同触发 get/post/put等方法

        注意：APIView中的dispatch方法有好多好多的功能
        """
        return super().dispatch(request, *args, **kwargs)

    def get(self, request, *args, **kwargs):
        return render(request, "index.html")

    def post(self, request, *args, **kwargs):
        return Response('POST请求，响应内容')

    def put(self, request, *args, **kwargs):
        return Response('PUT请求，响应内容')


@login_required()
def point(request):
    if request.method == 'POST':
        X = int(request.POST.get("arcX"))
        Y = int(request.POST.get("arcY"))
        mouse_point = [Y, X]
        vessel_name = request.POST.get("vessel_name")
        patient_name = request.POST.get("patient_name")
        angle = request.POST.get("angle")

        name, pointList, namelist = judge_point(patient_name, angle, mouse_point, vessel_name)

    context = {'vesselName': name,
               'pointList': pointList,
               'namelist': namelist}

    return JsonResponse(context)


@login_required()
def map_point(request):
    if request.method == 'POST':
        X = int(request.POST.get("arcX"))
        Y = int(request.POST.get("arcY"))
        mouse_point = [Y, X]
        patient_name = request.POST.get("patient_name")
        angle = request.POST.get("angle")
        print(mouse_point, patient_name, angle)

        def judge_point(patientName, angle, point):
            vesselName = 'a'
            print(patient_name)

            point_list = []
            other_point_list = []
            Label_names1 = ["LAD", "R1", "D1", "D2", "LCX", "OM1", "OM2", "LMA"]
            # -----shujuku   ok
            # patient_path = os.path.join(ZIP_DIR, 'json')
            # patient_path1 = os.path.join(patient_path, patientName)
            # angle_path = os.path.join(patient_path1, '{}.json'.format(angle))
            angle_path =user.models.picturnameandeurl.objects.filter(patient_name=patientName).first()
            #  patient_name != '0NaN'patien_name为空
            if angle == 'RAO':
                angle_path = angle_path.RAOjsurl
            elif angle == 'LAO':
                angle_path = angle_path.LAOjsurl
            angle_path = os.path.join(BASE_DIR,angle_path)
            print('path',angle_path)
            with open(angle_path) as f:
                get = json.load(f)
            for name in get:
                if name in Label_names1:
                    for i in get[name]:
                        if point == i:
                            vesselName = name
                            point_list = get[name]
                            continue

            if len(vesselName) < 2:
                vesselName = ''
            else:
                for name in get:
                    if vesselName != name and name in Label_names1:
                        other_point_list.append(get[name])
            return vesselName, point_list, other_point_list

        name, pointList,other_point = judge_point(patient_name, angle, mouse_point)

    context = {'vesselName': name,
               'pointList': pointList,
               'otherPoint': other_point}

    return JsonResponse(context)


@login_required()
def get_add_png_path(request):
    if request.method == 'POST':
        vessel_name = request.POST.get("vessel_name")
        patient_name = request.POST.get("patient_name")
        angle = request.POST.get("angle")
        print(vessel_name, patient_name, angle)
        jsonpath = os.path.join('..\static', 'json')
        patient_name_path = os.path.join(jsonpath, patient_name)
        filepath = os.path.join(patient_name_path, 'add_{}'.format(angle))
        end_path = os.path.join(filepath, '{}_{}.png'.format(angle, vessel_name))
        print(end_path)
    context = {'endPath': end_path}

    return JsonResponse(context)


def get_vessel(request):
    if request.method == 'GET':
        patient_name = request.GET.get("patient_name")
        vesselname = request.GET.get("vessel_name")
        patient_path = os.path.join(ZIP_DIR, 'json')
        patient_path1 = os.path.join(patient_path, patient_name)
        LAO_path = os.path.join(patient_path1, 'LAO.json')
        RAO_path = os.path.join(patient_path1, 'RAO.json')
        LAO_pointlist = get_json(LAO_path, vesselname)
        RAO_pointlist = get_json(RAO_path, vesselname)
        context = {"LAO_pointlist": LAO_pointlist,
                   "RAO_pointlist": RAO_pointlist,
                   }
    return JsonResponse(context)


def get_all_vessel(request):
    if request.method == 'POST':
        patient_name = request.POST.get("patient_name")
        angle = request.POST.get("angle")

        Label_names1 = ["LAD", "R1", "D1", "D2", "LCX", "OM1", "OM2", "LMA"]
        ## shujuku ---ok
        # patient_path = os.path.join(ZIP_DIR, 'json')
        # patient_path1 = os.path.join(patient_path, patient_name)
        # # print(patient_path1)
        all_vessel_list = []
        # json_path = os.path.join(patient_path1, '{}.json'.format(angle))
        json_path = user.models.picturnameandeurl.objects.filter(patient_name=patient_name).first()
        if angle == 'RAO':
            json_path = json_path.RAOjsurl
        else:
            json_path = json_path.LAOjsurl

        with open(json_path) as f:
            get = json.load(f)

        for x in get.keys():
            if x in Label_names1:

                all_vessel_list.append(get[x])
        postinfor = get["postinfor"]
        print(postinfor)
        context = {"all_vessel_list": all_vessel_list,
                   "postinfor":postinfor
                   }

    return JsonResponse(context)


def get_main_angle(request):
    if request.method == 'POST':
        patient_name = request.POST.get("patient_name")

        # ---------shujuku --- ok
        # patient_path = os.path.join(ZIP_DIR, 'json')
        # patient_path1 = os.path.join(patient_path, patient_name)
        # json_path_LAO = os.path.join(patient_path1, 'LAO.json')
        # json_path_RAO = os.path.join(patient_path1, 'RAO.json')
        json_path = user.models.picturnameandeurl.objects.filter(patient_name=patient_name).first()

        json_path_RAO = json_path.RAOjsurl
        json_path_LAO = json_path.LAOjsurl
        def get_single(json_path):
            with open(json_path) as f:
                get = json.load(f)
            postinfor = get["postinfor"]
            return postinfor

        postinfor1,postinfor2 = get_single(json_path_LAO),get_single(json_path_RAO)

        context = {"postinfor1": postinfor1,
                   "postinfor2":postinfor2
                   }
    print(context)



    return JsonResponse(context)


def get_path(request):
    if request.method == 'POST':
        patient_name = request.POST.get("patient_name")
        patient_name_id = patient_name[4:9]

        case = user.models.picturnameandeurl.objects.get(patient_name=patient_name)


        # 如果收藏夹里尚未有这个收藏：那个按钮应该是空心的。传送fav_status来表示收藏状态
        uid = request.user.id # session中提取当前登录的用户

        fav_list = user.models.CltCase.objects.filter(who_clt_id=uid)  # 找出所有该用户的收藏
        if fav_list.filter(clt_relation_case_id=patient_name_id):  # 检查有没有该小说id
            fs = 1  # 已收藏
        else:
            fs = 0  # 未收藏
        print(fs)

        # todo filter和get的区别：filter筛选所有条件，queryset返回列表；get返回一个，有多个或没有找到会报错
        context = {"LAOpictureurl": case.LAOpictureurl,
                   "RAOpictureurl": case.RAOpictureurl,
                   "LAOjsurl": case.LAOjsurl,
                   "RAOjsurl": case.RAOjsurl,

                   'fav_status': fs,
                   }
        return JsonResponse(context)


# 收藏夹操作
def web_favourite_handle(request):
    sid = request.POST.get('patient_name')  # 前端获取被点击的小说id
    print(sid)
    sid_id =int(sid[4:9])
    print(sid_id)
    uid = request.user.id  # session中提取是哪个用户要保存，即当前登录的用户
    cltn = user.models.CltCase()

    # 如果收藏夹里尚未有这个收藏：那就收藏这个条目
    # 如果收藏夹里已经有了，那就取消收藏
    fav_list = user.models.CltCase.objects.filter(who_clt_id=uid)  # 找出所有该用户的收藏


    if fav_list.filter(clt_relation_case_id=sid_id):  # 检查有没有该小说id
        fav_list.filter(clt_relation_case_id=sid_id).delete()  # 收藏夹里已经有了，取消收藏
        fs = 0  # 未收藏
        context = {
            'fav_status': fs,
        }
        return JsonResponse(context)
    else:
        cltn.who_clt_id = uid
        cltn.clt_relation_case_id = sid_id
        cltn.save()  # 收藏夹里尚未有这个收藏：收藏这个条目
        fs = 1  # 已收藏
        context = {
            'fav_status': fs,
        }
        return JsonResponse(context)






def get_pat_count(request):
    if request.method == 'POST':
        i = 0

        path = json_dir
        for j in os.listdir(path):
            i+=1
        print('--------------',i)
        context = {"pat_count": i
                   }
    return JsonResponse(context)

def get_pro_count(request):
    if request.method == 'POST':
        i = 0

        path = projection_dir
        for j in os.listdir(path):
            i+=1
        print('--------------',i)
        context = {"pro_count": i
                   }
    return JsonResponse(context)

def get_json(jsonpath, vesselName):
    pointX = []
    pointY = []
    with open(jsonpath) as f:
        get = json.load(f)
    point_list = get[vesselName]
    return point_list


@login_required()
def get_length(request):
    patient_name = request.POST.get("patient_name")

    def getlength(patientName, angle):
        namelist = []
        Label_names1 = ["LAD", "R1", "D1", "D2", "LCX", "OM1", "OM2", "LMA"]
        patient_path = os.path.join(ZIP_DIR, 'json')
        # patient_path1 = os.path.join(patient_path, patientName)
        # angle_path = os.path.join(patient_path1, '{}.json'.format(angle))
        angle_path = user.models.picturnameandeurl.objects.filter(patient_name=patientName).first()
        if angle == 'RAO':
            angle_path = angle_path.RAOjsurl
        else:
            angle_path = angle_path.LAOjsurl
        angle_path = os.path.join(BASE_DIR, angle_path)
        print('path', angle_path)
        with open(angle_path) as f:
            get = json.load(f)
        for name in get:
            if name in Label_names1:
                namelist.append(name)
        return namelist

    namelist = getlength(patient_name, 'LAO')
    context = {
        'name': namelist
    }
    return JsonResponse(context)


def judge_point(patientName, angle, point, vessel_name):
    vesselName = 'a'
    # pointX = []
    # pointY = []
    namelist = []
    point_list = []
    Label_names1 = ["LAD", "R1", "D1", "D2", "LCX", "OM1", "OM2", "LMA"]
    # shujuku

    # patient_path = os.path.join(ZIP_DIR, 'json')
    # patient_path1 = os.path.join(patient_path, patientName)
    # # angle=='LAO'
    # # case LAOJSjosn
    # angle_path = os.path.join(patient_path1, '{}.json'.format(angle))
    angle_path = user.models.picturnameandeurl.objects.filter(patient_name=patientName).first()
    if angle == 'RAO':
        angle_path = angle_path.RAOjsurl
    else:
        angle_path = angle_path.LAOjsurl
    angle_path = os.path.join(BASE_DIR, angle_path)
    print('path', angle_path)
    with open(angle_path) as f:
        get = json.load(f)
    for name in get:
        if name in Label_names1:
            namelist.append(name)
            for i in get[name]:
                if point == i:
                    vesselName = name
    if len(vesselName) < 2:
        vesselName = 'b'
    if vessel_name in get:
        point_list = get[vessel_name]


    return vesselName, point_list, namelist


# filepath = 'json/patient1/semantic_LAO'
# @login_required()
# def getTheVessel(filepath):
#     label_mask = np.zeros((512, 512))
#     for single_vessel in os.listdir(filepath):
#         vessel_path = os.path.join(filepath, single_vessel)
#
#         vessel_de = cv2.imread(vessel_path, cv2.IMREAD_GRAYSCALE)
#         for x in range(512):
#             for y in range(512):
#                 if vessel_de[x][y] == 255:
#                     print(x, y)
#                     label_mask[x][y] = 255
#     cv2.imwrite('json/patient1/semantic_LAO/vessel_map.png', label_mask)


from django.contrib.auth.decorators import login_required

ZIP_DIR = os.path.join(BASE_DIR, "static")
DATA_DIR = os.path.join(os.path.join(BASE_DIR, "static"), "upload")
json_dir = os.path.join(os.path.join(BASE_DIR, "static"), "json")
projection_dir = os.path.join(os.path.join(BASE_DIR, "static"), "Projection")
@login_required()
def get_patient_path(request):
    if request.method == 'POST':
        patient_name = request.POST.get("name")
        print(patient_name)
        angle_path = user.models.picturnameandeurl.objects.filter(patient_name=patient_name).first()
        filepath1 = angle_path.RAOabsolutelypictureurl

        filepath2 = angle_path.LAOabsolutelypictureurl
        # filepath1 = os.path.join(os.path.join(os.path.join(ZIP_DIR, 'json'), patient_name), 'LAO.png')
        # filepath2 = os.path.join(os.path.join(os.path.join(ZIP_DIR, 'json'), patient_name), 'RAO.png')
        print(filepath1)
        print(filepath2)
    context = {'filepath1': filepath1,
               'filepath2': filepath2}
    return JsonResponse(context)


def index(request):
    news_all = user.models.Notice.objects.all().filter(flag=1).order_by('-id')
    news_list_l = []
    news_list_r = []
    i = 0
    for news in news_all:
        i += 1
        res = {
            'id': news.id,
            'title': news.title,
            'content': str(news.content)[0:300],
            #'content': str(news.content),
            'year': str(news.create_time)[0:4],
            'month': str(news.create_time)[5:7],
            'day': str(news.create_time)[8:11],
            'create_time': news.create_time,
        }
        print(res['content'])
        if i <= 1:
            news_list_l.append(res)
        elif i <= 2:
            news_list_r.append((res))
        else:
            break
    print(len(news_list_l))
    context = {'news_list_l': news_list_l, 'news_list_r': news_list_r}
    return render(request, 'index.html', context)


@login_required(login_url='login1')
def mainPage(request):
    return render(request, 'mainPage.html')


@login_required()
def mainPage2(request):
    return render(request, 'vessel_contour_ide.html')


@login_required()
def mainPage3(request):
    return render(request, 'vessel_map_ide.html')


@login_required()
def image_learning(request):
    return render(request, 'image_learning.html')


@login_required()
def video_learning(request):
    return render(request, 'video_learning.html')


@login_required()
def announcement(request):
    return render(request, 'announcement.html')


@login_required()
def leave_messages(request):
    return render(request, 'leave_messages.html')


@login_required()
def details(request):
    res = request.COOKIES
    print(res)
    is_login = res.get("is_login", "0")
    if is_login == "case1":
        return redirect("upload_dicoms_page")
    else:
        return render(request, 'login.html', context={"error_info": "Please log in again"})

# def logout1(request):
#     res_obj = render(request,'login.html')
#     res_obj.delete_cookie("is_login")
#     res_obj.delete_cookie("username")
#     return res_obj
def Beta_info(request):
    if request.method == 'GET':
        return render(request, 'getBetainfo.html')
    if request.method == 'POST':
        name = request.POST['name']
        ProgramName = request.POST['ProgramName']
        TraineeStatus = request.POST['TraineeStatus']
        other = request.POST['other']
        Email = request.POST['Email']
        if TraineeStatus == 'other':
            user.models.Betainfo.objects.create(name=name, ProgramName=ProgramName,TraineeStatus=other,Email=Email)
        else:
            user.models.Betainfo.objects.create(name=name, ProgramName=ProgramName,TraineeStatus=TraineeStatus,Email=Email)
        response = HttpResponse(content_type='application/ms-excel')
        response['Content-Disposition'] = 'attachment; filename="abc.xls"'
        wb = xlwt.Workbook(encoding='utf-8')
        ws = wb.add_sheet('Info')
        # Sheet header, first row
        row_num = 0
        font_style = xlwt.XFStyle()
        font_style.font.bold = True

        # 表头内容
        columns = ['name', 'ProgramName', 'TraineeStatus', 'Email']

        for col_num in range(len(columns)):
            ws.write(row_num, col_num, columns[col_num], font_style)
        # Sheet body, remaining rows
        font_style = xlwt.XFStyle()

        # 获取数据库数据
        rows = user.models.Betainfo.objects.all().values_list('name', 'ProgramName', 'TraineeStatus', 'Email')
        for row in rows:
            row_num += 1
            for col_num in range(len(row)):
                ws.write(row_num, col_num, row[col_num], font_style)
            # 获取当前路径

        #上一级
        path = os.path.join(ZIP_DIR,'betainfo')
        xlspath = os.path.join(path,'betainfo.xls')
        # 保存文件

        wb.save(xlspath)

        # # 设置要移动文件所在路径
        # cur_path1 = os.path.join(cur_path + '\\static' + '\\betainfo')
        # # 当前文件路径
        # file_path = os.path.join(Path, 'AngioBase0225betainfo.xls')
        # # 使用shutil包的move方法移动文件
        # if(os.path.exists(cur_path1+'\\AngioBase0225betainfo.xls')):
        #     os.remove(cur_path1+'\\AngioBase0225betainfo.xls')
        #
        # shutil.move(file_path, cur_path1)

        return render(request, 'getBetainfo.html')


# def DownBeta_info(request):
#
#
#     response = HttpResponse(content_type='application/ms-excel')
#     response['Content-Disposition'] = 'attachment; filename="abc.xls"'
#     wb = xlwt.Workbook(encoding='utf-8')
#     ws = wb.add_sheet('Info')
#     # Sheet header, first row
#     row_num = 0
#     font_style = xlwt.XFStyle()
#     font_style.font.bold = True
#
#     # 表头内容
#     columns = ['name', 'ProgramName','TraineeStatus','Email']
#
#     for col_num in range(len(columns)):
#         ws.write(row_num, col_num, columns[col_num], font_style)
#     # Sheet body, remaining rows
#     font_style = xlwt.XFStyle()
#
#     # 获取数据库数据
#     rows = user.models.Betainfo.objects.all().values_list('name', 'ProgramName','TraineeStatus','Email')
#     for row in rows:
#         row_num += 1
#         for col_num in range(len(row)):
#             ws.write(row_num, col_num, row[col_num], font_style)
#         # 获取当前路径
#     cur_path = os.path.abspath('.')
#     # 设置生成文件所在路径
#     cur_path =os.path.join( cur_path +'AngioBase0207'+'uploads'+'betainfo')
#     print(cur_path)
#     wb.save(cur_path+'betainfo'+'.xls')
#     return response
def get_clv(request):
    fmod = user.models.CltCase.objects
    uid = request.user.id  # 获取当前哪个用户登录
    fav_list = fmod.filter(who_clt_id=uid)  # 获取用户的所有收藏
    print(fav_list)
    fav_list1 = []
    for i in  fav_list:
        fav_list1.append(i.clt_relation_case_id)
    print(fav_list1)


    return JsonResponse(fav_list1,safe=False)