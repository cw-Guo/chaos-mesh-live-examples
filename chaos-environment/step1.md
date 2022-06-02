## Your Kubernetes Cluster status

For this scenario, Katacoda has just started a fresh Kubernetes cluster for you. Verify that it's ready for your use:

You can run the following commands to check the status

```
kubectl version --short && \
kubectl get nodes && \
kubectl get componentstatus && \
kubectl cluster-info
```{{execute}}

It should list a 1-node cluster and the control plane components should be reporting Healthy. If it's not healthy, try again in a few moments. If it's still not functioning refresh the browser tab to start a fresh scenario instance before proceeding.

The Helm package manager used for installing applications on Kubernetes is also available:

`helm version --short`{{execute}}

## Kubernetes Dashboard
You can administer your cluster with the kubectl CLI tool or use the visual Kubernetes dashboard. The Dashboard can be accessed from the tab labeled Kubernetes Dashboard above the command line after the setup. 
To set up, you need to run `setup.sh`{{execute}}.

For the reason of security, you would be required to input a token, which could be retrieved using this command: `dashboard-token.sh`{{execute}}

After get the token, you can visit the [dashboard]({{TRAFFIC_HOST1_8001}}/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/overview?namespace=default)

You can check the pods status by runing `kubectl get pods -n kubernetes-dashboard`{{execute}}


## Check the cluster status

To check the cluster status, we can run `kubectl get services`{{execute}}. You will see a similar output as follows:

```sh
NAME TYPE CLUSTER-IP EXTERNAL-IP PORT(S) AGE
kubernetes ClusterIP xxx.xx.x.x <none> 443/TCP 9s
```

You can run `kubectl get nodes`{{execute}} and the expeted output should be like
```
controlplane $ kubectl get nodes
NAME           STATUS   ROLES           AGE   VERSION
controlplane   Ready    control-plane   11d   v1.24.0
```