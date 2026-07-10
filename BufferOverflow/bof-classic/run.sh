#!/bin/bash
set -e

CONFIG_FILE=${CONFIG_FILE:-"config.env"}

if [[ -z "$CONFIG_FILE" || ! -f "$CONFIG_FILE" ]]; then
  echo "Error: Configuration file is either not set or not found. Exiting."
  exit 1
fi

if ! source "$CONFIG_FILE"; then
  echo "Error: Failed to source configuration file $CONFIG_FILE. Exiting."
  exit 1
fi

if [ -z "$(docker compose ps -q)" ]; then
  echo "No running containers found. Starting the service..."
  if ! docker compose run --service-ports "$SERVICE_NAME"; then
    echo "Error: Failed to start the service using docker compose. Exiting."
    exit 1
  fi
else
  echo "Service is already running."
fi