"""
Django settings for current project.

Generated by 'django-admin startproject' using Django 1.11.4.

For more information on this file, see
https://docs.djangoproject.com/en/1.11/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.11/ref/settings/
"""

import os

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.11/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'mi3llpe1_s^b=mtpqc3vd1$a6tgmgu6g7%s5f4du413j=bt)1!'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

INTERNAL_IPS = ['127.0.0.1', ]

ALLOWED_HOSTS = ["localhost", "10.225.192.162"]


# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'debug_toolbar',
    'django_extensions',
    'django_jinja',
    'main_app'
    #  'django_filters',
    #  'generic_relations',
    # 'rest_framework',
    # 'wkhtmltopdf',
]


#ACTSTREAM_ACTION_MODEL = 'users.Action'
#ACTSTREAM_FOLLOW_MODEL = 'users.Follow'

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'debug_toolbar.middleware.DebugToolbarMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    # 'rollbar.contrib.django.middleware.RollbarNotifierMiddleware',
]

ROOT_URLCONF = 'main_app.urls'
SILENCED_SYSTEM_CHECKS = ['urls.W002']

TEMPLATES = [
    {
        "BACKEND": "django_jinja.backend.Jinja2",
        'APP_DIRS': True,
        "OPTIONS": {
            "match_extension": ".j2",
        }
    },
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]


DEBUG_TOOLBAR_PANELS = [
    'debug_toolbar.panels.versions.VersionsPanel',
    'debug_toolbar.panels.timer.TimerPanel',
    'debug_toolbar.panels.settings.SettingsPanel',
    'debug_toolbar.panels.headers.HeadersPanel',
    'debug_toolbar.panels.request.RequestPanel',
    'debug_toolbar.panels.sql.SQLPanel',
    'debug_toolbar.panels.staticfiles.StaticFilesPanel',
    #'debug_toolbar.panels.templates.TemplatesPanel', cause conflict the debug toolbar
    'debug_toolbar.panels.cache.CachePanel',
    'debug_toolbar.panels.signals.SignalsPanel',
    'debug_toolbar.panels.logging.LoggingPanel',
    'debug_toolbar.panels.redirects.RedirectsPanel',
]

WSGI_APPLICATION = 'main_app.wsgi.application'


# Logging

LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'formatters': {
        'verbose': {
            'format': '%(levelname)s %(asctime)s %(module)s.%(funcName)s(): %(message)s'
        },
        'simple': {
            'format': '%(levelname)s %(message)s'
        },
    },
    'handlers': {
        'django_file': {
            'level': 'DEBUG',
            'class': 'logging.handlers.RotatingFileHandler',
            'filename': '/logs/django/django.log',
            'maxBytes': 1024*1024*10,  # 10 MB
            'backupCount': 5,
        },
        'main_app_file': {
            'level': 'DEBUG',
            'class': 'logging.handlers.RotatingFileHandler',
            'filename': '/logs/django/main_app.log',
            'maxBytes': 1024*1024*10,  # 10 MB
            'backupCount': 5,
            'formatter': 'verbose',
        },
    },
    'loggers': {
        'django': {
            'handlers': ['django_file'],
            'level': 'INFO',
        },
        'main_app': {
            'handlers': ['main_app_file'],
            'level': 'DEBUG',
        },
    },
}

# Database
# https://docs.djangoproject.com/en/1.11/ref/settings/#databases

DATABASES = {
     'default': {
         'ENGINE': 'django.db.backends.sqlite3',
         'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }

}


# Password validation
# https://docs.djangoproject.com/en/1.11/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/1.11/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = True

MEDIA_ROOT = os.path.join(BASE_DIR, 'web', 'media')
MEDIA_URL = '/media/'

#STATICFILES_DIRS = [os.path.join(BASE_DIR, 'static'), ]
#STATIC_ROOT = os.path.join(BASE_DIR, 'static')

STATICFILES_DIRS = ['/code/project_directory/web/static', ]
STATIC_ROOT = '/code/project_directory/web' #os.path.join(BASE_DIR,)

STATIC_URL = '/static/'

DATA_UPLOAD_MAX_MEMORY_SIZE = None

TARGET_ENVIRONMENT = 'DEV'

LOGIN_URL = '/'

#if we want to add our own user model fields
# AUTH_USER_MODEL = 'main_app.User'
#
# REST_FRAMEWORK = {
#     'DEFAULT_FILTER_BACKENDS': (
#         'rest_framework_filters.backends.DjangoFilterBackend',
#     ),
#     'DEFAULT_AUTHENTICATION_CLASSES': (
#          'rest_framework.authentication.BasicAuthentication',
#     ),
#     'DEFAULT_PERMISSION_CLASSES':(
#         'rest_framework.permissions.IsAuthenticated',
#     )
# }

# ROLLBAR = {
#     'access_token': '29cfa98c4db84123ae0837d6b0dea286',
#     'environment': 'development' if DEBUG else 'production',
#     'branch': 'master',
#     'root': '/code/plumbing_showroom_quote',
# }
