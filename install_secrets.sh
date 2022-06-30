cat<<EOF >  ./registry.s3.yaml
s3:
  bucket: bsf-caskey-gitlab-registry-storage
  region: us-east-1
  v4auth: true
EOF

cat<<EOF >  ./rails.s3.yaml
provider: AWS
region: us-east-1
EOF

cat<<EOF >  ./storage.config
[default]
bucket_location = us-east-1
multipart_chunk_size_mb = 128
EOF

cat<<EOF >  ./provider-github.yaml
name: github
app_id: '3558f74c40bceb0f784b'
app_secret: '397d0523993dcf95b965cf082c6905e0a08ea34b'
args:
  scope: "user:email"
EOF

kubectl create secret generic gitlab-github --from-file=provider=provider-github.yaml

cat<<EOF >  ./provider-keycloak.yaml
name: saml
label: 'SAML'
args:
  assertion_consumer_service_url: 'https://gitlab.caskey-p1cbb.bahsoftwarefactory.com/users/auth/saml/callback'
  idp_cert: 'MIIClTCCAX0CBgGBQ5jzRzANBgkqhkiG9w0BAQsFADAOMQwwCgYDVQQDDANic2YwHhcNMjIwNjA4MTM1MzI2WhcNMzIwNjA4MTM1NTA2WjAOMQwwCgYDVQQDDANic2YwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCU8pgMAY/lexJAWRGtAlSKMKHCcl9X0BsEIBiS8nfSFHieAue173HXO3sRNXzeSTgdE8p+4k7vfCb2tYnvPKddCQErSD6wRGLGXUVygkeJc2cOWf1wdGR1ED95Blc2djekT5MgQFrNMEnmNIDDZarh8TYkqy3Fy/DM8t+7BsLlTtmGdZZ/THvK5ycBaLQRFSnJdJvOQP8fN+4q/qDTtDQE6IHTZDPnnRupGeAfzMrNQn+6Mg3iHWftFdCknx2gKnpzh6nODrUj2flMGjCEa9VflCQHAu9Dvg8a+zIvokiGJkHE20V9aY6NUGSyGPszxxSjs9FzndpTp9IqyLFBG493AgMBAAEwDQYJKoZIhvcNAQELBQADggEBAIVe0xafhF9g4PZVsCxXb9r1+VbR1eQIMlY5vDbLxtNUWwSwyCeqzneiqDvRdn/LuBMcam3J+40KjZmAS0XEqsyARJOd2O92uhQ2RE3nWd3QX1j8MSLh+KrfiMN+Uv3kb4V85Jd040IK6ff86Q2NfyFdbwxbojhi3QKFPkOHoEYBij7N+PDt11AUqjKerxpS9rlC/tCdCvdTDENrlSACbErCuBpu3uikx9qqjhbP2wO0QBJ7IpaJYrviOPrSzJrB1tgmg+635ribdBrEIUScfiKVxZ9aWXAKoBm6sGASjwfF/NeCr5eQalzs31ShpRo47jqThiFV26FlduvgDLwQvX4='
  idp_sso_target_url: 'https://keycloak.dev.bahsoftwarefactory.com/auth/realms/bsf/protocol/saml/clients/gitlab.bahsoftwarefactory.com'
  issuer: 'https://gitlab.caskey-p1cbb.bahsoftwarefactory.com'
  name_identifier_format: 'urn:oasis:names:tc:SAML:2.0:nameid_format:persistent'
EOF

kubectl create secret generic gitlab-keycloak --from-file=provider=provider-keycloak.yaml