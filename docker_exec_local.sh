#!/usr/bin/env bash

docker rm -f docker-ubuntu-python3
docker run --name docker-ubuntu-python3 -it docker-ubuntu-python3 /bin/zsh
