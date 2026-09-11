# Kubernetes baseline

This Kustomize base is intentionally not environment-specific. It contains the runtime safeguards that should be common across environments. It does not include an Ingress, credentials, a registry secret, or a deployment command.

Create a reviewed overlay per environment that sets the namespace, digest-pinned image, ingress policy, and capacity values. Validate locally with `kubectl kustomize infrastructure/kubernetes/base`; do not use `kubectl apply` until a cluster-specific change has been reviewed.
