# Django example app

Пример веб-приложения из туториала по Django для изучения **DevOps**-практик.

![pylint](https://img.shields.io/badge/PyLint-6.22-orange?logo=python&logoColor=white)

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

### CI-сегмент

Этот пайплайн срабатывает, если открывается pull-request в ветку **main**.

Порядок действий:

1. Получение кодовой базы (*checkout*).
2. Проверка синтаксиса и его рекомендаций в Dockerfile, с помощью `hadolint`.
3. Проверка синтаксиса кода с помощью *pylint*.
4. Установка python и зависимостей для него (см. файл
   [requirements.txt](./requirements.txt))
5. Запуск тестов с помощью *pytest*.
6. В случае провала любого из предыдущих этапов отправляется 
   уведомление в телеграме.
7. В случае успеха, также отправляется сообщение в телеграме.

### Docker build and push

Этот пайплайн собирает образ Docker и пушит его в DockerHub в случае если
pull-request закрыт и в нем были затронуты файлы *Dockerfile* и *manage.py*.

### Jenkins Deploy

Этот пайплайн деплоит приложение на сервер. Он запускается только если 
успешно сработал предыдущий workflow.

Пайплайн состоит из двух частей:

- [Workflow-файла](.github/workflows/jenkins-deploy.yml), который триггерит 
  работу Jenkins с помощью `curl` и API.
- [Jenkinsfile](Jenkinsfile), в котором описана процесс деплоя. Он состоит в
  том, чтобы подключиться к серверу, зайти в нужную папку и выполнить ряд
  комманд (`git pull`, `docker compose pull` и пр.).
