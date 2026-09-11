terraform {
  required_version = ">= 1.6.0, < 2.0.0"
}

module "platform_foundation" {
  source = "../../modules/platform-foundation"

  environment = var.environment
  owner       = var.owner
  cost_center = var.cost_center

  additional_tags = {
    system = "devops-reference-platform"
  }
}
