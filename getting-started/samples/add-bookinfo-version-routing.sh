#!/usr/bin/env bash

echo "change directory"
export ISTIO_VERSION=1.0.0
cd istio-${ISTIO_VERSION}/

echo "enable mutual TLS destination rules"
kubectl apply -f samples/bookinfo/networking/destination-rule-all-mtls.yaml

echo "display destination rules"
kubectl get destinationrules -o yaml