#!/bin/bash

docker rm docker_signal -f || true

docker build -t docker_signal . --no-cache

docker run -it --rm -p 3000:3000 --name="docker_signal" docker_signal
