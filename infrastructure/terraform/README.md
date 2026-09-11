# Terraform foundation

This directory establishes version constraints, validated environment inputs, and standard ownership/cost tags without configuring a provider, remote state backend, or resource. Therefore `terraform init -backend=false` and `terraform validate` are safe local checks and cannot create paid cloud resources.

When adopting a provider, add it in an environment composition (not the reusable module), use a separately managed encrypted remote backend with locking, and authenticate through short-lived workload identity. Do not commit credentials, state files, or `*.tfvars` containing secrets.
