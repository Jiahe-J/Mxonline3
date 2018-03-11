import json
from django.http import HttpResponse
from django.shortcuts import render

# Create your views here.
from django.views import View
from pure_pagination import Paginator, PageNotAnInteger

from operation.models import UserFavorite
from organization.forms import UserAskForm
from organization.models import CourseOrg, CityDict, Teacher


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


class OrgHomeView(View):
    """
   机构首页
    """

    def get(self, request, org_id):
        # 根据id取到课程机构
        course_org = CourseOrg.objects.get(id=int(org_id))
        # 通过课程机构找到课程。内建的变量，找到指向这个字段的外键引用
        all_courses = course_org.course_set.all()
        all_teacher = course_org.teacher_set.all()

        return render(request, 'org-detail-homepage.html', {
            'all_courses': all_courses,
            'all_teacher': all_teacher,
            'course_org': course_org,
        })


class OrgCourseView(View):
    """
   机构课程列表页
    """

    def get(self, request, org_id):
        # 根据id取到课程机构
        course_org = CourseOrg.objects.get(id=int(org_id))
        # 通过课程机构找到课程。内建的变量，找到指向这个字段的外键引用
        all_courses = course_org.course_set.all()
        # 向前端传值说明用户是否收藏
        has_fav = False
        # 必须是用户已登录我们才需要判断。
        if request.user.is_authenticated:
            if UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=2):
                has_fav = True
        return render(request, 'org-detail-course.html', {
            'all_courses': all_courses,
            'course_org': course_org,
            "has_fav": has_fav,
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


class OrgDescView(View):
    """
   机构描述详情页
    """

    def get(self, request, org_id):
        # 向前端传值，表明现在在home页
        current_page = "desc"
        # 根据id取到课程机构
        course_org = CourseOrg.objects.get(id=int(org_id))
        # 通过课程机构找到课程。内建的变量，找到指向这个字段的外键引用
        # 向前端传值说明用户是否收藏
        has_fav = False
        # 必须是用户已登录我们才需要判断。
        if request.user.is_authenticated:
            if UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=2):
                has_fav = True
        return render(request, 'org-detail-desc.html', {
            'course_org': course_org,
            "current_page": current_page,
            "has_fav": has_fav,
        })


class OrgTeacherView(View):
    """
   机构讲师列表页
    """

    def get(self, request, org_id):
        # 向前端传值，表明现在在home页
        current_page = "teacher"
        # 根据id取到课程机构
        course_org = CourseOrg.objects.get(id=int(org_id))
        # 通过课程机构找到课程。内建的变量，找到指向这个字段的外键引用
        all_teachers = course_org.teacher_set.all()
        # 向前端传值说明用户是否收藏
        has_fav = False
        # 必须是用户已登录我们才需要判断。
        if request.user.is_authenticated:
            if UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=2):
                has_fav = True
        return render(request, 'org-detail-teachers.html', {
            'all_teachers': all_teachers,
            'course_org': course_org,
            "current_page": current_page,
            "has_fav": has_fav
        })


class AddFavView(View):
    """
    用户收藏与取消收藏功能
    """

    def post(self, request):
        # 表明你收藏的不管是课程，讲师，还是机构。他们的id
        # 默认值取0是因为空串转int报错
        id = request.POST.get('fav_id', 0)
        # 取到你收藏的类别，从前台提交的ajax请求中取
        type = request.POST.get('fav_type', 0)

        # 收藏与已收藏取消收藏
        # 判断用户是否登录:即使没登录会有一个匿名的user
        if not request.user.is_authenticated:
            # 未登录时返回json提示未登录，跳转到登录页面是在ajax中做的
            return HttpResponse('{"status":"fail", "msg":"用户未登录"}', content_type='application/json')
        exist_records = UserFavorite.objects.filter(user=request.user, fav_id=int(id), fav_type=int(type))
        if exist_records:
            # 如果记录已经存在， 则表示用户取消收藏
            exist_records.delete()
            return HttpResponse('{"status":"success", "msg":"收藏"}', content_type='application/json')
        else:
            user_fav = UserFavorite()
            # 过滤掉未取到fav_id type的默认情况
            if int(type) > 0 and int(id) > 0:
                user_fav.fav_id = int(id)
                user_fav.fav_type = int(type)
                user_fav.user = request.user
                user_fav.save()
                return HttpResponse('{"status":"success", "msg":"已收藏"}', content_type='application/json')
            else:
                return HttpResponse('{"status":"fail", "msg":"收藏出错"}', content_type='application/json')


# 课程讲师列表页
class TeacherListView(View):
    def get(self, request):
        all_teacher = Teacher.objects.all()
        # 总共有多少老师使用count进行统计
        teacher_nums = all_teacher.count()
        sort = request.GET.get("sort", "")
        if sort:
            if sort == "hot":
                all_teacher = all_teacher.order_by("-click_nums")
        # 排行榜讲师
        rank_teachers = Teacher.objects.all().order_by("-fav_nums")[:5]
        # 对讲师进行分页
        # 尝试获取前台get请求传递过来的page参数
        # 如果是不合法的配置参数默认返回第一页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        # 这里指从all_teacher中取四个出来，每页显示4个
        p = Paginator(all_teacher, 4, request=request)
        teachers = p.page(page)
        return render(request, "teachers-list.html", {
            "all_teacher": teachers,
            "teacher_nums": teacher_nums,
            "sort": sort,
            "rank_teachers": rank_teachers,
        })


# 教师详情页面

class TeacherDetailView(View):
    def get(self, request, teacher_id):
        teacher = Teacher.objects.get(id=int(teacher_id))
        all_course = teacher.course_set.all()
        # 排行榜讲师
        rank_teacher = Teacher.objects.all().order_by("-fav_nums")[:5]

        has_fav_teacher = False
        if UserFavorite.objects.filter(user=request.user, fav_type=3, fav_id=teacher.id):
            has_fav_teacher = True
        has_fav_org = False
        if UserFavorite.objects.filter(user=request.user, fav_type=2, fav_id=teacher.org.id):
            has_fav_org = True
        # 对课程进行分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        # 这里指从all_teacher中取六个出来，每页显示6个
        p = Paginator(all_course, 6, request=request)
        all_course = p.page(page)

        return render(request, "teacher-detail.html", {
            "teacher": teacher,
            "all_course": all_course,
            "rank_teacher": rank_teacher,
            "has_fav_teacher": has_fav_teacher,
            "has_fav_org": has_fav_org,
        })
