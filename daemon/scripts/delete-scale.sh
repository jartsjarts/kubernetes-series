#!/usr/bin/env bash

echo "preparing..."
export GCLOUD_PROJECT=$(gcloud config get-value project)
export INSTANCE_REGION=europe-west6
export INSTANCE_ZONE=europe-west6-a
export PROJECT_NAME=daemon
export CLUSTER_NAME=${PROJECT_NAME}-cluster
export CONTAINER_NAME=${PROJECT_NAME}-container

echo "setup"
gcloud config set compute/zone ${INSTANCE_ZONE}

echo "scale cluster"
gcloud container node-pools delete my-pool \
    --cluster=${CLUSTER_NAME} \
    --quiet