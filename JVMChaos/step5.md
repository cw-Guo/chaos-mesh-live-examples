## Pod-failure Experiment
In this experiment, we are going to make a certain pod unavailable for a period of time, eg: 120 seconds.
When we call a certain pod unavailable, we are saying that a certain pod is unable to perform its duty, for example, responding to HTTP requests.

Pod-failure Chaos experiment would change the image of each container in the target Pod to the `pause image`, which is a special image that does not perform any operations. But this wouldn't cause any problem if the container is configured without `command`, `livenessProbe` and `readinessProbe`: the container would be inspected as Running and Ready, even its image has been updated to `pause`. In this experiment, we configured a `liveness probe`.

Here is the YAML we use to deploy a pod-failure experiment.

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: helloworld
  namespace: helloworld
spec:
  containers:
    - name: helloworld
      # source code: https://github.com/WangXiangUSTC/byteman-example/tree/main/example.helloworld
      # this application will print log like this below:
      # 0. Hello World
      # 1. Hello World
      # ...
      image: xiang13225080/helloworld:v1.0
      imagePullPolicy: IfNotPresent
```{{copy}}

Before the experiment, you can run `curl localhost:8082/buddy/list`{{execute}} to get the output of our application to get a available pods' ip list.

After deploying this experiment by run `kubectl apply -f pod-failure.yaml`{{execute}}, you can expect that one of the pods has been injected and its image has been updated to `pause`. It would need several minutes before the experiment applies and hopefully the pod status would be `CrashLoopBackOff`.

To help you check the pod status, run `wait-failure.sh`{{execute}} and then run `kubectl get pods`{{execute}} to check the status.

```
$ kubectl get pods
NAME                                     READY   STATUS             RESTARTS   AGE
buddy-list-deployment-6d756fb8cf-lrxjb   1/1     Running            0          3m5s
buddy-list-deployment-6d756fb8cf-nlr5c   1/1     Running            0          3m5s
buddy-list-deployment-6d756fb8cf-zgnq8   0/1     CrashLoopBackOff   4          3m5s
```
You can check this via our application: https://[[HOST_SUBDOMAIN]]-8082-[[KATACODA_HOST]].environments.katacoda.com/buddy/list 
And you will find that there are only two IPs left, which was three at the beginning.

For your convenienve, you can run `curl localhost:8082/buddy/list`{{execute}} instead to get the output of our application.

After the experiment finished, which is set via `duration: 180s`  in the yaml, you will find that the pod resume and three IPs are shown in the web application. 

run `curl localhost:8082/buddy/list`{{execute}} to get the output of our application.

If you try to run `kubectl get pods`{{execute}}, you would see a similiar output

```
$ kubectl get pods
NAME                                     READY   STATUS    RESTARTS   AGE
buddy-list-deployment-6d756fb8cf-lrxjb   1/1     Running   0          4m14s
buddy-list-deployment-6d756fb8cf-nlr5c   1/1     Running   0          4m14s
buddy-list-deployment-6d756fb8cf-zgnq8   1/1     Running   5          4m14s
```

Cool! You have finished this experiment and you can explore more about thi s on the offical document website.

#### clear the experiment

the experiment can be easily removed via `kubectl delete -f pod-failure.yaml`{{execute}}
