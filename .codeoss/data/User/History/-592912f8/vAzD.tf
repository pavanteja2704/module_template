variable "monitoring_project_id" {
  type        = string
  description = "Project ID to create monitoring resources in"
  default     = "hardy-binder-411706"
}
variable "policies" {
  type        = any
  description = "List of configs for alert policies"
}

variable "user_labels" {
  type        = map(any)
  description = "Project ID to create monitoring resources in"
  default     = {}
}

variable "notification_channels" {
  type        = list(any)
  description = "List of notificaton channel IDs"
  default     = []
}