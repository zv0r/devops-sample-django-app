FROM python:3.8-bookworm

MAINTAINER zv0r
LABEL version="6.6.6"
LABEL description="Parrot site"

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

COPY . /app/.

RUN set -ex \
    && apt-get clean \
    && apt-get update \
    && apt-get -y upgrade

RUN set -ex \
    && pip install --upgrade pip \
    && pip install -r requirements.txt

CMD python3 manage.py migrate && python3 manage.py runserver 0.0.0.0:8000