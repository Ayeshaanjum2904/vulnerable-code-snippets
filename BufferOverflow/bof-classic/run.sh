#!/bin/bash
set -e

CONFIG_FILE=${CONFIG_FILE:?"Error: CONFIG_FILE environment variable is not set. Exiting."}

if [[ ! -f "$CONFIG_FILE" ]]; then
  echo "Error: Configuration file $CONFIG_FILE not found. Exiting."
  exit 1
fi

if ! source "$CONFIG_FILE"; then
  echo "Error: Failed to source configuration file $CONFIG_FILE. Exiting."
  exit 1
fi

if ! docker compose ps -q > /dev/null 2>&1; then
  echo "No running containers found. Starting the service..."
  if ! docker compose run --service-ports "$SERVICE_NAME"; then
    echo "Error: Failed to start the service using docker compose. Exiting."
    exit 1
  fi
else
  echo "Service is already running."
fi