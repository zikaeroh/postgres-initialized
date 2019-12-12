FROM postgres

ENV PGDATA=/var/lib/postgresql/data2

# --version is now caught by docker-entrypoint.sh; run a broken command but report success.
RUN docker-entrypoint.sh postgres -c badconfig=option; true
