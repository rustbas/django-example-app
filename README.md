# Django example app

Пример веб-приложения из туториала по Django для изучения **DevOps**-практик.

## Описание приложения

Простое приложение для голосования. В данный момент есть только одно
голосование: "Will it work?", с двумя вариантами ответа "Yes" и "No".

Приложение запаковано в docker-образ и доступно в
[DockerHub](https://hub.docker.com/r/wtukatyr/django-example-app).

## Пайплайн

Пайплайн состоит из трех сегментов.

1. CI-сегмент с проверками кода ([YML-файл](./.github/workflows/ci.yml)).
2. Сегмент со сборкой образа Docker и пушем в DockerHub ([YML-файл](./.github/workflows/docker-build.yaml)).
3. Сегмент с деплоем на сервер с помощью Jenkins ([YML-файл](./.github/workflows/jenkins-deploy.yml)).


