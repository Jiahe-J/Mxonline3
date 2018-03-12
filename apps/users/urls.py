#!/usr/bin/env python
# -*- coding: utf-8 -*-
""" 
@author:silenthz 
@file: urls.py 
@time: 2018/03/12 
"""
from courses.views import CourseListView, CourseDetailView, CourseInfoView, CommentsView, AddCommentsView, VideoPlayView
from django.urls import path, re_path

from users.views import UserInfoView, UploadImageView, UpdatePwdView, SendEmailCodeView, UpdateEmailView

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
]
