cd ..
cd bigbang

helm upgrade -i bigbang chart -n bigbang --create-namespace \
  --set registryCredentials[0].username="${REGISTRY1_USER}" \
  --set registryCredentials[0].password="${REGISTRY1_PASS}" \
  --set registryCredentials[0].registry=registry1.dso.mil \
  --set registryCredentials[1].username="${CSN_GITHUB_USER}" \
  --set registryCredentials[1].password="${CSN_GITHUB_PASS}" \
  --set registryCredentials[1].registry=docker.io \
  -f ./configmap.yaml