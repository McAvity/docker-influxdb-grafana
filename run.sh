#!/bin/bash -e

# We need to ensure this directory is writeable on start of the container
chmod 0777 /var/lib/grafana

exec /usr/bin/supervisord && curl -XPOST 'http://localhost:8086/query' --data-urlencode 'q=CREATE DATABASE "weather"'
