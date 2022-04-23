### Container-kill Experiment

As before, run `reset-network.sh`{{execute}} to reset the port forward.

Based on this example, Chaos Mesh injects container-kill into the specified container and kills the container once.
This experiment wouldn't change anything on the pod level. 

Before we start the experiment, you can go to our application and note down the three IPs listed there.

For your convenienve, you can run `curl localhost:8082/buddy/list`{{execute}} instead to get the output of our application.

Run `kubectl get pods`{{execute}} to check the pod status.

```yaml
apiVersion: chaos-mesh.org/v1alpha1
kind: PodChaos
metadata:
  name: container-kill-example
  # namespace: chaos-testing
spec:
  action: container-kill
  mode: one
  containerNames: ['buddy-service']
  selector:
    labelSelectors:
      'app': 'buddy-service'
```{{copy}}

If you run `kubectl apply -f container-kill.yaml`{{execute}}, you will find that a pod's `restarts` updated.

run `curl localhost:8082/buddy/list`{{execute}} to get the output of our application.

Run `kubectl get pods`{{execute}}, the following output will show up.
```
$ kubectl get pods
NAME                                     READY   STATUS    RESTARTS   AGE
buddy-list-deployment-6d756fb8cf-hgr77   1/1     Running   0          19m
buddy-list-deployment-6d756fb8cf-k5mpt   1/1     Running   0          17m
buddy-list-deployment-6d756fb8cf-nlr5c   1/1     Running   1          27m
```

And if you go back to the web application, you will find that the IPs are the same because this container-kill experiment is on the container level, not the pod level, which is different from the pod-kill experiment.

#### clear the experiment

the experiment can be easily removed via `kubectl delete -f container-kill.yaml`{{execute}}