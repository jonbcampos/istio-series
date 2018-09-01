#!/usr/bin/env bash

echo "change directory"
export ISTIO_VERSION=1.0.0
cd istio-${ISTIO_VERSION}/

echo "launch bookinfo sample"
kubectl label namespace default istio-injection=enabled
kubectl apply -f samples/bookinfo/platform/kube/bookinfo.yaml
sleep 10

echo "add in the ingress"
kubectl apply -f samples/bookinfo/networking/bookinfo-gateway.yaml
kubectl get gateway

echo "checking for gateway completion"
sleep 10
sh check_bookinfo_gateway.sh

echo "if this errors out you can always retry by calling:"
echo "sh check_bookinfo_gateway.sh"

echo "you'll also want to add in the version routing for the samples:"
echo "sh ~/istio-series/getting-started/samples/add-bookinfo-version-routing.sh"