#!/usr/bin/env python
# -*- coding: utf-8 -*-
""" 
@author:silenthz 
@file: adminx.py 
@time: 2018/03/21 
"""
import xadmin

from courses.models import CourseResource, Video, Lesson, Course, BannerCourse
from organization.models import CourseOrg


class LessonInline(object):
    model = Lesson
    extra = 0


class CourseResourceInline(object):
    model = CourseResource
    extra = 0


class LessonAdmin(object):
    list_display = ['course', 'name', 'add_time']
    search_fields = ['course', 'name']

    # __name代表使用外键中name字段
    list_filter = ['course__name', 'name', 'add_time']
    model_icon = 'fa fa-fire'


# Course的admin管理器
class CourseAdmin(object):
    list_display = ['name', 'course_org', 'desc', 'degree', 'click_nums', 'students', 'is_banner']
    search_fields = ['name', 'degree', 'learn_times', 'students', 'course_org__name', 'is_banner']
    list_filter = ['name', 'degree', 'learn_times', 'students', 'course_org', 'is_banner']
    model_icon = 'fa fa-graduation-cap'
    # 设置默认的字段倒叙排列
    ordering = ['-click_nums']
    # 设置制度字段
    readonly_fields = ['click_nums']
    # 设置不显示在页面的字段，与readonly_fields冲突
    exclude = ['fav_nums']

    inlines = [LessonInline, CourseResourceInline]
    list_editable = ['is_banner']

    refresh_times = [3, 10]

    style_fields = {'detail': 'ueditor'}

    def save_models(self):
        # 在保存课程的时候统计课程机构的课程数
        # 字段联动
        course = self.new_obj
        # 原model的表单
        org_course = self.form_obj.initial

        # 新增课程还没有保存，统计的课程数少一个
        course.save()
        # 必须确定存在。
        if course.course_org is not None:
            # obj实际是一个course对象
            course_org = course.course_org
            course_org.course_nums = Course.objects.filter(course_org=course_org).count()
            course_org.save()

        # 同步原机构的课程数
        if org_course.get('course_org', '') != '':
            course_org = CourseOrg.objects.get(id=org_course['course_org'])
            course_org.course_nums = Course.objects.filter(course_org=org_course['course_org']).count()
            course_org.save()

    def delete_model(self):
        course = self.new_obj
        course.delete()
        # 必须确定存在。
        if course.course_org is not None:
            # obj实际是一个course对象
            course_org = course.course_org
            course_org.course_nums = Course.objects.filter(course_org=course_org).count()
            course_org.save()

    def queryset(self):
        qs = super(CourseAdmin, self).queryset()
        qs = qs.filter(is_banner=False)
        return qs


# class BannerCourseAdmin(object):
#     list_display = ['name', 'desc', 'detail', 'degree', 'learn_times', 'students', 'is_banner']
#     search_fields = ['name', 'desc', 'detail', 'degree', 'students']
#     list_filter = ['name', 'degree', 'learn_times', 'students', 'course_org', 'is_banner']
#     model_icon = 'fa fa-bookmark'
#     # 设置默认的字段倒叙排列
#     ordering = ['-click_nums']
#     # 设置制度字段
#     readonly_fields = ['click_nums']
#     # 设置不显示在页面的字段，与readonly_fields冲突
#     exclude = ['fav_nums']
#
#     inlines = [LessonInline, CourseResourceInline]
#     list_editable = ['is_banner']
#
#     def save_models(self):
#         # 在保存课程的时候统计课程机构的课程数
#         # 字段联动
#         course = self.new_obj
#         # 新增课程还没有保存，统计的课程数少一个
#         course.save()
#         # 必须确定存在。
#         if course.course_org is not None:
#             # obj实际是一个course对象
#             course_org = course.course_org
#             course_org.course_nums = Course.objects.filter(course_org=course_org).count()
#             course_org.save()
#
#     def queryset(self):
#         qs = super(BannerCourseAdmin, self).queryset()
#         qs = qs.filter(is_banner=True)
#         return qs
class BannerCourseAdmin(CourseAdmin):
    def queryset(self):
        qs = super(CourseAdmin, self).queryset()
        qs = qs.filter(is_banner=True)
        return qs


class VideoAdmin(object):
    list_display = ['lesson', 'name', 'add_time']
    search_fields = ['lesson__name', 'name']
    list_filter = ['lesson', 'name', 'add_time']
    model_icon = 'fa fa-video-camera'


class CourseResourceAdmin(object):
    list_display = ['course', 'name', 'download', 'add_time']
    search_fields = ['course__name', 'name', 'download']
    # __name代表使用外键中name字段
    list_filter = ['course', 'name', 'download', 'add_time']
    model_icon = 'fa fa-folder'


xadmin.site.register(Course, CourseAdmin)
xadmin.site.register(BannerCourse, BannerCourseAdmin)
xadmin.site.register(Lesson, LessonAdmin)
xadmin.site.register(Video, VideoAdmin)
xadmin.site.register(CourseResource, CourseResourceAdmin)
