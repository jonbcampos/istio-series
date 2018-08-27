#!/usr/bin/env bash

kubectl get secret --namespace istio-system grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo