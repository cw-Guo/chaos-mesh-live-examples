## Chaos Mesh

We have already installed Chaos Mesh in this cluster for you.
To check its status, you can run 
`kubectl get deployments,pods,services --namespace chaos-mesh`{{execute}}

The control plane components for the Chaos Mesh are:

- chaos=controller-manager: This is used to schedule and manage the lifecycle of chaos experiments. (This is a misnomer. This should be just named controller, not controller-manager, as it's the controller based on the Operator Pattern. The controller-manager is the Kubernetes control plane component that manages all the controllers like this one).
- chaos-daemon: These are the Pods that control the chaos mesh. The Pods run on every cluster Node and are wrapped in a DaemonSet. These DaemonSets have privileged system permissions to access each Node's network, cgroups, chroot, and other resources that are accessed based on your experiments.
- chaos-dashboard: An optional web interface providing you an alternate means to administer the engine and experiments. Its use is for convenience and any production use of the engine should be through the YAML resources for the Chaos Mesh CRDs.


## Chaos Mesh Dashboard
Chaos Mesh Dashboard
The chaos dashboard is accessible via a NodePort. For this scenario we need the nodePort at a specific value, rather than its current random port number. Set the nodePort to a specific port:

kubectl patch service chaos-dashboard -n chaos-mesh --type='json' --patch='[{"op": "replace", "path": "/spec/ports/0/nodePort", "value":31111}]'

With the correct port value set, the web interface for Chaos Mesh dashboard can be seen from the tab Chaos Mesh above the command-line area or this link: https://[[HOST_SUBDOMAIN]]-31111-[[KATACODA_HOST]].environments.katacoda.com/.

There are no experiments yet, but take a few moments to explore the general layout of the dashboard. There is a way through the user interface to create, update, and delete experiments. In the next steps, you will define and submit an experiment through a YAML manifest rather than this interface.

Leave the dashboard tab open so you can reference it again once you have some experiments running.