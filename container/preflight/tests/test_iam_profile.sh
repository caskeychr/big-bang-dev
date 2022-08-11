#!/bin/bash

source ./aws_creds.sh

AWS_ROLE=$(yq '.aws_role' < ./config/config.yaml)

echo $AWS_ROLE

IAM_ATTACHED_POLICIES=$(aws iam list-attached-role-policies --role-name $AWS_ROLE)

echo $IAM_ATTACHED_POLICIES

ATTACHED_POLICIES_JSON=$(echo $IAM_ATTACHED_POLICIES | jq -c '.AttachedPolicies.[]')

echo \n
echo $ATTACHED_POLICIES_JSON

# ATTACHED_POLICIES_CLEAN=$(echo $ATTACHED_POLICIES_JSON | sed -e 's/\[ //g' -e 's/\ ]//g' -e 's/\,//g')

# echo \n
# echo $ATTACHED_POLICIES_CLEAN

# ATTACHED_POLICIES=( $ATTACHED_POLICIES_CLEAN )

# echo "\n"
# echo $ATTACHED_POLICIES

# for i in "$ATTACHED_POLICIES"
# do 
#   echo $i 
# done 
