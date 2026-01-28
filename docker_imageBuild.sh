#!/bin/bash
IMAGE=chatapp
TAG=$(date +%Y%m%d%H%M)

docker build -t $IMAGE:$TAG .

