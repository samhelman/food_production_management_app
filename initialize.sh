#!/bin/bash
# This script initializes the Django project. It will be executed (from 
# supervisord) every time the Docker image is run.

# update configuration based on env
echo "updating configuration for environment"

python /code/project_directory/main_app/manage.py collectstatic --noinput

cd /code/project_directory/gulp && /node_modules/gulp/bin/gulp.js
sleep 5