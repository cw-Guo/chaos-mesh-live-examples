## Trigger faults by setting Byteman configuration files Experiment
other than the previous simple JVMChaos, Chaos Mesh also provide a way to customize your own injection rule.

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

Here is the YAML we use to deploy a JVM experiment: Trigger faults by setting Byteman configuration files

```yaml
apiVersion: chaos-mesh.org/v1alpha1
kind: JVMChaos
metadata:
  name: modify-return
spec:
  action: ruleData
  ruleData: "RULE modify return value\nCLASS Main\nMETHOD getnum\nAT ENTRY\nIF true\nDO\n    return 9999\nENDRULE"
  mode: all
  selector:
    labelSelectors:
      'app': 'helloworld'
```{{copy}}

the `ruleData` itself should be written using [byteman-rule-language](https://downloads.jboss.org/byteman/4.0.16/byteman-programmers-guide.html#the-byteman-rule-language), which is a bytecode manipulation tool which makes it simple to change the operation of Java applications either at load time or while the application is running.

```
RULE modify return value
CLASS Main
METHOD getnum
AT ENTRY
IF true
DO
    return 9999
ENDRULE
```

The above rule would change the `getnum` function's return value to 9999.

You need to escape the line breaks in the configuration file to the newline character "\n", and use the escaped text as the value of "rule-data" as follows:
```
RULE modify return value\nCLASS Main\nMETHOD getnum\nAT ENTRY\nIF true\nDO return 9999\nENDRULE\n
```

After deploying this experiment by run `kubectl apply -f jvm/jvm-rule-data-example.yaml`{{execute}}, you can expect that the return log of this application return `9999. Hello World`.

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

the experiment can be easily removed via `kubectl delete -f jvm/jvm-rule-data-example.yaml`{{execute}}
