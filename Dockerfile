FROM ubuntu:18.04

# Enable production settings by default; for development, this can be set to
# `false` in `docker run --env`
ENV DJANGO_PRODUCTION=false

# Set terminal to be noninteractive
ENV DEBIAN_FRONTEND noninteractive

#Install packages
# libpq-dev required for postgress communication in the backend
#  libffi-dev Compilers for high level languages generate code such as python
# nginx for obvious reasons
# npm to download node related libraries
# postgress-sql-client for postgress database
# python3-setuptools for some libraries in the requirement.txt
# python3-pip for pip3
# supervisor needed for django
# vim to edit files
# cron for crontab/cronjobs
RUN apt-get update && \
apt-get install -y libpq-dev && \
apt-get install -y libffi-dev && \
apt-get install -y nginx && \
apt-get install -y npm && \
apt-get install -y postgresql-client* && \
apt-get install -y python3-pip && \
apt-get install -y vim && \
apt-get install -y cron

RUN npm update
RUN npm init -y

# install node dependencies for gulp
RUN npm install gulp@4.0.2 gulp-load-plugins@1.5.0 q@1.5.1 browser-sync@2.24.5 \
gulp-include@2.3.1  del@3.0.0 \
jquery bootstrap@4.0.0-alpha.6

# stuff commenly used in our project
#boot strap material design needs less than version 2 of popper
#bootstrap-material-design@4.0.0-beta.4  popper.js@1.12.6\
# datepicker, jquery-ui, bootstrap select for ui improvements (moment helps javascript date formatting to be easier)
#eonasdan-bootstrap-datetimepicker moment jquery-ui-dist bootstrap-select font-awesome


# Configure Django project
ADD . /code
RUN mkdir /djangomedia
#RUN mkdir /static
RUN mkdir /logs
RUN mkdir /logs/nginx
RUN mkdir /logs/gunicorn
RUN mkdir /logs/django
RUN rm /usr/bin/python
RUN ln -s /usr/bin/python3 /usr/bin/python

WORKDIR /code

RUN pip3 install -r ./requirements.txt

RUN chmod ug+x ./initialize.sh

EXPOSE 80 8000 8080 9001

# Configure Nginx
RUN ln -s /code/conf/nginx.conf /etc/nginx/sites-enabled/django_docker.conf
RUN rm /etc/nginx/sites-enabled/default

# Run Supervisor
#COPY ./conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY ./conf/supervisord.conf /etc/supervisord.conf

RUN chmod ug+x /usr/local/bin/supervisord

CMD ["/usr/local/bin/supervisord -c /etc/supervisord.conf"]
