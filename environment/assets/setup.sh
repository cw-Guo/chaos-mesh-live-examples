#!/bin/sh
# install dashboard
# kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.5.0/aio/deploy/recommended.yaml --validate=false
# kubectl proxy --address='0.0.0.0' --port=8002 --accept-hosts='.*' &
minikube dashboard --url=true &
kubectl proxy --address='0.0.0.0' --disable-filter=true