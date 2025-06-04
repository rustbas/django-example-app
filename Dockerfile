FROM python:3.11-alpine
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY ./mysite ./mysite
COPY ./polls ./polls
COPY ./manage.py .

RUN ./manage.py makemigrations
# RUN ./manage.py migrate

EXPOSE 8000

CMD [ "python", "./manage.py", "runserver", "0.0.0.0:8000"]
