aws ec2 create-security-group \
    --group-name "$YOURNAME-rancher-nodes" \
    --description "$YOURNAME-rancher-nodes" \
    --vpc-id vpc-023a468241eea5b0b \
    --region us-east-1 \
    --no-cli-pager

SG_ID=$(aws ec2 describe-security-groups \
    --filters Name=vpc-id,Values=vpc-023a468241eea5b0b \
    Name=group-name,Values="$YOURNAME-rancher-nodes" \
    --query 'SecurityGroups[*].[GroupId]' --output text)

## Adding IP to your cluster SG
aws ec2 authorize-security-group-ingress \
    --group-id "$SG_ID" \
    --ip-permissions IpProtocol=all,FromPort=-1,ToPort=-1,IpRanges='[{CidrIp='"$YOUR_IP"/32',Description='"$SG_DESCRIPTION"'}]' \
    --region us-east-1 \
    --no-cli-pager

## Adding rule to cluster communication
aws ec2 authorize-security-group-ingress \
    --group-id "$SG_ID" \
    --ip-permissions IpProtocol=all,FromPort=-1,ToPort=-1,UserIdGroupPairs='[{GroupId='$SG_ID',Description="Allow Cluster Communication"}]' \
    --region us-east-1 \
    --no-cli-pager