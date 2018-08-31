#!/usr/bin/env bash

echo "enable mutual TLS destination rules"
kubectl apply -f samples/bookinfo/networking/destination-rule-all-mtls.yaml

echo "display destination rules"
kubectl get destinationrules -o yaml