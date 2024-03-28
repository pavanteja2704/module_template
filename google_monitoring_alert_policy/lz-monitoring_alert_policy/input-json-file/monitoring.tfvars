monitoring_alert_policy = [
  {
   display_name        = "My Alert Policy"
   project               = "lz-testing-417613"
  #  notification_channels = "notification_channel"
   combiner     = "AND"
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


