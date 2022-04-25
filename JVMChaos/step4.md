## Pod Chaos Experiment
PodChaos is a fault type in Chaos Mesh. By creating a PodChaos experiment, you can simulate fault scenarios of the specified Pods or containers. Currently, PodChaos supports the following fault types:

- Pod Failure: injects fault into a specified Pod to make the Pod unavailable for a period of time.
- Pod Kill: kills a specified Pod.To ensure that the Pod can be successfully restarted, you need to configure ReplicaSet or similar mechanisms.
- Container Kill: kills the specified container in the target Pod.

For more information, please refer to the [official documentation](https://chaos-mesh.org/docs/simulate-pod-chaos-on-kubernetes/)

### The Application
In this experiment, we would use a simple java application, in which will print hundreds lines of `Hello World`.
Feel free to check the [source code](https://github.com/WangXiangUSTC/byteman-example/blob/main/example.helloworld/HelloWorld/Main.java)

We recommand you read the source code before proceeding to get a general idea about the program.

```JAVA

package HelloWorld;

public class Main {
    public static void main(String []args) {
        for(int x = 0; x < 1000; x = x+1) {
            try {
                Thread.sleep(1000);
                Main.sayhello(x);
            } catch (Exception e) {
                System.out.println("Got an exception!" + e);
            }
        }
    }

    public static void sayhello(int num) throws Exception {
        try {
            num = getnum(num);
            String s=String.valueOf(num);

            System.out.println(s + ". Hello World");
        } catch (Exception e) { 
            throw e;
        }
    }

    public static int getnum(int num) {
        return num;
    }
}

```




### Install the application

The YAML to deploy the application is as follows:

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

1. Build the application Pod:

`kubectl apply -f jvm/app.yaml`{{execute}}

2. check the pod status

`kubectl get pods`{{execute}}

The result is as follows:
```
$ kubectl get pods
NAME         READY   STATUS    RESTARTS   AGE
helloworld   1/1     Running   0          34s
```
### Observe the application
You can observe the behavior of `helloworld` application before injecting faults, for example:

`kubectl logs -f helloworld`{{execute}}

The result is as follows:
```
$ kubectl logs -f helloworld
0. Hello World
1. Hello World
2. Hello World
3. Hello World
4. Hello World
5. Hello World
6. Hello World
7. Hello World
8. Hello World
9. Hello World
```

You can see that `helloworld` outputs a line of Hello World every second, and the number of each line increases in turn.




