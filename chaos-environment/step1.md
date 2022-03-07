In this session, we will use `minikube` to create local kubernetes cluster.

Attention: in this katacoda environment, we have already installed `minicude` and `kubectl` for you.

## Install minicude

For more details, please refer to [minikube offcial document](https://minikube.sigs.k8s.io/docs/start/)

`curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64`{{execute}}

`sudo install minikube-linux-amd64 /usr/local/bin/minikube`{{execute}}

We can use `minikube version`{{execute}} to check that we have already successfully installed `minicude` and its version.

## Install kubectl

We need to install `kubectl` so that we can check and interact with the clusters.
For more details, please refer to [kubernetes documentation](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)

1. Download the binary file
   `curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"`{{execute}}

2. Install kubetcl
   `sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl`{{execute}}

3. Check the install result
   `kubectl version --client`{{execute}}
   the expected output should be

``` sh
Client Version: version.Info{Major:"1", Minor:"17", GitVersion:"v1.17.3", GitCommit:"06ad960bfd03b39c8310aaf92d1e7c12ce618213", GitTreeState:"clean", BuildDate:"2020-02-11T18:14:22Z", GoVersion:"go1.13.6", Compiler:"gc", Platform:"linux/amd64"}
```

<!-- ## Start the cluster

To lanuch a cluster, we can run this command `minikube start`{{execute}}. The shell would told you that `kubectl` is now configured to use `minikube` if it succeeds. It may need serveral minites to finish.

To check the cluster status, we can run `kubectl get services`{{execute}}. You will see a similar output as follows:

```sh
NAME TYPE CLUSTER-IP EXTERNAL-IP PORT(S) AGE
kubernetes ClusterIP xxx.xx.x.x <none> 443/TCP 9s
```

We can run `kubectl get nodes`{{execute}} to check node status. -->

## Start the cluster

*Attention*: If you want to create multiple nodes cluster, you need to upgrade docker version. And you should run`minikube start -n 2`{{execute}}

To check the cluster status, we can run `kubectl get services`{{execute}}. You will see a similar output as follows:

You can run `kubectl get nodes`{{copy}} and the expeted output should be like
```
NAME           STATUS   ROLES                  AGE    VERSION
minikube       Ready    control-plane,master   102s   v1.23.1
minikube-m02   Ready    <none>                 68s    v1.23.1
```