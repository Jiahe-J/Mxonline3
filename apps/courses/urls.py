#!/usr/bin/env python
# -*- coding: utf-8 -*-
""" 
@author:silenthz 
@file: urls.py 
@time: 2018/03/10 
"""
from courses.views import CourseListView
from django.urls import path
app_name = "courses"
urlpatterns = [
    # 课程列表url
    path('list/', CourseListView.as_view(), name="list"),

]