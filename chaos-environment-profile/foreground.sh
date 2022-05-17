# sleep 1;wait.sh
# cd /home/ubuntu && su ubuntu 
# minikube start -n 2
# minikube start
# sleep 2;
# echo "welcome to chaos mesh live example!"
#!/bin/bash
echo "done" >> /root/katacoda-finished
# update helm
before_helm=$(date +"%s")
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

after_helm=$(date +"%s")
echo "install helm spend: $(($after_helm - $before_helm)) s"
# wait cluster

while [[ $(kubectl get pods -n kube-system -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True True True True True True True True" ]]; do echo "Waiting for pod running" && sleep 10; done

after_cluster=$(date +"%s")
echo "cluster ready spend: $(($after_cluster - $after_helm)) s"

# install chaos-mesh
helm repo add chaos-mesh https://charts.chaos-mesh.org
kubectl create ns chaos-mesh
helm install chaos-mesh chaos-mesh/chaos-mesh -n=chaos-mesh --version 2.1.3 --set chaosDaemon.env.DOCKER_API_VERSION=1.40

after_mesh=$(date +"%s")
echo "install chaos-mesh ready spend: $(($after_mesh - $after_cluster)) s"

# update docker
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FEEA9169307EA071
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8B57C5C2836F4BEB
curl -fsSL https://get.docker.com -o get-docker.sh && sudo sh get-docker.sh >/dev/null
sudo usermod -aG docker $(whoami)
sudo chmod 666 /var/run/docker.sock
# wait cluster
# sleep 20s
after_docker=$(date +"%s")
echo "update docker spend: $(($after_docker - $after_mesh)) s"

echo "done" >> /root/katacoda-background-finished