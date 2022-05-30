## Chaos Mesh

We have already installed Chaos Mesh in this cluster for you.
To check its status, you can run 
`kubectl get deployments,pods,services --namespace chaos-mesh`{{execute}}

The control plane components for the Chaos Mesh are:

- chaos=controller-manager: This is used to schedule and manage the lifecycle of chaos experiments. (This is a misnomer. This should be just named controller, not controller-manager, as it's the controller based on the Operator Pattern. The controller-manager is the Kubernetes control plane component that manages all the controllers like this one).
- chaos-daemon: These are the Pods that control the chaos mesh. The Pods run on every cluster Node and are wrapped in a DaemonSet. These DaemonSets have privileged system permissions to access each Node's network, cgroups, chroot, and other resources that are accessed based on your experiments.
- chaos-dashboard: An optional web interface providing you an alternate means to administer the engine and experiments. Its use is for convenience and any production use of the engine should be through the YAML resources for the Chaos Mesh CRDs.

The expect output of the above comman is like
```
$ kubectl get deployments,pods,services --namespace chaos-mesh
NAME                                       READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/chaos-controller-manager   3/3     3            3           3m4s
deployment.apps/chaos-dashboard            1/1     1            1           3m4s

NAME                                            READY   STATUS    RESTARTS   AGE
pod/chaos-controller-manager-58fd59575b-8w75x   1/1     Running   1          3m4s
pod/chaos-controller-manager-58fd59575b-hh5kw   1/1     Running   1          3m4s
pod/chaos-controller-manager-58fd59575b-n2gn6   1/1     Running   1          3m4s
pod/chaos-daemon-cnlvv                          1/1     Running   2          3m2s
pod/chaos-dashboard-688d4bbdb-qscwl             1/1     Running   2          3m4s

NAME                                    TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)                                 AGE
service/chaos-daemon                    ClusterIP   None           <none>        31767/TCP,31766/TCP                     3m5s
service/chaos-dashboard                 NodePort    10.106.63.86   <none>        2333:31278/TCP                          3m4s
service/chaos-mesh-controller-manager   ClusterIP   10.111.90.54   <none>        443/TCP,10081/TCP,10082/TCP,10080/TCP   3m5s
```

## Chaos Mesh Dashboard
The chaos dashboard is accessible via a NodePort. For this scenario we need the nodePort at a specific value, rather than its current random port number. Set the nodePort to a specific port:

`kubectl patch service chaos-dashboard -n chaos-mesh --type='json' --patch='[{"op": "replace", "path": "/spec/ports/0/nodePort", "value":31111}]'`{{execute}}

With the correct port value set, the web interface for Chaos Mesh dashboard can accessed from this link:["Chaos Mesh Dashboard"]({{TRAFFIC_HOST1_31111}}).

You will need a name and a token to login the dashboard. To get the name and token, run `token.sh`{{execute}} and then fill them in the dashboard.

There are no experiments yet, but take a few moments to explore the general layout of the dashboard. There is a way through the user interface to create, update, and delete experiments. In the next steps, you will define and submit an experiment through a YAML manifest rather than this interface.

Leave the dashboard tab open so you can reference it again once you have some experiments running.