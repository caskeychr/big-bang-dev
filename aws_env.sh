export AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id --profile "$AWS_PROFILE");
export AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key --profile "$AWS_PROFILE");
export AWS_SESSION_TOKEN=$(aws configure get aws_session_token --profile "$AWS_PROFILE");
export AWS_SECURITY_TOKEN=$(aws configure get aws_security_token --profile "$AWS_PROFILE");
export AWS_DEFAULT_REGION="us-east-1";