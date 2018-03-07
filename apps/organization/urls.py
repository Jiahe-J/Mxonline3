#!/usr/bin/env python
# -*- coding: utf-8 -*-
""" 
@author:silenthz 
@file: urls.py 
@time: 2018/03/07 
"""

from organization.views import OrgView, AddUserAskView
from django.urls import path, re_path

app_name = 'organization'

urlpatterns = [
    # 课程机构列表url
    path('list/', OrgView.as_view(), name="org_list"),

    # 添加我要学习
    path('add_ask/', AddUserAskView.as_view(), name="add_ask")
]
