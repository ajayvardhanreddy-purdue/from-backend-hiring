#!/bin/sh

# Set the database host, port, and credentials
SQL_HOST=db
SQL_PORT=5432
DB_USER=hello_django
DB_NAME=hello_django_dev
DB_PASSWORD=hello_django

# Set a maximum number of attempts to connect to the database
MAX_ATTEMPTS=50
attempt_num=1

if [ "${DATABASE:-}" = "postgres" ]; then
    echo "Waiting for postgres..."

    until (echo "SELECT 1;" | PGPASSWORD=$DB_PASSWORD psql -h $SQL_HOST -U $DB_USER -d $DB_NAME -p $SQL_PORT > /dev/null 2>&1) || [ $attempt_num -eq $MAX_ATTEMPTS ]; do
      echo "Attempting to connect to PostgreSQL at $SQL_HOST:$SQL_PORT (Attempt: $attempt_num)"
      sleep 1
      attempt_num=$((attempt_num+1))
    done

    if [ $attempt_num -eq $MAX_ATTEMPTS ]; then
      echo "Failed to connect to PostgreSQL at $SQL_HOST:$SQL_PORT after $MAX_ATTEMPTS attempts."
      exit 1
    fi

    echo "PostgreSQL started"
fi

exec "$@"
