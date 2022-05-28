#!/bin/sh
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.5.0/aio/deploy/recommended.yaml >/dev/null
while [[ $(kubectl get pods -n kubernetes-dashboard -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True True" ]]; do echo "Waiting for pod running" && sleep 10; done
kubectl apply -f dashboard-adminuser.yaml
kubectl proxy --address='0.0.0.0' --disable-filter=true & 2>/dev/null
sleep 1