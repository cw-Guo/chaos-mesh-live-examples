## Pod Chaos Experiment
PodChaos is a fault type in Chaos Mesh. By creating a PodChaos experiment, you can simulate fault scenarios of the specified Pods or containers. Currently, PodChaos supports the following fault types:

- Pod Failure: injects fault into a specified Pod to make the Pod unavailable for a period of time.
- Pod Kill: kills a specified Pod.To ensure that the Pod can be successfully restarted, you need to configure ReplicaSet or similar mechanisms.
- Container Kill: kills the specified container in the target Pod.

For more information, please refer to the [official documentation](https://chaos-mesh.org/docs/simulate-pod-chaos-on-kubernetes/)

### The Application
In this experiment, we would use a simple java application, in which will print hundreds lines of `Hello World`.
Feel free to check the [source code](https://github.com/WangXiangUSTC/byteman-example/blob/main/example.helloworld/HelloWorld/Main.java)


```YAML
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
```

To depoly this application, you can run `deploy.sh`{{execute}}
And you can visit it here https://[[HOST_SUBDOMAIN]]-8082-[[KATACODA_HOST]].environments.katacoda.com/buddy/list.




