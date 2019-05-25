#!/usr/bin/env bash

echo "preparing..."
export GCLOUD_PROJECT=$(gcloud config get-value project)
export INSTANCE_REGION=europe-west6
export INSTANCE_ZONE=europe-west6-b
export PROJECT_NAME=locust-tasks
export CLUSTER_NAME=${PROJECT_NAME}-cluster
export CONTAINER_NAME=${PROJECT_NAME}-container
export POD_COUNT=$1

echo "setup"
gcloud config set compute/zone ${INSTANCE_ZONE}

echo "scale locust-worker pods"
kubectl scale --replicas=${POD_COUNT} replicationcontrollers locust-worker

echo "confirm scaling"
kubectl get pods -l name=locust,role=worker