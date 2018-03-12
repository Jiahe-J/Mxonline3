"""Mxonline3 URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
import xadmin
from django.urls import path, include, re_path
from django.views.generic import TemplateView
from django.views.static import serve

from .settings import MEDIA_ROOT
from organization.views import OrgView
from users.views import LoginView, RegisterView, ActiveUserView, ForgetPwdView, ResetView, ModifyPwdView, LogoutView

urlpatterns = [
    path('xadmin/', xadmin.site.urls),
    # 验证码url
    path("captcha/", include('captcha.urls')),
    path('', TemplateView.as_view(template_name='index.html'), name='index'),
    path('login/', LoginView.as_view(), name="login"),
    path('register/', RegisterView.as_view(), name="register"),
    # 激活用户url，通过?p将后面.*代表全部提取的正则，符合的内容传入参数active_code中
    re_path('active/(?P<active_code>.*)/', ActiveUserView.as_view(), name="user_active"),
    # 忘记密码
    path('forget/', ForgetPwdView.as_view(), name="forget_pwd"),
    # 重置密码urlc ：用来接收来自邮箱的重置链接
    re_path('reset/(?P<active_code>.*)/', ResetView.as_view(), name="reset_pwd"),
    # 修改密码url; 用于passwordreset页面提交表单
    path('modify_pwd/', ModifyPwdView.as_view(), name="modify_pwd"),
    # 课程机构app的url配置
    path("org/", include('organization.urls', namespace='org')),
    # 退出功能url
    path('logout/', LogoutView.as_view(), name="logout"),
    # 处理图片显示的url,使用Django自带serve,传入参数告诉它去哪个路径找，我们有配置好的路径MEDIAROOT
    re_path(r'^media/(?P<path>.*)', serve, {"document_root": MEDIA_ROOT}),
    # 课程app的url配置
    path("course/", include('courses.urls', namespace="course")),
    # 用户app的url配置
    path("users/", include('users.urls', namespace="users"))
]
