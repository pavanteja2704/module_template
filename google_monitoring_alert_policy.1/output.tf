output "Monitoring_Dashboard_Details" {
  description = "Monitoring Dashboard Details"
  value       = google_monitoring_alert_policy.policy
}