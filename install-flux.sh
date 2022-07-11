#!/bin/bash
# set -e

kubectl create namespace flux-system

kubectl create secret docker-registry private-registry --docker-server=registry1.dso.mil --docker-username=$REGISTRY1_USER --docker-password=$REGISTRY1_PASS -n flux-system

kustomize build https://repo1.dso.mil/platform-one/big-bang/bigbang.git//base/flux?ref=1.33.0 | kubectl apply -f -

kubectl get deploy -o name -n flux-system | xargs -n1 -t kubectl rollout status -n flux-system
