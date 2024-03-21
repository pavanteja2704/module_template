# Create a monitoring alert policy
resource "google_monitoring_alert_policy" "my_alert_policy" {
  display_name = var.display_name
  project      = var.project_id
  combiner     = var.combiner   # Condition combiner: "AND" or "OR"
 
  conditions {
    name = var.name
    condition_threshold {
      filter = var.filter
      comparison = var.comparison
      threshold_value = var.threshold_value
      duration = var.duration
      aggregations {
        alignment_period = var.alignment_period
        per_series_aligner = var.per_series_aligner
        cross_series_reducer = var.cross_series_reducer
      }
    }
  }
 
  # notification_channels = [
  #   var.notification_channel
  # ]
}