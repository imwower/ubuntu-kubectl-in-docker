# ubuntu-kubectl-in-docker
ubuntu setup kubectl config within k8s pod

execute setup_kubectl.sh after container start, for example:

docker run -d -v xxx/setup_kubectl.sh:/opt/kubectl/setup_kubectl.sh imwower:ubuntu-kubectl-in-docker /sh /opt/kubectl/setup_kubectl.sh
