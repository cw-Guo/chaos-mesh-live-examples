#!/usr/bin/env bash
while [[ $(kubectl get pods -n kubernetes-dashboard -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True True" ]]; do echo "Waiting for pod running" && sleep 10; done
kubectl -n kubernetes-dashboard create token admin-user