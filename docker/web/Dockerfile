# pull official base image
FROM python:3.11

# set work directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install system dependencies
RUN apt-get update && \
    apt-get install -y gdal-bin libgdal-dev postgresql-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# expose port
EXPOSE 8000

# Upgrade pip and install pipenv
RUN pip install --upgrade pip && \
    pip install pipenv

# copy Pipfile
COPY ./Pipfile ./Pipfile.lock /usr/src/app/

# install dependencies
RUN pipenv install --system --deploy --ignore-pipfile

# copy project
COPY . /usr/src/app/

# run entrypoint.sh
ENTRYPOINT ["/usr/src/app/entrypoint.sh"]

CMD ["python", "manage.py", "collectstatic", "--noinput"]
