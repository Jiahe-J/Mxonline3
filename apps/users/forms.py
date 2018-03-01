#!/usr/bin/env python
# -*- coding: utf-8 -*-
""" 
@author:silenthz 
@file: forms.py 
@time: 2018/03/01 
"""
# 引入Django表单
from  django import forms


# 登录表单验证
class LoginForm(forms.Form):
    # 用户名密码不能为空
    username = forms.CharField(required=True)
    password = forms.CharField(required=True, min_length=6)
