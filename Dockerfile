FROM python:3.9-slim

ENV PROJECT_HOME=/usr/src/dbt-demo
ENV DB_FILE=potion_factory.duckdb

RUN apt-get update && apt-get -y upgrade
RUN python -m pip install --upgrade pip && pip install pipenv

COPY Pipfile Pipfile.lock /
RUN pipenv install --system

COPY mock_data $PROJECT_HOME
WORKDIR $PROJECT_HOME/potion_factory

ENTRYPOINT ["dbt"]
