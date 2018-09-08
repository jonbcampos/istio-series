#!/usr/bin/env bash

echo "change directory"
export ISTIO_VERSION=1.0.0
cd ~/istio-series/getting-started/scripts/istio-${ISTIO_VERSION}/

echo "cleanup"
kubectl delete gateway httpbin-gateway
kubectl delete virtualservice httpbin
kubectl delete --ignore-not-found=true -f samples/httpbin/httpbin.yaml

echo "cleanup complete"