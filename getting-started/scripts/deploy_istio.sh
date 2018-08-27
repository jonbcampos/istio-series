#!/usr/bin/env bash

export ISTIO_VERSION=1.0.0

echo "deploy istio"
cd istio-${ISTIO_VERSION}

# use deployment manager
cd install/gcp/deployment_manager
gcloud deployment-manager deployments create istio-deployment --config=istio-cluster.yaml