from django.db import models
from django.contrib.auth.models import User
import time
import datetime
from mdeditor.fields import MDTextField
import random
question_count = 3
# Create your models here.
class Userform(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    nickname = models.CharField('昵称',max_length=50)
    #手机号码(先留着)
    phonenumber = models.CharField(blank=True, max_length=20,default=True)
    #个性签名(先留着)
    signature = models.CharField( blank=True, max_length=50,default=True)
    # 头像(先留着)
    img_url = models.CharField(max_length=150,null=True,default=True)
    gender = models.CharField(max_length=10,default=1)
    class Meta:
        verbose_name_plural = "userform"
    def zujuan(self):
        user = self.user
        all_question = Question.objects.filter(state=1)
        l = 0
        r = all_question.count()
        num = range(l, r)
        nums = random.sample(num, question_count)
        res = []
        examrecord = Examrecord(uid=user).save()
        examrecords = Examrecord.objects.filter(uid=user).order_by('-id')
        examrecord = examrecords[0]
        for index in nums:
            question = all_question[index]
            q = questions(qid=question)
            q.Exam = examrecord
            q.save()
        return examrecord

    def __str__(self):
        return self.user

class Leave_Message(models.Model):
    title = models.CharField('标题',max_length=32)
    content = models.CharField('内容',max_length=256)
    create_time = models.DateTimeField('留言创建时间',auto_now_add=True)
    update_time = models.DateTimeField('留言最后一次修改的时间',auto_now=True)
    uid = models.ForeignKey(User,on_delete=models.CASCADE)
    flag = models.CharField(max_length=25, default=1)
    def all_comments(self):
        comments = self.message_comment.all().order_by('-id')

    def __str__(self):
        return self.title


class Comment(models.Model):
    uid = models.ForeignKey(User,on_delete=models.CASCADE)
    content = models.CharField(max_length=256)
    username = models.CharField(max_length=256)

    message_id = models.ForeignKey(Leave_Message,related_name="message_comment",on_delete=models.DO_NOTHING,null=True,blank=True,default=True)
    message_user_id = models.ForeignKey(User,related_name="message_com_user",on_delete=models.DO_NOTHING,null=True,blank=True,default=True)
    message_user_username = models.CharField(max_length=25,default=True)

    parent = models.ForeignKey("Comment",related_name="comment_first_son",on_delete=models.DO_NOTHING,null=True,blank=True,default=True)
    parent_user_id = models.ForeignKey(User,related_name="conment_first_son_user",on_delete=models.DO_NOTHING,null=True,blank=True,default=True)
    parent_user_username = models.CharField(max_length=25,default=True)

    flag = models.CharField(max_length=25, default=1)
    comment_level = models.CharField(max_length=10)
    create_time = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.content

class Notice(models.Model):
    title = models.CharField('标题 ',max_length=50)
    # content = models.CharField('内容',max_length=1024)
    content = MDTextField(null=True)
    flag = models.CharField(max_length=25,default=1)
    create_time = models.DateTimeField(auto_now_add=True)
    views = models.FloatField(default=0, max_length=30, null=False)

    def __str__(self):
        return self.title

class Views_count(models.Model):
    uid = models.ForeignKey(User,on_delete=models.CASCADE)
    nid =  models.ForeignKey(Notice,on_delete=models.CASCADE)
    last_view_time = models.DateTimeField(auto_now_add=True)

class Img(models.Model):
    uid = models.ForeignKey(User,on_delete=models.CASCADE)
    name = models.CharField(max_length=30)
    img = models.CharField(max_length=5000,null=True)


class Examrecord(models.Model):
    uid = models.ForeignKey(User,on_delete=models.CASCADE)
    create = models.DateTimeField(auto_now_add=True)
    grade = models.IntegerField(null=True,default=0)
    def jiagong(self):
        all_question = self.questions_set.all()
        res = []
        r = all_question.count()
        for index in range(r):
            question = all_question[index]
            print(question,type(question))
            c = AnswerTable.objects.filter(qid=question.qid.id)
            num1 = range(0, 5)
            num1s = random.sample(num1, 5)
            answers_list = []
            for i in num1s:
                answers_list.append(c[i])
            answers = zip(answers_list, ['A', 'B', 'C', 'D', 'E'])
            for answer, option in answers:
                if answer.answerstate == '1':
                    right_option = option
            ex = question.qid.questionex_set.all()
            right_answer = AnswerTable.objects.filter(qid=question.qid.id, answerstate=1)[0]
            try:
                gifs = question.qid.questiongif_set.all()
                gif = gifs[0]
                gif = str(gif.q_url)
                gif = str(str(gif)[0:27])
                gifs_count = gifs.count()
                num2 = range(1, gifs_count + 1)
                gifs2 = zip(gifs, num2)
                gid = question.qid
            except:
                gifs = question.qid.questiongif_set.all()
                gif = []
                gid = question.qid
                gifs_count = gifs.count()
                num2 = range(1, gifs_count + 1)
                g_count = question.qid
            print(111,gid)
            dic = {
                'question': question,
                'answers': zip(answers_list, ['A', 'B', 'C', 'D', 'E']),
                'right_answer': right_answer,
                'right_option': right_option,
                'gifs': zip(gifs, num2),
                'ex': ex,
                'huan': 3,
                'gif': gif,
                'gid': gid.id,
                'g_count': gifs.count()
            }
            res.append(dic)
        return res

class Question(models.Model):
    qname = models.CharField(max_length=256)
    explanation = models.TextField(max_length=5000)
    state = models.CharField(max_length=256,default=1,null=True) # 1代表正常 0 代表被删除
    references = models.CharField(max_length=256,null=True)

class AnswerTable(models.Model):
    qid = models.ForeignKey(Question,on_delete=models.CASCADE,related_name="Answers")
    answer = models.CharField(max_length=256)
    answerstate = models.CharField(max_length=10,default=0)

class questions(models.Model):
    qid = models.ForeignKey(Question,on_delete=models.CASCADE)
    flag = models.CharField(max_length=256,default=0) # 0 未作 1 正确 -1 错误
    answer = models.ForeignKey(AnswerTable,on_delete=models.CASCADE,null=True)
    Exam = models.ForeignKey(Examrecord, on_delete=models.CASCADE,  null=True)

class Questiongif(models.Model):
    qid = models.ForeignKey(Question,on_delete=models.CASCADE)
    q_url = models.CharField(max_length=256,null=True)

class Questionex(models.Model):
    qid = models.ForeignKey(Question, on_delete=models.CASCADE)
    e_url = models.CharField(max_length=256, null=True)


class picturnameandeurl(models.Model):
    patient_name = models.CharField(max_length=256)
    LAOpictureurl = models.CharField(max_length=256)
    RAOpictureurl = models.CharField(max_length=256)
    LAOjsurl=  models.CharField(max_length=256)
    RAOjsurl=  models.CharField(max_length=256)
    LAOabsolutelypictureurl = models.CharField(max_length=256)
    RAOabsolutelypictureurl = models.CharField(max_length=256)
class Betainfo(models.Model):
    name = models.CharField(max_length=256)
    ProgramName = models.CharField(max_length=256)
    TraineeStatus = models.CharField(max_length=256)
    Email = models.CharField(max_length=256)
class Case(models.Model):
    case = models.CharField(max_length=60)  # 病例

    class Meta:
        db_table = "case"  # 更改表名
class CltCase(models.Model):
    who_clt = models.ForeignKey(to=Userform, on_delete=models.CASCADE)  # 谁收藏
    clt_relation_case = models.ForeignKey(to=Case, on_delete=models.CASCADE)  # 收藏了哪个病例


    class Meta:
        db_table = "cltcase"  # 更改表名