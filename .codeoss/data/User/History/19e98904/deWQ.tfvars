monitoring_alert_policy = [
  {
   display_name        = "moni"
   monitoring_project_id               = "lz-testing-417613"
   enabled = "true"
   notification_channels = "notification_channel"
   severity =""
   user_labels = {
    "env" = "prod"
   }
   combiner     = "OR"
   name        = "High CPU Usage" *
 },
  conditions = [
    {
      display_name="test condition"
      condition_threshold={
      filter = "metric.type=\"compute.googleapis.com/instance/cpu/utilization\" AND resource.type=\"gce_instance\""
      comparison         = "COMPARISON_GT"
      threshold_value    = 90
      duration           = "60s"
     },
    
       aggregations = {
        alignment_period       = "60s"
        per_series_aligner     = "ALIGN_RATE"
        cross_series_reducer   = "REDUCE_MEAN"
      }
    }
  ]
]


