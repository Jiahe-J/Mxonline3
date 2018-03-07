import json
from django.http import HttpResponse
from django.shortcuts import render

# Create your views here.
from django.views import View
from pure_pagination import Paginator, PageNotAnInteger

from organization.forms import UserAskForm
from organization.models import CourseOrg, CityDict


class OrgView(View):
    def get(self, request):
        # 查找到所有的课程机构
        all_orgs = CourseOrg.objects.all()
        # 总共有多少家机构使用count进行统计
        org_nums = all_orgs.count()
        # 取出所有的城市
        all_city = CityDict.objects.all()

        # 取出筛选的城市
        city_id = request.GET.get('city', '')
        if city_id:
            # 外键city_id在数据库中叫city_id
            # 在机构中进一步筛选
            all_orgs = all_orgs.filter(city_id=int(city_id))
        # 类别筛选
        category = request.GET.get('ct', "")
        if category:
            # 我们就在机构中作进一步筛选类别
            all_orgs = all_orgs.filter(category=category)
        # 热门机构,如果不加负号会是有小到大。
        hot_orgs = all_orgs.order_by("-click_nums")[:3]

        # 进行排序
        sort = request.GET.get('sort', "")
        if sort:
            if sort == "students":
                all_orgs = all_orgs.order_by("-students")
            elif sort == "courses":
                all_orgs = all_orgs.order_by("-course_nums")
        # 对课程机构进行分页
        # 尝试获取前台get请求传递过来的page参数
        # 如果是不合法的配置参数默认返回第一页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        # 这里指从allorg中取四个出来，每页显示4个
        p = Paginator(all_orgs, 4, request=request)
        orgs = p.page(page)

        return render(request, "org-list.html", {
            "all_orgs": orgs,
            "all_city": all_city,
            "org_nums": org_nums,
            "city_id": city_id,
            "category": category,
            "hot_orgs": hot_orgs,
            "sort": sort,

        })


# 用户添加我要学习
# class AddUserAskView(View):
#     # 处理表单提交当然post
#     def post(self, request):
#         userask_form = UserAskForm(request.POST)
#         # 判断该form是否有效
#         if userask_form.is_valid():
#             # 这里是modelform和form的区别
#             # 它有model的属性
#             # 当commit为true进行真正保存
#             userask_form.save(commit=True)
#             # 这样就不需要把一个一个字段取出来然后存到model的对象中之后save
#
#             # 如果保存成功,返回json字符串,后面content type是告诉浏览器的,
#             return HttpResponse("{'status':'success'}", content_type='application/json')
#         else:
#             # 如果保存失败，返回json字符串,并将form的报错信息通过msg传递到前端
#             return HttpResponse("{'status':'fail', 'msg':{0}}".format(userask_form.errors),
#                                 content_type='application/json')

class AddUserAskView(View):
    """
    用户添加咨询
    """

    def post(self, request):
        userask_form = UserAskForm(request.POST)
        if userask_form.is_valid():
            user_ask = userask_form.save(commit=True)
            return HttpResponse('{"status":"success"}', content_type='application/json')
        else:
            return HttpResponse(json.dumps({'status': 'fail', 'msg': str(userask_form.errors)}),
                                content_type='application/json')
