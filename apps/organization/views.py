from django.shortcuts import render

# Create your views here.
from django.views import View

from organization.models import CourseOrg, CityDict


class OrgView(View):
    def get(self, request):
        # 查找到所有的课程机构
        all_orgs = CourseOrg.objects.all()
        # 取出所有的城市
        all_citys = CityDict.objects.all()

        return render(request, "org-list.html", {
            "all_orgs": all_orgs,
            "all_citys": all_citys,
        })
