FROM ubuntu

# Install Docker and git
RUN apt-get -qq update && \
    apt-get -qq -y install git && \
    apt-get -qq -y install curl && \
    apt-get -qq -y install wget && \
    apt-get -qq -y install vim && \
    apt-get -qq -y install openssh-server && \
    curl -sSL https://get.docker.com/ | sh

# Install kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl
#Install helm
RUN curl https://storage.googleapis.com/kubernetes-helm/helm-v2.9.0-linux-amd64.tar.gz && \
    tar -zxvf helm-v2.9.0-linux-amd64.tar.gz && \
    mv linux-amd64/helm /usr/local/bin/

CMD ["/bin/bash"]
