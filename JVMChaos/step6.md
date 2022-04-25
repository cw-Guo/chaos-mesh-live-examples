## Throw custom exceptions Experiment

Before we go through the new experiment, we need to re-deploy our application, to make the logs look tidy.
Of course, you can deploy multiple experiments in the same application.

run
`kubectl delete -f jvm/app.yaml`{{execute}}
`kubectl apply -f jvm/app.yaml`{{execute}}

then check the output, run `kubectl logs -f helloworld`{{execute}}

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

Here is the YAML we use to deploy a JVM experiment: Throw custom exceptions

```yaml
apiVersion: chaos-mesh.org/v1alpha1
kind: JVMChaos
metadata:
  name: exception
spec:
  action: exception
  class: Main
  method: sayhello
  exception: java.io.IOException("BOOM")
  mode: all
  selector:
    labelSelectors:
      'app': 'helloworld'
```{{copy}}

JVMChaos throws custom exceptions in the function `sayhello`.

After deploying this experiment by run `kubectl apply -f jvm/jvm-exception-example.yaml`{{execute}}, you can expect that the return log of this application caught an execption.

run `kubectl logs -f helloworld`{{execute}} to get the output

```
exception execute
caught ThrowException
Got an exception!java.io.IOException: BOOM
Rule.execute called for exception_0:0
exception execute
caught ThrowException
Got an exception!java.io.IOException: BOOM
Rule.execute called for exception_0:0
```

#### clear the experiment

the experiment can be easily removed via `kubectl delete -f jvm/jvm-exception-example.yaml`{{execute}}
