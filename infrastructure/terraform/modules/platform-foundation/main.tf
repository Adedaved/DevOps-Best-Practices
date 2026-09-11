locals {
  standard_tags = merge({
    managed_by  = "terraform"
    environment = var.environment
    owner       = var.owner
    cost_center = var.cost_center
  }, var.additional_tags)
}
