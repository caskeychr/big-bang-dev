# Install Longhorn
helm repo add longhorn https://charts.longhorn.io
 
helm install longhorn longhorn/longhorn \
--namespace longhorn-system \
--create-namespace
 
kubectl -n longhorn-system rollout status deployment/longhorn-driver-deployer