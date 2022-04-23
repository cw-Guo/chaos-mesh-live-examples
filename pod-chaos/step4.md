## Pod Chaos Experiment
PodChaos is a fault type in Chaos Mesh. By creating a PodChaos experiment, you can simulate fault scenarios of the specified Pods or containers. Currently, PodChaos supports the following fault types:

- Pod Failure: injects fault into a specified Pod to make the Pod unavailable for a period of time.
- Pod Kill: kills a specified Pod.To ensure that the Pod can be successfully restarted, you need to configure ReplicaSet or similar mechanisms.
- Container Kill: kills the specified container in the target Pod.

For more information, please refer to the [official documentation](https://chaos-mesh.org/docs/simulate-pod-chaos-on-kubernetes/)

### the application
In this experiment, we would use a simple web application, in which it always return all the available pods' ip address.
To depoly this application, you can run `kubectl apply -f ./app`{{execute}}, `deploy.sh`{{execute}}
And you can visit it here https://[[HOST_SUBDOMAIN]]-8082-[[KATACODA_HOST]].environments.katacoda.com/buddy/list.

Or you can visit it via the tab.
You will see a list of IPs.



