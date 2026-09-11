# Kubernetes baseline

This Kustomize base is intentionally not environment-specific. It contains the runtime safeguards that should be common across environments. It does not include an Ingress, credentials, a registry secret, or a deployment command.

Create a reviewed overlay per environment that sets the namespace, digest-pinned image, capacity values, and explicit NetworkPolicy sources. The base denies all ingress; see [`overlays/README.md`](overlays/README.md) for the required source-selection guidance. Validate locally with `kubectl kustomize infrastructure/kubernetes/base | kubeconform -strict -summary -kubernetes-version 1.31.0`; this is offline schema validation and does not contact a Kubernetes API server. Do not use `kubectl apply` until a cluster-specific change has been reviewed.
