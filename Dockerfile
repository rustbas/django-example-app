FROM python:3.11-alpine
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY ./mysite ./mysite
COPY ./polls ./polls
COPY ./manage.py .

RUN ./manage.py makemigrations
# RUN ./manage.py migrate

COPY docker-entrypoint.sh .

EXPOSE 8000

CMD [ "./docker-entrypoint.sh" ]
