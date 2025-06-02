web: gunicorn scip.wsgi
worker: REMAP_SIGTERM=SIGQUIT celery --app scip.celery.app worker -l INFO -B --concurrency 4
