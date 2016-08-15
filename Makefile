up:
	# bring up the services
	docker-compose up -d

build:
	docker-compose build django
	docker-compose build celery

sync:
	docker-compose run django bash -c "python manage.py makemigrations && python manage.py migrate account && python manage.py migrate --noinput"
	# load a superuser admin / admin
	docker-compose run django python manage.py loaddata exchange/core/fixtures/initial.json
	docker-compose run django python manage.py loaddata exchange/core/fixtures/catalog_default.json

wait:
	sleep 5

logs:
	docker-compose logs --follow

down:
	docker-compose down

pull:
	docker-compose pull

reset: down up wait sync

purge: down pull build

hardreset: purge reset
