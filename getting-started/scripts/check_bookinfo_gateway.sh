#!/usr/bin/env bash

echo "determine ingress host and port"
export INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].port}')
export SECURE_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="https")].port}')

echo "Gateway URL"
export GATEWAY_URL=$INGRESS_HOST:$INGRESS_PORT

echo "confirm app is running"
curl -o /dev/null -s -w "%{http_code}\n" http://${GATEWAY_URL}/productpage