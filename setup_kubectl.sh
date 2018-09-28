#!/bin/sh
kubectl config set-cluster dev --certificate-authority=/var/run/secrets/kubernetes.io/serviceaccount/ca.crt --embed-certs=true --server="https://kubernetes.default/"
kubectl config set-credentials user --token="$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)"
kubectl config set-context default --cluster=dev --user=user
kubectl config use-context default
echo "finished set up kubectl."

# must mount volume
kubectl apply -f /opt/kubectl/ubuntu-kubectl-in-docker/ingress-nginx/tcp-services.yaml
# origin url
#kubectl apply -f https://raw.githubusercontent.com/imwower/ubuntu-kubectl-in-docker/master/ingress-nginx/tcp-services.yaml

# helm init
docker pull jessestuart/tiller:v2.9.1

helm init --upgrade --tiller-image jessestuart/tiller:v2.9.1 --stable-repo-url https://kubernetes.oss-cn-hangzhou.aliyuncs.com/charts
helm version

#helm install spinnaker
helm install -n spinnaker stable/spinnaker -f /opt/kubectl/ubuntu-kubectl-in-docker/k8s/spinnaker/values.yaml --namespace spinnaker

#start bash
/bin/bash
