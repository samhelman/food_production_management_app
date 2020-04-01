#!/bin/bash
# This script initializes the Django project. It will be executed (from 
# supervisord) every time the Docker image is run.

# update configuration based on env
echo "updating configuration for environment"

if [ "$TARGET_ENVIRONMENT" == "DEV" ]; then
    cp ./settings/settings_dev.py /code/project_directory/main_app/main_app/settings.py
    cp ./crontab/crontab_dev.txt ./crontab/crontab.txt

elif [ "$TARGET_ENVIRONMENT" == "PROD" ]; then
    cp ./settings/settings_prod.py /code/project_directory/main_app/main_app/settings.py
    cp ./crontab/crontab_prod.txt ./crontab/crontab.txt
fi

#crontab ./crontab/crontab.txt

#python /code/project_directory/main_app/manage.py collectstatic
#python /code/project_directory/main_app/manage.py makemigrations
#python /code/project_directory/main_app/manage.py migrate --noinput


if [ "$TARGET_ENVIRONMENT" == "DEV" ]; then
    cd /code/lds_cloud/gulp && /node_modules/gulp/bin/gulp.js
    sleep 5
    #because it takes a while for gulp to propery start up, it exists the initialize instance right away
fi
