#!/bin/bash

# Healthcheck script to verify if port 80 is open on localhost
if bash -c ':> /dev/tcp/127.0.0.1/80'; then
    echo "[`date`] Healthcheck passed: Port 80 is open" > /proc/1/fd/1
    exit 0  # Success: Port 80 is open
else
    echo "[`date`] Healthcheck failed: Port 80 is not open" > /proc/1/fd/2
    exit 1  # Failure: Port 80 is not open
fi