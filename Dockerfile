ARG DOCKER_TAG=
FROM postgres:${DOCKER_TAG}

ENV PGDATA=/var/lib/postgresql/data2

RUN POSTGRES_PASSWORD=mysecretpassword docker-enforce-initdb.sh
