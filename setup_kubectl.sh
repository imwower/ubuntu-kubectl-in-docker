#!/bin/sh
kubectl config set-cluster dev --certificate-authority=/var/run/secrets/kubernetes.io/serviceaccount/ca.crt --embed-certs=true --server="https://kubernetes.default/"
kubectl config set-credentials user --token="$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)"
kubectl config set-context default --cluster=dev --user=user
kubectl config use-context default
echo "finished set up kubectl."

/bin/bash
