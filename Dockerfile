FROM python:3.11-alpine
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY ./manage.py .

COPY docker-entrypoint.sh .

EXPOSE 8000

CMD [ "./docker-entrypoint.sh" ]
