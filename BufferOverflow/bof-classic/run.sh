#!/bin/bash
DOCKER_SERVICE=${DOCKER_SERVICE:-gcc}
docker compose run --service-ports $DOCKER_SERVICE