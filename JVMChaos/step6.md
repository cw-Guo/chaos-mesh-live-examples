## Throw custom exceptions Experiment

<!-- Before we go through the new experiment, we need to re-deploy our application, to make the logs look tidy.
Of course, you can deploy multiple experiments in the same application. -->

<!-- run
`kubectl delete -f jvm/app.yaml`{{execute}}
`kubectl apply -f jvm/app.yaml`{{execute}} -->

check the output, run `kubectl logs -f helloworld`{{execute}}

The result is as follows:
```
$ kubectl logs -f helloworld
84. Hello World
85. Hello World
86. Hello World
87. Hello World
88. Hello World
89. Hello World
90. Hello World
91. Hello World
92. Hello World
93. Hello World
94. Hello World
95. Hello World
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
