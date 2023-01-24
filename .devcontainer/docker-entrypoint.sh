#!/usr/bin/env bash

echo "Starting Formatif development container..."

# Start mysql
sudo -E /workspace/.devcontainer/launch_db.sh mysqld &

# Start the redis server
redis-server &

# Wait for mysql to start then setup the database if needed
/workspace/.devcontainer/setup_formatif_db.sh &

exec "$@"