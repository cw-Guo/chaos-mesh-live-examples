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
To set up, you need to run `setup.sh`{{execute}}
You can check the pods status by runing `kubectl get pods -n kubernetes-dashboard`{{execute}}



<!-- First we need to switch to a user which is created for this show case.
run `cd /home/ubuntu && su ubuntu`{{execute}} -->
Your username is "ubuntu". Your password is "password".

You can run `bash`{{execute}} to switch to bash shell.

## Check minikube, kubectl, helm version

We can use `minikube version`{{execute}} to check that we have already successfully installed `minicude` and its version.

To check kubectl version, run `kubectl version --client`{{execute}}
   the expected output should be

``` sh
Client Version: version.Info{Major:"1", Minor:"17", GitVersion:"v1.17.3", GitCommit:"06ad960bfd03b39c8310aaf92d1e7c12ce618213", GitTreeState:"clean", BuildDate:"2020-02-11T18:14:22Z", GoVersion:"go1.13.6", Compiler:"gc", Platform:"linux/amd64"}
```

To check whether Helm is installed or not, execute the following command:
`helm version`{{execute}}

the expected output should be:
```
Client: &version.Version{SemVer:"v2.10.0", GitCommit:"9ad53aac42165a5fadc6c87be0dea6b115f93090", GitTreeState:"clean"}
```

## Check the cluster status

To check the cluster status, we can run `kubectl get services`{{execute}}. You will see a similar output as follows:

```sh
NAME TYPE CLUSTER-IP EXTERNAL-IP PORT(S) AGE
kubernetes ClusterIP xxx.xx.x.x <none> 443/TCP 9s
```

You can run `kubectl get nodes`{{execute}} and the expeted output should be like
```
NAME           STATUS   ROLES                  AGE    VERSION
minikube       Ready    control-plane,master   102s   v1.23.1
minikube-m02   Ready    <none>                 68s    v1.23.1
```