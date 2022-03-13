#!/bin/bash
echo "done" >> /root/katacoda-finished
# update helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

# wait cluster
sleep 20s

# install chaos-mesh
helm repo add chaos-mesh https://charts.chaos-mesh.org
kubectl create ns chaos-mesh
helm install chaos-mesh chaos-mesh/chaos-mesh -n=chaos-mesh --version 2.1.3

echo "done" >> /root/katacoda-background-finished