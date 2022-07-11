source ./env.sh
source ./resource-tagging.sh
source ./pod-security.sh 
source ./install-longhorn.sh 
source ./install-flux.sh
source ./install-bb.sh

until kubectl get svc -n istio-system public-ingressgateway -o json | \
  jq '.status[].ingress[].hostname' | \
  grep "elb.us-east-1.amazonaws.com"; do sleep 5; done