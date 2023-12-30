#!/bin/bash

set -eo pipefail

IMAGE=${1:-postgres-initialized:12}
DOCKER_TAG=$(echo $IMAGE | cut -d: -f2)

echo "Building $IMAGE"
docker build -f Dockerfile --build-arg="DOCKER_TAG=$DOCKER_TAG" -t $IMAGE .

echo "Running $IMAGE"
CONTAINER=$(docker run --rm -d $IMAGE)
trap "docker stop $CONTAINER > /dev/null" EXIT

echo "Waiting for postgres to start"
until docker exec $CONTAINER pg_isready -U postgres > /dev/null; do
  sleep 1
done

echo "Checking that server is initialized"
docker run --rm -it --link $CONTAINER:postgres -e PGPASSWORD=mysecretpassword $IMAGE psql -h postgres -U postgres -c "SELECT version(), current_user"
exit $?
