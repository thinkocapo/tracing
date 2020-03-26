FROM python:2.7-slim

COPY . ./app
WORKDIR /app

RUN pip install -r requirements.txt
ENV HOST=34.70.84.230
ENV DATABASE=hardwarestore
ENV USERNAME=postgres
ENV PASSWORD=seatsentry
CMD FLASK_APP=app.py flask run --host=0.0.0.0 -p $PORT
