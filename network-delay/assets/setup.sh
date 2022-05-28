#!/bin/sh
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.5.0/aio/deploy/recommended.yaml
kubectl apply -f dashboard-adminuser.yaml
kubectl proxy --address='0.0.0.0' --disable-filter=true &