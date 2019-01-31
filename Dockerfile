

FROM ubuntu:14.04

# Enable production settings by default; for development, this can be set to
# `false` in `docker run --env`
ENV DJANGO_PRODUCTION=false

# Set terminal to be noninteractive
ENV DEBIAN_FRONTEND noninteractive

# Install packages
RUN apt-get update && apt-get install -y \
    git \
    liblcms2-dev \
    libfreetype6-dev \
    libjpeg8-dev \
    libpq-dev \
    libffi-dev \
    libssl-dev \
    libtiff5-dev \
    libpython3-dev \
    libwebp-dev \
    nginx \
    npm \
    postgresql-client* \
    python3-dev \
    python3-setuptools \
    python3-pip \
    python-tk \
    supervisor \
    tcl8.6-dev \
    tk8.6-dev \
    vim \
    zlib1g-dev \
    wget \
    curl \
    libaio1

#python3-urllib3 \
#Needed for rollbar, issue is that when later it tries to get new version of six for roll bar, cannot uninstall 1.5.2
RUN pip3 install --upgrade six==1.12.0
RUN wget https://downloads.wkhtmltopdf.org/0.12/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
RUN tar xf wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
RUN cp ./wkhtmltox/bin/* /usr/bin/
RUN rm -R ./wkhtmltox
RUN rm wkhtmltox-0.12.4_linux-generic-amd64.tar.xz

# replace pip3 with official python version to get around build issues
RUN wget --no-check-certificate https://bootstrap.pypa.io/get-pip.py
RUN python3 ./get-pip.py
#RUN rm /usr/bin/pip3
RUN ln -s /usr/local/bin/pip3 /usr/bin/pip3

# needed to pull six install out of requirements so it was done prior to others
RUN pip3 install requests[security] ndg-httpsclient pyasn1

RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
RUN apt-get install -y nodejs
# install node dependencies for gulp

RUN npm install gulp@3.9.1 coffee-script gulp-load-plugins q browser-sync
RUN npm install lazypipe gulp-include gulp-livereload del gulp-flatten gulp-concat gulp-sass
RUN npm install jquery tether bootstrap@4.0.0-alpha.6 font-awesome tablesaw bootstrap-material-design@4.0.0-beta.4 eonasdan-bootstrap-datetimepicker moment snackbarjs jquery-ui-dist
RUN npm install popper.js@1.12.6
# Configure Django project
ADD . /code
RUN mkdir /djangomedia
#RUN mkdir /static
RUN mkdir /logs
RUN mkdir /logs/nginx
RUN mkdir /logs/gunicorn
RUN mkdir /logs/dataload
RUN mkdir /logs/misc
RUN mkdir /logs/django
RUN rm /usr/bin/python
RUN ln -s /usr/bin/python3 /usr/bin/python

RUN cp -r /code/oracle/* /usr/local/lib

WORKDIR /code

RUN pip3 install -r ./requirements.txt

RUN chmod ug+x ./initialize.sh

EXPOSE 80 8000 8080 9001

# Configure Nginx
RUN ln -s /code/conf/nginx.conf /etc/nginx/sites-enabled/django_docker.conf
RUN rm /etc/nginx/sites-enabled/default

# Run Supervisor
COPY ./conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY ./conf/supervisord /usr/bin/supervisord
RUN chmod ug+x /usr/bin/supervisord

CMD ["/usr/bin/supervisord"]