from django.conf.urls import patterns, include, url
from Frankenstein import views
#from theater import rest
from django.contrib.auth.models import User
#from rest_framework import routers, serializers, viewsets

#from django.contrib import admin
#admin.autodiscover()

# Routers provide an easy way of automatically determining the URL conf.
#router = routers.DefaultRouter()
#router.register(r'stages', rest.StageViewSet)
#router.register(r'performances', rest.PerformanceViewSet)
#router.register(r'perftimes', rest.PerfTimeViewSet)
#router.register(r'persons', rest.PersonViewSet)
#router.register(r'actors', rest.ActorViewSet)
#router.register(r'prodcrew', rest.ProdCrewViewSet)
#router.register(r'search', rest.SearchViewSet)

urlpatterns = patterns('',
    #url(r'^admin/', include(admin.site.urls)),
    url(r'^$', 'Frankenstein.views.home', name='home'),
    url(r'^stage/(?P<stage_id>\d+)$', 'Frankenstein.views.stage', name='stage'),
    url(r'^performance/(?P<perf_id>\d+)$', 'Frankenstein.views.performance', name='performance'),
    url(r'^person/(?P<person_id>\d+)$', 'Frankenstein.views.person', name='person'),

    # URL Patterns for REST API
 #   url(r'^api/', include(router.urls)),
  #  url(r'^api/', include('rest_framework.urls', namespace='rest_framework'))
)

