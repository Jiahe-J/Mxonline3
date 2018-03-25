#!/usr/bin/env python
# -*- coding: utf-8 -*-
""" 
@author:silenthz 
@file: urls.py 
@time: 2018/03/12 
"""
from django.urls import path

from users.views import UserInfoView, UploadImageView, UpdatePwdView, SendEmailCodeView, UpdateEmailView, MyCourseView, MyFavOrgView, \
    MyFavTeacherView, MyFavCourseView, MyMessageView

app_name = "courses"
urlpatterns = [
    # 个人信息页
    path('info/', UserInfoView.as_view(), name="user_info"),
    # 用户头像上次
    path('image/upload/', UploadImageView.as_view(), name="image_upload"),
    # 用户密码修改
    path('update/pwd/', UpdatePwdView.as_view(), name="pwd_update"),
    # 发送邮箱验证码
    path('sendemail_code/', SendEmailCodeView.as_view(), name="sendemail_code"),
    # 修改邮箱
    path('update_email/', UpdateEmailView.as_view(), name="update_email"),
    # 用户中心我的课程
    path('mycourse/', MyCourseView.as_view(), name="mycourse"),
    # 我收藏的课程机构
    path('myfav/org/', MyFavOrgView.as_view(), name="myfav_org"),
    # 我收藏的授课讲师
    path('myfav/teacher/', MyFavTeacherView.as_view(), name="myfav_teacher"),
    # 我收藏的课程
    path('myfav/course/', MyFavCourseView.as_view(), name="myfav_course"),
    # 我的消息
    path('my_message/', MyMessageView.as_view(), name="my_message"),

]
