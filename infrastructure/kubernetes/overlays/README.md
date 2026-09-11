# Environment overlay requirements

The base `sample-api-ingress` NetworkPolicy deliberately denies all ingress to the sample API. This is a safe, portable default: Kubernetes NetworkPolicy rules without a `from` selector allow traffic from **every** source, which is not an appropriate cross-environment baseline.

Every deployable environment overlay **must** patch `sample-api-ingress` with its explicitly approved traffic sources. Prefer namespace and pod selectors that correspond to the actual ingress controller, gateway, or calling workload; do not use an empty `from` rule. Review selectors and ports with the platform owner because namespace labels and ingress-controller labels differ by cluster.

For example, an overlay may add a policy rule conceptually like this (replace the example labels with labels verified in the target cluster):

```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: sample-api-ingress
spec:
  ingress:
    - from:
        - namespaceSelector:
            matchLabels:
              kubernetes.io/metadata.name: ingress-nginx
          podSelector:
            matchLabels:
              app.kubernetes.io/component: controller
      ports:
        - protocol: TCP
          port: http
```

If the service should only be called by in-cluster workloads, select those namespaces and workloads instead. Add egress rules only after identifying required destinations (for example DNS, telemetry, or an API dependency) and validating their selectors/IPs.
