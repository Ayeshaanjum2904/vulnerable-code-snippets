#!/bin/bash
set -e

CONFIG_FILE="config.env"
if [ ! -f "$CONFIG_FILE" ]; then
  echo "Configuration file $CONFIG_FILE not found. Exiting."
  exit 1
fi

source "$CONFIG_FILE"

if [ -z "$(docker compose ps -q)" ]; then
  echo "No running containers found. Starting the service..."
  docker compose run --service-ports "$SERVICE_NAME"
else
  echo "Service is already running."
fi