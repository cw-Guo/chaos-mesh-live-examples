#!/bin/sh
kubectl apply -f dashboard-adminuser.yaml
kubectl proxy --address='0.0.0.0' --disable-filter=true &