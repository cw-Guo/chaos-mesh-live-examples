## Modify return values of a method Experiment

Here is the YAML we use to deploy a JVM experiment: Modify return values of a method

```yaml
apiVersion: chaos-mesh.org/v1alpha1
kind: JVMChaos
metadata:
  name: return
spec:
  action: return
  class: Main
  method: getnum
  value: "9999"
  mode: all
  selector:
    labelSelectors:
      'app': 'helloworld'
```{{copy}}

JVMChaos changes the return value of the getnum method to the number 9999, which means that the number of each line in the helloworld output is set to 9999.

Before the experiment, you can run `kubectl logs -f helloworld`{{execute}} to get the output of our application.

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

After deploying this experiment by run `kubectl apply -f jvm/jvm-return-example.yaml`{{execute}}, you can expect that the return value of `getnum` method has been changed to 9999 instead of a counter.


run `kubectl logs -f helloworld`{{execute}} to get the output

```
return execute
caught ReturnException
9999. Hello World
Rule.execute called for return_0:0
return execute
caught ReturnException
9999. Hello World
Rule.execute called for return_0:0
```

#### clear the experiment

the experiment can be easily removed via `kubectl delete -f jvm/jvm-return-example.yaml`{{execute}}
