## Pod Chaos Experiment
### PodChaos introduction​
PodChaos is a fault type in Chaos Mesh. By creating a PodChaos experiment, you can simulate fault scenarios of the specified Pods or containers. Currently, PodChaos supports the following fault types:

- Pod Failure: injects fault into a specified Pod to make the Pod unavailable for a period of time.
- Pod Kill: kills a specified Pod.To ensure that the Pod can be successfully restarted, you need to configure ReplicaSet or similar mechanisms.
- Container Kill: kills the specified container in the target Pod.

For more information, please refer to the [official documentation](https://chaos-mesh.org/docs/simulate-pod-chaos-on-kubernetes/)

### the application
In this experiment, we would use a simple web application, in which it always return all the available pods' ip address.
To depoly this application, you can run `kubectl apply -f ./app`{{execute}}
And you can visit it here https://[[HOST_SUBDOMAIN]]-8082-[[KATACODA_HOST]].environments.katacoda.com/buddy/list.

### pod-failure experiment
In this experiment, we are going to make a certain pod ubavailable for a period of time, eg: 30 seconds.

```yaml
apiVersion: chaos-mesh.org/v1alpha1
kind: PodChaos
metadata:
  name: pod-failure-example
  namespace: chaos-testing
spec:
  action: pod-failure
  mode: one
  duration: '30s'
  selector:
    labelSelectors:
      'app.kubernetes.io/component': 'tikv'
```{{copy}}

### pod-kill example
Based on this example, Chaos Mesh injects pod-kill into the specified Pod and kills the Pod once.

```yaml
apiVersion: chaos-mesh.org/v1alpha1
kind: PodChaos
metadata:
  name: pod-kill-example
  namespace: chaos-testing
spec:
  action: pod-kill
  mode: one
  selector:
    namespaces:
      - tidb-cluster-demo
    labelSelectors:
      'app.kubernetes.io/component': 'tikv'
```{{copy}}

### container-kill experiment
Based on this example, Chaos Mesh injects container-kill into the specified container and kills the container once.
```yaml
apiVersion: chaos-mesh.org/v1alpha1
kind: PodChaos
metadata:
  name: container-kill-example
  namespace: chaos-testing
spec:
  action: container-kill
  mode: one
  containerNames: ['prometheus']
  selector:
    labelSelectors:
      'app.kubernetes.io/component': 'monitor'
```{{copy}}