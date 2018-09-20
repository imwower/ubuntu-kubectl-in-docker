#!/bin/sh
kubectl config set-cluster dev --certificate-authority=/var/run/secrets/kubernetes.io/serviceaccount/ca.crt --embed-certs=true --server="https://kubernetes.default/"
kubectl config set-credentials user --token="$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)"
kubectl config set-context default --cluster=dev --user=user
kubectl config use-context default
echo "finished set up kubectl."

# must mount volume
kubectl apply -f /opt/kubectl/ubuntu-kubectl-in-docker/ingress-nginx/tcp-services.yaml
# origin url
kubectl apply -f https://raw.githubusercontent.com/imwower/ubuntu-kubectl-in-docker/master/ingress-nginx/tcp-services.yaml

/bin/bash
