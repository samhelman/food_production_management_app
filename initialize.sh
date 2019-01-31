#!/bin/bash
# This script initializes the Django project. It will be executed (from 
# supervisord) every time the Docker image is run.

# update configuration based on env
echo "updating configuration for environment"

if [ "$TARGET_ENVIRONMENT" == "DEV" ]; then
    cp ./settings/settings_dev.py /code/inspection_reporting/main_app/main_app/settings.py
    cp ./crontab/crontab_dev.txt ./crontab/crontab.txt

elif [ "$TARGET_ENVIRONMENT" == "PROD" ]; then
    cp ./settings/settings_prod.py /code/inspection_reporting/main_app/main_app/settings.py
    cp ./crontab/crontab_prod.txt ./crontab/crontab.txt
fi

crontab ./crontab/crontab.txt

#python /code/inspection_reporting/main_app/manage.py collectstatic
#python /code/inspection_reporting/main_app/manage.py makemigrations
#python /code/inspection_reporting/main_app/manage.py migrate --noinput