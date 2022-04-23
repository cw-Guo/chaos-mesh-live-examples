## Experiments

### pod-failure experiment
In this experiment, we are going to make a certain pod unavailable for a period of time, eg: 120 seconds.
When we call a certain pod unavailable, we are saying that a certain pod is unable to perform its duty, for example, responding to http requests.

Pod Failure Chaos Experiment would change the image of each container in the target Pod to the `pause image`, which is a special image that does not perform any operations. But this wouldn't cause any problem if the container is configured without `command`, `livenessProbe` and `readinessProbe`: the container would be inspected as Running and Ready, even its image has been updated to `pause`. In this experiment, we configured a `Liveness probe`.

Here is the yaml we use to deploy a pod-failure experiment.

```yaml
apiVersion: chaos-mesh.org/v1alpha1
kind: PodChaos
metadata:
  name: pod-failure-example
  # namespace: chaos-testing
spec:
  action: pod-failure
  mode: one
  duration: '120s'
  selector:
    labelSelectors:
      'app': 'buddy-service'
```{{copy}}

After deploying this experiment by run `kubectl apply -f pod-failure.yaml`{{execute}}, you can expect that one of the pods has been injected and its image has been updated to `pause`, hopefully the pod status would be `CrashLoopBackOff`.

You can check this via our application: https://[[HOST_SUBDOMAIN]]-8082-[[KATACODA_HOST]].environments.katacoda.com/buddy/list 
And you will find that there are only two IPs left, which was three at the beginning.

After the experiment finished, which is set via `duration: 120s`  in the yaml, you will find that the pod resume and three IPs are shown in the web application. If you try to run `kubectl get pods`{{execute}}, you would see a similiar output

```
$ kubectl get pods
    NAME                                    READY   STATUS    RESTARTS   AGE
    buddy-list-deployment-c4667c574-gww82   1/1     Running   2          11m
    buddy-list-deployment-c4667c574-qnxc7   1/1     Running   0          11m
    buddy-list-deployment-c4667c574-slk49   1/1     Running   0          11m
```