#!/bin/bash

# Healthcheck script to verify if port 80 is open on localhost
if bash -c ':> /dev/tcp/127.0.0.1/80'; then
    exit 0  # Success: Port 80 is open
else
    exit 1  # Failure: Port 80 is not open
fi