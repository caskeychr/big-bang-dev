#!/bin/bash
AWS_CREDS=$(./scripts/get-aws-profile.sh --profile='awsaml-729651203190-BAHSSO_Admin_Role')

cat<<EOF >  ./aws_creds
$AWS_CREDS
EOF