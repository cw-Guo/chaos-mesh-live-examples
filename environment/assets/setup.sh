#!/bin/sh
minikube dashboard --url=true &
kubectl proxy --address='0.0.0.0' --disable-filter=true