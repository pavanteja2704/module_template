monitoring_alert_policy = [
  {
   display_name                      = "moni"
   monitoring_project_id             = "hardy-binder-411706"
   enabled                           = "true"
   notification_channels             = "notification_channel"
   severity                          =""
   user_labels = {
    "env" = "prod"
    }
   combiner                           = "OR"
    
   alert_strategy =[ {
     auto_close = "1800s"
        notification_rate_limit =  {
         period    = ""
        } 
       notification_channel_strategy = {
          notification_channel_names  = ["projects/hardy-binder-411706/notificationChannels/9156200506378571660"]
          renotify_interval           = "1800s"
        } 
    } ]
    documentation = [{
      mime_type = "text/markdown"
      content = "hai please add some data"
      subject = "best"
    }]

  conditions = [{
      name_display="test condition"
        condition_absent =  [{
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
        }  ]
        condition_matched_log = {
           filter = ""
        #    label_extractors = ""
        } 
        condition_monitoring_query_languag = {
          duration = "120s"
          evaluation_missing_data = "EVALUATION_MISSING_DATA_INACTIVE"
          query = "compute_googleapis_com:instance_cpu_usage_time > 0"
          trigger = {
             count = 1
             percent = 70
            } 
        }  
        condition_prometheus_query_language = {
          alert_rule = "AlwaysOn"
          duration = "60s"
          evaluation_interval = "60s"
          labels = {
             "env"   = "non-prod"
            }
          query = "compute_googleapis_com:instance_cpu_usage_time > 0"
          rule_group = "a test"
        }
        condition_threshold =  {
          aggregations =  {
             alignment_period = "60s"
             cross_series_reducer = null
             group_by_fields = []
             per_series_aligner = "ALIGN_RATE"
            } 
          comparison = "COMPARISON_GT"
          denominator_aggregations =  {
               alignment_period = "60s"
               cross_series_reducer = null
               group_by_fields = [ ]
               per_series_aligner = "ALIGN_RATE"
            } 
         denominator_filter = null
         duration = "60s"
         evaluation_missing_data = ""
         filter = "metric.type=\"compute.googleapis.com/instance/disk/write_bytes_count\" AND resource.type=\"gce_instance\""
            forecast_options =  {
             forecast_horizon = "3600s"
            } 
         threshold_value = 1
            trigger =  {
             count = 1
             percent = 70
            } 
        }   
    }]
}]


