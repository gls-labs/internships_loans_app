#!/bin/sh

docker build -t "internship_loans_app:1.0" -f docker/Dockerfile .

docker-compose build

docker-compose up