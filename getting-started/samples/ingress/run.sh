#!/usr/bin/env bash

echo "change directory"
export ISTIO_VERSION=1.0.0
cd ~/istio-series/getting-started/scripts/istio-${ISTIO_VERSION}/

echo "add in httpbin"
kubectl apply -f samples/httpbin/httpbin.yaml

echo "check ingress"
kubectl get svc istio-ingressgateway -n istio-system

echo "get ingress"
export INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].port}')
export SECURE_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="https")].port}')

echo "create gateway"
kubectl apply -f ~/istio-series/getting-started/samples/ingress/gateway-httpbin.yaml

echo "config routes"
kubectl apply -f ~/istio-series/getting-started/samples/ingress/virtual-service-httpbin-gateway.yaml

echo "access httpbin service"
sleep 10
curl -I -HHost:httpbin.example.com http://${INGRESS_HOST}:${INGRESS_PORT}/status/200