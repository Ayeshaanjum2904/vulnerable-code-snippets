#!/bin/bash
if [ -z "$(docker compose ps -q)" ]; then
  echo "No running containers found. Starting the service..."
  docker compose run --service-ports gcc
else
  echo "Service is already running."
fi