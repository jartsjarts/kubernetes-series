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

echo "remove cluster"
gcloud container clusters delete ${CLUSTER_NAME} --quiet
gcloud container clusters list

echo "remove container"
gcloud container images delete gcr.io/${GCLOUD_PROJECT}/${CONTAINER_NAME} --force-delete-tags --quiet
gcloud container images delete gcr.io/${GCLOUD_PROJECT}/${CONTAINER_NAME}-daemon --force-delete-tags --quiet