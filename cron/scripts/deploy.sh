#!/usr/bin/env bash

echo "preparing..."
export GCLOUD_PROJECT=$(gcloud config get-value project)
export INSTANCE_REGION=europe-west6
export INSTANCE_ZONE=europe-west6-a
export PROJECT_NAME=cron
export CLUSTER_NAME=${PROJECT_NAME}-cluster
export CONTAINER_NAME=${PROJECT_NAME}-container

echo "setup"
gcloud config set compute/zone ${INSTANCE_ZONE}

echo "name replace"
sed -i "s/PROJECT_NAME/${GCLOUD_PROJECT}/g" ../k8s/deployment.yaml

echo "create pod-replicaset"
kubectl apply -f ../k8s/deployment.yaml
kubectl apply -f ../k8s/service.yaml