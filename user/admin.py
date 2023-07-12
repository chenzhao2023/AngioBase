from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import User
from .models import Userform, Leave_Message,Comment,Notice,Img,Question,AnswerTable,Questiongif,Questionex,questions,Examrecord


# Register your models here.


class userformInline(admin.TabularInline):
    model = Userform
    can_delete = False
    verbose_name_plural = 'userform'

class ImgAdmin(admin.ModelAdmin):
    list_display = ('id','img','uid')
    list_filter = ('uid',)
    list_per_page = 20

class Leave_MessageAdmin(admin.ModelAdmin):
    list_display = ('title','content','create_time','flag')
    list_filter = ('uid',)
    list_per_page = 20

class QuestionAdmin(admin.ModelAdmin):
    list_display = ('qname',)
    # list_filter = ()
    list_per_page = 10

class AnswerTableAdmin(admin.ModelAdmin):
    list_display = ('id','qid','answer','answerstate')
    list_filter = ('qid',)
    list_per_page = 10

class QuestiongifAdmin(admin.ModelAdmin):
    list_display = ('id','qid','q_url',)
    list_filter = ('qid',)
    list_per_page = 10

class QuestionexAdmin(admin.ModelAdmin):
    list_display = ('id','qid','e_url',)
    list_filter = ('qid',)
    list_per_page = 10

class questionsAdmin(admin.ModelAdmin):
    list_display = ('id','qid','Exam',)
    list_filter = ('qid','Exam',)
    list_per_page = 10

class ExamrecordAdmin(admin.ModelAdmin):
    list_display = ('id','uid','create',)
    list_filter = ('id','uid',)
    list_per_page = 10


admin.site.unregister(User)
admin.site.register(User, UserAdmin)
admin.site.register(Userform)
admin.site.register(Leave_Message,Leave_MessageAdmin)
admin.site.register(Comment)
admin.site.register(Notice)
admin.site.register(Question,QuestionAdmin)
admin.site.register(AnswerTable,AnswerTableAdmin)
admin.site.register(Questiongif,QuestiongifAdmin)
admin.site.register(Questionex,QuestionexAdmin)
admin.site.register(questions,questionsAdmin)
admin.site.register(Examrecord,ExamrecordAdmin)


# admin.site.register(Img_Admin)
# admin.site.register(Views_count)
