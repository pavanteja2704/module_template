variable "project_id" {
  description = "Your GCP project ID"
}
 
variable "display_name" {
  description = "Display name for the alert policy"
   type                        = string
}
variable "combiner" {
  description = "Display name for the alert policy"
   type                        = string

}
 
# variable "display_name" {
#   description = "display name for conditions"
#    type                        = string
# }
variable "filter" {
  description = "Notification channel for the alert policy"
   type                        = string
}
variable "comparison" {
  description = "Notification channel for the alert policy"
}
variable "threshold_value" {
  description = "Notification channel for the alert policy"
  type        = string
}
variable "duration" {
  description = "Notification channel for the alert policy"
  type        = string
}
variable "alignment_period" {
  description = "Notification channel for the alert policy"
  type        = string
}
variable "per_series_aligner" {
  description = "Notification channel for the alert policy"
  type        = string
}
variable "cross_series_reducer" {
  description = "Notification channel for the alert policy"
  type        = string
}
# variable "notification_channels" {
#   description = "Notification channel for the alert policy"
#   type        = list(any)
# }