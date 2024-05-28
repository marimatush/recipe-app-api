#!/bin/sh

set -e

python manage.py wait_for_db

# Collect all static files and put it in a configured directory
python manage.py collectstatic --noinput

# Run all migrations automatically
python manage.py migrate

uwsgi --socket :9000 --workers 4 --master --enable-threads --module app.wsgi
