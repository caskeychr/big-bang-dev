#!/bin/bash
# set -e

kubectl create namespace bigbang

export fp=$(gpg --list-keys --fingerprint | grep "bigbang-dev-environment" -B 1 | grep -v "bigbang-dev-environment" | tr -d ' ' | tr -d 'Keyfingerprint=')
gpg --export-secret-key --armor ${fp} | kubectl create secret generic sops-gpg -n bigbang --from-file=bigbangkey.asc=/dev/stdin


kubectl create namespace flux-system
kubectl create secret docker-registry private-registry --docker-server=https://registry1.dso.mil --docker-username=$REGISTRY1_USER --docker-password=$REGISTRY1_PASS -n flux-system
kubectl create secret -n bigbang generic repository-credentials --from-literal=username=$CSN_GITHUB_USER --from-literal=password=$CSN_GITHUB_TOKEN

kustomize build https://repo1.dso.mil/platform-one/big-bang/bigbang.git//base/flux?ref=1.31.0 | kubectl apply -f -

kubectl get deploy -o name -n flux-system | xargs -n1 -t kubectl rollout status -n flux-system

kubectl apply -f dev/bigbang.yaml

# Create Namespaces
kubectl create namespace flux-system
kubectl create namespace bigbang

# Create Secrets
kubectl create secret docker-registry private-registry --docker-server=registry1.dso.mil --docker-username=$dockerUsername --docker-password=$dockerPassword -n flux-system
kubectl create secret -n bigbang generic repository-credentials --from-literal=username=$registry1Username --from-literal=password=$registry1Password
kubectl create secret -n bigbang generic private-git --from-literal=username=$registry1Username --from-literal=password=$registry1Password

gpg --allow-secret-key-import --import $HOME/.ssh/bigbangkey.asc
kubectl create secret generic sops-gpg -n bigbang --from-file=$HOME/.ssh/bigbangkey.asc

# Install Flux
kustomize build https://repo1.dso.mil/platform-one/big-bang/bigbang.git//base/flux?ref=1.22.0 | kubectl apply -f - 

# Install BigBang
kubectl apply -f $devDir/BB-UIP/bigbang/template/dev/bigbang.yaml

# Watch for Big Bang Flux Install
watch kubectl get gitrepositories,kustomizations,hr,po -A