export AWS_PROFILE=awsaml-729651203190-BAHSSO_Admin_Role
export AWS_DEFAULT_PROFILE=awsaml-729651203190-BAHSSO_Admin_Role

export CLUSTER_VALUE=c-m-r5znkvvz
export SECURITY_GROUP_ID=sg-09a154c331ce9e588

# Tag Security Group

aws resourcegroupstaggingapi tag-resources \
    --resource-arn-list arn:aws:ec2:us-east-1:729651203190:security-group/$SECURITY_GROUP_ID \
    --tags kubernetes.io/cluster/$CLUSTER_VALUE=owned \
    --region us-east-1

# Tag VPC

aws resourcegroupstaggingapi tag-resources \
    --resource-arn-list arn:aws:ec2:us-east-1:729651203190:vpc/vpc-023a468241eea5b0b \
    --tags kubernetes.io/cluster/$CLUSTER_VALUE=shared \
    --region us-east-1
  
# Tag Subnets
  
aws resourcegroupstaggingapi tag-resources \
    --resource-arn-list arn:aws:ec2:us-east-1:729651203190:subnet/subnet-069fd7685cca4018a \
    --tags kubernetes.io/cluster/$CLUSTER_VALUE=shared \
    --region us-east-1
  
aws resourcegroupstaggingapi tag-resources \
    --resource-arn-list arn:aws:ec2:us-east-1:729651203190:subnet/subnet-08942469f925d9b66 \
    --tags kubernetes.io/cluster/$CLUSTER_VALUE=shared \
    --region us-east-1
  
aws resourcegroupstaggingapi tag-resources \
    --resource-arn-list arn:aws:ec2:us-east-1:729651203190:subnet/subnet-04987f9522e27a836 \
    --tags kubernetes.io/cluster/$CLUSTER_VALUE=shared \
    --region us-east-1

aws ec2 authorize-security-group-ingress \
    --group-id "$SECURITY_GROUP_ID" \
    --ip-permissions IpProtocol=all,FromPort=-1,ToPort=-1,UserIdGroupPairs='[{GroupId='$SECURITY_GROUP_ID',Description="Allow Cluster Communication"}]' \
    --region us-east-1 \
    --no-cli-pager