from django.shortcuts import render
from pure_pagination import PageNotAnInteger, Paginator, EmptyPage

# Create your views here.
from django.views import View

from courses.models import Course


class CourseListView(View):
    def get(self, request):
        all_course = Course.objects.all()
        # 进行排序
        sort = request.GET.get('sort', "")
        if sort:
            if sort == "students":
                all_course = all_course.order_by("-students")
            elif sort == "hot":
                all_course = all_course.order_by("-click_nums")

        # 热门课程推荐
        hot_courses = Course.objects.all().order_by("-students")[:3]
        # 对课程进行分页
        # 尝试获取前台get请求传递过来的page参数
        # 如果是不合法的配置参数默认返回第一页
        try:
            page = request.GET.get('page', 1)
        except [PageNotAnInteger, EmptyPage]:
            page = 1
        # 这里指从allorg中取五个出来，每页显示2个
        p = Paginator(all_course, 6, request=request)
        courses = p.page(page)
        return render(request, "course-list.html", {
            "all_course": courses,
            "sort": sort,
            "hot_courses": hot_courses
        })
