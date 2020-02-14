FROM postgres

ENV PGDATA=/var/lib/postgresql/data2

# 2019-12-11: --version is now caught by docker-entrypoint.sh; run a broken command but report success.
# 2020-02-14: POSTGRES_PASSWORD is now required (???), so force it to be the old default.
RUN POSTGRES_PASSWORD=mysecretpassword docker-entrypoint.sh postgres -c badconfig=option; true
