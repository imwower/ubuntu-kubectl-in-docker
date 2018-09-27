FROM ubuntu

# Install Docker and git
RUN apt-get update && \
    apt-get -y install git && \
    apt-get -y install curl && \
    apt-get -y install wget && \
    apt-get -y install vim && \
    apt-get -y install openssh-server && \
    curl -sSL https://get.docker.com/ | sh

# Install kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl
#Install helm
RUN curl -o helm-v2.9.0-linux-amd64.tar.gz https://storage.googleapis.com/kubernetes-helm/helm-v2.9.0-linux-amd64.tar.gz && \
    tar -zxvf helm-v2.9.0-linux-amd64.tar.gz && \
    mv linux-amd64/helm /usr/local/bin/

CMD ["/bin/bash"]
