#!/bin/bash

set -eu

name=eshamster/cl-base
ver=2.2

docker rmi $(docker images | awk '/^<none>/ { print $3 }') || echo "ignore rmi error"
docker rm `docker ps -a -q` || echo "ignore rm error"

no_cache=
if [ $# -gt 0 ]; then
    no_cache="--no-cache"
fi
docker build ${no_cache} -t ${name}:${ver} -t  ${name}:latest .
docker run --name cl-test -v /tmp/temp-mount:/tmp/temp -it ${name}:${ver} /bin/sh
