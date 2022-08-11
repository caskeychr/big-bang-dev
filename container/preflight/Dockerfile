FROM alpine:latest

ENV GLIBC_VER=2.31-r0

WORKDIR /usr/src/app

COPY . .

# # APK Packages
# RUN apk add binutils curl zip less bash git \ 
#   openssl gnupg jq yq docker certbot openrc \
#   py3-pip

# # AWS CLI Install
# RUN curl -sL https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub -o /etc/apk/keys/sgerrand.rsa.pub \
#   && curl -sLO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VER}/glibc-${GLIBC_VER}.apk \
#   && curl -sLO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VER}/glibc-bin-${GLIBC_VER}.apk \
#   && apk add --no-cache \
#   glibc-${GLIBC_VER}.apk \
#   glibc-bin-${GLIBC_VER}.apk \
#   && curl -sL https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip \
#   && unzip awscliv2.zip \
#   && aws/install \
#   && rm -rf \
#   awscliv2.zip \
#   aws \
#   /usr/local/aws-cli/v2/*/dist/aws_completer \
#   /usr/local/aws-cli/v2/*/dist/awscli/data/ac.index \
#   /usr/local/aws-cli/v2/*/dist/awscli/examples \
#   && rm glibc-${GLIBC_VER}.apk \
#   && rm glibc-bin-${GLIBC_VER}.apk \
#   && rm -rf /var/cache/apk/*

# # Kubectl Install
# RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
#   install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# # Helm Install
# RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && \
#   chmod 700 get_helm.sh && \
#   ./get_helm.sh

# # Install Rancher CLI
# RUN chmod +x ./rancher && \
#   mv ./rancher /usr/local/bin/rancher

# Install Task Runner
RUN sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b /usr/local/bin

CMD [ "task", "hello" ]