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
 
  conditions = [{
      display_name="test condition"
      condition_absent =  {
        aggregations =  {
          alignment_period = "60s"
          cross_series_reducer = null
          group_by_fields = [ ]
           per_series_aligner = "ALIGN_RATE"
        } 
      duration = "120s"
      filter = "metric.type=\"compute.googleapis.com/instance/disk/write_bytes_count\" AND resource.type=\"gce_instance\""
      trigger =  {
         count = 1
         percent = 70
        }  
    }  
    condition_matched_log = [ /*  {
      filter = ""
      # label_extractors = ""
    }  */]
    condition_monitoring_query_languag = [ /*  {
      duration = "120s"
      evaluation_missing_data = "EVALUATION_MISSING_DATA_INACTIVE"
      query = "compute_googleapis_com:instance_cpu_usage_time > 0"
      trigger = [ {
        count = 1
        percent = 70
      } ]
    }   */]
    condition_prometheus_query_language = [ /*  {
      alert_rule = "AlwaysOn"
      duration = "60s"
      evaluation_interval = "60s"
      labels = {
        "env"   = "non-prod"
      }
      query = "compute_googleapis_com:instance_cpu_usage_time > 0"
      rule_group = "a test"
    }  */ ]
    condition_threshold = [/*  {
      aggregations = [ {
        alignment_period = "60s"
        cross_series_reducer = null
        group_by_fields = []
        per_series_aligner = "ALIGN_RATE"
      } ]
      comparison = "COMPARISON_GT"
      denominator_aggregations = [ {
        alignment_period = "60s"
        cross_series_reducer = null
        group_by_fields = [ ]
        per_series_aligner = "ALIGN_RATE"
      } ]
      denominator_filter = null
      duration = "60s"
      evaluation_missing_data = ""
      filter = "metric.type=\"compute.googleapis.com/instance/disk/write_bytes_count\" AND resource.type=\"gce_instance\""
      forecast_options = [ {
        forecast_horizon = "3600s"
      } ]
      threshold_value = 1
      trigger = [ {
        count = 1
        percent = 70
      } ]
    }   */ ]
    
       aggregations = {
        alignment_period       = "60s"
        per_series_aligner     = "ALIGN_RATE"
        cross_series_reducer   = "REDUCE_MEAN"
      }
    }
  ]
]


