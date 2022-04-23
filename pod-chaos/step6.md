### pod-kill example
Before we start the next experiment, you may need to reset the kubernete's port forward policy to avoid any application network problems. Run `reset-network.sh`{{execute}}

Based on this example, Chaos Mesh injects pod-kill into the specified Pod and kills the Pod once.

Before we start the experiment, you can go to our application and note down the three IPs listed there.

```yaml
apiVersion: chaos-mesh.org/v1alpha1
kind: PodChaos
metadata:
  name: pod-kill-example
  # namespace: chaos-testing
spec:
  action: pod-kill
  mode: one
  selector:
    # namespaces:
    #   - tidb-cluster-demo
    labelSelectors:
      'app': 'buddy-service'
```{{copy}}

If you run `kubect apply -f pod-kill`{{execute}}, you will find that a pod has been restarted.
Run `kubectl get pods`{{execute}}, the following output will show up.
```
$ kubectl get pods
NAME                                     READY   STATUS    RESTARTS   AGE
buddy-list-deployment-6d756fb8cf-hgr77   1/1     Running   0          2m10s
buddy-list-deployment-6d756fb8cf-k5mpt   1/1     Running   0          7s
buddy-list-deployment-6d756fb8cf-nlr5c   1/1     Running   0          10m
```

One of the pod's age would be pretty new and it's because our pod-kill experiment kill the old image, and the deployment's replica policy will always make sure that there are 3 replicas available, therefore, a new pod is created.

And if you go back to the web application, you will find that the one of the IPs has been updated.

#### clear the experiment

the experiment can be easily removed via `kubectl delete -f pod-kill.yaml`{{execute}}