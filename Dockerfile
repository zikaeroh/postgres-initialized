FROM postgres

RUN ["docker-entrypoint.sh", "postgres", "--version"]
