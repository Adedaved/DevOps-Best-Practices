#!/usr/bin/env bash
set -euo pipefail

root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$root_dir"

node --check service/src/app.js
node --check service/src/server.js
npm --prefix service run lint
npm --prefix service test

if command -v terraform >/dev/null 2>&1; then
  terraform fmt -check -recursive infrastructure/terraform
  (
    cd infrastructure/terraform/environments/dev
    terraform init -backend=false
    terraform validate
  )
else
  echo "WARNING: Terraform is not installed; skipping Terraform validation." >&2
fi

if command -v kubectl >/dev/null 2>&1; then
  kubectl kustomize infrastructure/kubernetes/base > /tmp/sample-api-manifests.yaml
  kubectl apply --dry-run=client --validate=true -f /tmp/sample-api-manifests.yaml
else
  echo "WARNING: kubectl is not installed; skipping Kubernetes validation." >&2
fi

if command -v docker >/dev/null 2>&1; then
  docker build --tag devops-sample-api:local service
else
  echo "WARNING: Docker is not installed; skipping container build." >&2
fi
