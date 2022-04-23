### pod-kill example
Based on this example, Chaos Mesh injects pod-kill into the specified Pod and kills the Pod once.

```yaml
apiVersion: chaos-mesh.org/v1alpha1
kind: PodChaos
metadata:
  name: pod-kill-example
  # namespace: chaos-testing
spec:
  action: pod-kill
  mode: one
  selector:
    # namespaces:
    #   - tidb-cluster-demo
    labelSelectors:
      'app': 'buddy-service'
```{{copy}}