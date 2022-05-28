kubectl apply -f rbac.yaml
sleep 5s
echo "name: account-cluster-manager-vpnfy"
echo "token: " "$(kubectl create token account-cluster-manager-vpnfy)"
# kubectl describe secrets account-cluster-manager-vpnfy | grep Name: | awk '{split($0,a,":"); print "name: " a[2]}'
# kubectl describe secrets account-cluster-manager-vpnfy | grep token: | awk '{split($0,a,":"); print "token: " a[2]}'