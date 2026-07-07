#!/bin/bash
SERVICE_NAME=${SERVICE_NAME:-gcc}
docker compose run --service-ports $SERVICE_NAME