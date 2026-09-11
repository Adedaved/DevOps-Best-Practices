variable "environment" {
  description = "Short environment identifier, such as dev or production."
  type        = string

  validation {
    condition     = can(regex("^[a-z][a-z0-9-]{1,14}$", var.environment))
    error_message = "environment must be 2-15 lowercase letters, numbers, or hyphens and start with a letter."
  }
}

variable "owner" {
  description = "Team accountable for this foundation."
  type        = string
  nullable    = false
}

variable "cost_center" {
  description = "Cost allocation identifier; use a non-sensitive value."
  type        = string
  nullable    = false
}

variable "additional_tags" {
  description = "Non-sensitive organization tags to merge into the standard tag set."
  type        = map(string)
  default     = {}
}
