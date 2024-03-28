output "alert_policy_id" {
  description = "ID of the created alert policy"
  value = google_monitoring_alert_policy.policy
}