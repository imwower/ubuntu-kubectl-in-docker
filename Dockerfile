FROM ubuntu

# Install Docker and git
RUN apt-get install -y \
           apt-transport-https \
           ca-certificates \
           curl \
           software-properties-common \
           git

RUN curl -fsSL https://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository \
       "deb [arch=amd64] https://mirrors.aliyun.com/docker-ce/linux/ubuntu \
       $(lsb_release -cs) \
       stable"
RUN apt-get update && \
        apt-get install -y docker-ce

# Install kubectl and helm
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl && \
    curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get | bash
    
CMD ["/bin/bash"]
