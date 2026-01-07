#!/bin/bash

# Name: run-compose.sh
# Description: Script to run Docker Compose commands

set -e  # Exit immediately if a command exits with a non-zero status

# Navigate to the directory containing your docker-compose.yml (optional)
# cd /path/to/your/project

# Stop and remove existing containers, networks, images, and volumes
docker compose down -v

# Build the python-cve service specifically
docker compose build python-cve

# Build the go-cve service specifically
docker compose build go-cve

# Run docker-compose up in detached mode
docker compose up -d

