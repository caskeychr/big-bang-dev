#!/bin/bash

# # kubectl delete ns argocd
# kubectl delete ns monitoring
# kubectl delete ns gitlab
# kubectl delete ns jaeger
# # kubectl delete ns kiali
# kubectl delete ns istio-system
# kubectl delete ns istio-operator
# kubectl delete ns bigbang
# # kubectl delete ns flux-system

# NS=argocd
# kubectl get ns $NS -o json | jq '.spec.finalizers = []' | kubectl replace --raw "/api/v1/namespaces/$NS/finalize" -f -

# NS=monitoring
# kubectl get ns $NS -o json | jq '.spec.finalizers = []' | kubectl replace --raw "/api/v1/namespaces/$NS/finalize" -f -

# NS=gitlab
# kubectl get ns $NS -o json | jq '.spec.finalizers = []' | kubectl replace --raw "/api/v1/namespaces/$NS/finalize" -f -

# NS=jaeger
# kubectl get ns $NS -o json | jq '.spec.finalizers = []' | kubectl replace --raw "/api/v1/namespaces/$NS/finalize" -f -

# NS=kiali
# kubectl get ns $NS -o json | jq '.spec.finalizers = []' | kubectl replace --raw "/api/v1/namespaces/$NS/finalize" -f -

# NS=istio-system
# kubectl get ns $NS -o json | jq '.spec.finalizers = []' | kubectl replace --raw "/api/v1/namespaces/$NS/finalize" -f -

# NS=istio-operator
# kubectl get ns $NS -o json | jq '.spec.finalizers = []' | kubectl replace --raw "/api/v1/namespaces/$NS/finalize" -f -

# NS=bigbang
# kubectl get ns $NS -o json | jq '.spec.finalizers = []' | kubectl replace --raw "/api/v1/namespaces/$NS/finalize" -f -

# NS=flux-system
# kubectl get ns $NS -o json | jq '.spec.finalizers = []' | kubectl replace --raw "/api/v1/namespaces/$NS/finalize" -f -

NS=keycloak
kubectl get ns $NS -o json | jq '.spec.finalizers = []' | kubectl replace --raw "/api/v1/namespaces/$NS/finalize" -f -

# kubectl api-resources --verbs=list --namespaced -o name   | xargs -n 1 kubectl get --show-kind --ignore-not-found -n
# kubectl api-resources --verbs=list --namespaced -o name | xargs -n 1 kubectl get --show-kind --show-labels --ignore-not-found -n istio-system

# NAMESPACE=istio-system
# kubectl proxy --append-server-path | curl -k -H "Content-Type: application/json" -X PUT --data-binary @tmp.json http://127.0.0.1:8001/api/v1/namespaces/$NAMESPACE/finalize

# kubectl get ns $NAMESPACE -o json \
#   | tr -d "\n" | sed "s/\"finalizers\": \[[^]]\+\]/\"finalizers\": []/" \
#   | kubectl replace --raw /api/v1/namespaces/$NAMESPACE/finalize -f -