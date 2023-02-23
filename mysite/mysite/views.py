from django.contrib import admin
from django.conf import settings
from django.urls import path, re_path
from django.views.generic.base import TemplateView


urlpatterns = []

if settings.MAINTENANCE_MODE:
    urlpatterns.insert(0, re_path(r'^', TemplateView.as_view(template_name="maintenance.html"), name="maintenance"))