#!/bin/bash
# set -e

kubectl create namespace bigbang

# export fp=$(gpg --list-keys --fingerprint | grep "bigbang-dev-environment" -B 1 | grep -v "bigbang-dev-environment" | tr -d ' ' | tr -d 'Keyfingerprint=')
gpg --export-secret-key --armor ${fp} | kubectl create secret generic sops-gpg -n bigbang --from-file=bigbangkey.asc=/dev/stdin

kubectl create secret -n bigbang generic private-git --from-literal=username=$CSN_GITHUB_USER --from-literal=password=$CSN_GITHUB_PASS

# kubectl apply -f dev/bigbang.yaml

cd bigbang2

helm upgrade -i bigbang chart -n bigbang --create-namespace \
  --set registryCredentials[0].username="${REGISTRY1_USER}" \
  --set registryCredentials[0].password="${REGISTRY1_PASS}" \
  --set registryCredentials[0].registry=registry1.dso.mil \
  --set registryCredentials[1].username="${CSN_GITHUB_USER}" \
  --set registryCredentials[1].password="${CSN_GITHUB_PASS}" \
  --set registryCredentials[1].registry=docker.io \
  -f ./configmap.yaml

# Watch for Big Bang Flux Install
watch kubectl get gitrepositories,kustomizations,hr,po -A