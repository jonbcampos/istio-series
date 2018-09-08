#!/usr/bin/env bash

echo "setup ingress"
sh ~/istio-series/getting-started/samples/ingress/run.sh

echo "change directory"
cd ~/istio-series/getting-started/samples/secure-gateway/

echo "Generate client and server certificates and keys"
git clone https://github.com/nicholasjackson/mtls-go-example
pushd mtls-go-example
sh ./generate.sh httpbin.example.com notMyPa$$word
