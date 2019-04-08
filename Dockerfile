FROM postgres

ENV PGDATA=/var/lib/postgresql/data2

RUN ["docker-entrypoint.sh", "postgres", "--version"]
