export AWS_PROFILE=awsaml-729651203190-BAHSSO_Admin_Role
export AWS_DEFAULT_PROFILE=awsaml-729651203190-BAHSSO_Admin_Role

mkdir ~/.p1c-bb/cert-bb

certbot certonly \
  --dns-route53 \
  --dns-route53-propagation-seconds 30 \
  --non-interactive \
  --agree-tos \
  --email "caskey_christopher@bah.com" \
  -d "*.caskey-p1cbb.bahsoftwarefactory.com" \
  --work-dir ~/.p1c-bb/cert-bb \
  --config-dir ~/.p1c-bb/cert-bb \
  --logs-dir ~/.p1c-bb/cert-bb \