#!/usr/bin/env bash

export ISTIO_VERSION=1.0.0

echo "download istio"
curl -L https://git.io/getLatestIstio | ISTIO_VERSION=${ISTIO_VERSION} sh -

echo "change directory"
cd istio-${ISTIO_VERSION}/

echo "add istio to the path"
export PATH=${PWD}/bin:$PATH

echo "install istio"
# kubectl apply -f install/kubernetes/helm/istio/templates/crds.yaml
# sleep 5
helm install install/kubernetes/helm/istio \
    --name istio \
    --tls \
    --namespace istio-system \
	--set global.mtls.enabled=true \
	--set grafana.enabled=true \
	--set grafana.persist=false \
	--set grafana.storageClassName="" \
	--set servicegraph.enabled=true \
	--set tracing.enabled=true \
	--set kiali.enabled=true