#!/bin/bash

DOCKERHUB_USER="gnasello"
CONTAINER_NAME="hlatyping-env"
VERSION='2025-01-24'

docker build --no-cache -t "${DOCKERHUB_USER}/${CONTAINER_NAME}:${VERSION}" .