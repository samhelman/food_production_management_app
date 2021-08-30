
from django.conf import settings
from django.conf.urls import include, url
from django.contrib import admin
from django.conf.urls.static import static


urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^users/', include(('users.urls', 'users'), namespace='users')),
    url(r'^configuration/', include(('configuration.urls', 'configuration'), namespace='configuration')),
    url(r'^production/', include(('production.urls', 'production'), namespace='production')),
    url(r'^audits/', include(('audits.urls', 'audits'), namespace='audits')),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

if settings.DEBUG:
    import debug_toolbar
    urlpatterns = [
        url(r'^__debug__/', include(debug_toolbar.urls)),
    ] + urlpatterns
