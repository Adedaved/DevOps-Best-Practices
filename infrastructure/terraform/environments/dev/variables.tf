variable "environment" {
  description = "Environment identifier."
  type        = string
  default     = "dev"
}

variable "owner" {
  description = "Owning team."
  type        = string
  default     = "platform-engineering"
}

variable "cost_center" {
  description = "Non-sensitive cost allocation identifier."
  type        = string
  default     = "engineering"
}
