#!/bin/bash

LOCAL_DOCKER_USER=lanternerds

for d in */; do
    docker build $d -t $LOCAL_DOCKER_USER/${d%/}:latest
done