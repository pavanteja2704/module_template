variable "monitoring_project_id" {
  type        = string
  description = "Project ID to create monitoring resources in"
  default     = "hardy-binder-411706"
}
variable "display_name" {
  type        = string
  description = "(Required) A short name or phrase used to identify the policy in dashboards, notifications, and incidents."
  default     = "moni"
}
 variable "enabled" {
  type = bool
  description = ""
  default = true
}
variable "notification_channels" {
  type = list(string)
  description = ""
  default = []
}
variable "severity" {
  type = string
  description = ""
  default = ""
  
}
variable "user_labels" {
  type = map(string)
  description = ""
  default = {
    "env" = "prod"
  }
}


variable "combiner" {
  type        = string
  description = "(Required) How to combine the results of multiple conditions to determine if an incident should be opened. "
  default     = "OR"
}

variable "conditions" {
  description = " (Optional) A condition that checks that a time series continues to receive new data points"
  type                      = list(object(
    {
      display_name    = string
      condition_absent = list(object(
        {
          duration    = string
          filter      = string
          aggregations =  list(object({
            per_series_aligner       = string
            group_by_fields          = list(string)
            alignment_period         = string
            cross_series_reducer     = string
            }))
          trigger   = list(object(
            {
              percent  = number
              count  = number
              }))
              }))
          }))
   default = [
    {
      # display_name = "pavan"
       condition_absent = [{
        duration = "60s"
        filter   =  "metric.type=\"compute.googleapis.com/instance/disk/write_bytes_count\" AND resource.type=\"gce_instance\""
        aggregations = [ {
          alignment_period = "60s"
          cross_series_reducer = null
          group_by_fields = []
          per_series_aligner = "ALIGN_RATE"
         }]
         trigger = [ {
           count = 1
           percent = 70
         } ]
       }]
      
    }
  ]
}
variable "condition_monitoring_query_language" {
  type                      = list(object(
    {
      query      =  string
      duration   =  string
      evaluation_missing_data = string

    trigger =  list(object(
      {
      #percent       = number
      count          = number
     }
    ))
  }))
  description = "(Optional) A Monitoring Query Language query that outputs a boolean stream Structure "
  default = [{
    duration = "60s"
    evaluation_missing_data = "EVALUATION_MISSING_DATA_INACTIVE"
    query = "compute_googleapis_com:instance_cpu_usage_time > 0"
    
    trigger = [ {
      count = 1
     # percent = ""
    } ]
    }]
}
variable "condition_threshold" {
  type                      = list(object(
    {
      threshold_value    =  number
      denominator_filter  =  string
      duration            =string
      comparison         = string
      filter            = string
      evaluation_missing_data = string

    denominator_aggregations =  list(object(
      {
      per_series_aligner        = string
      group_by_fields           = list(string)
      alignment_period          = string
      cross_series_reducer      = string
     }
    ))
    forecast_options =list(object(
      {
        forecast_horizon = string
      }
      ))
      trigger =  list(object(
      {
     # percent       = number
      count          = number
     }
    ))
      aggregations =  list(object(
      {
      per_series_aligner       = string
      group_by_fields          = list(string)
      alignment_period         = string
      cross_series_reducer     = string 
  }))
  }))

  description = "(Optional) A condition that compares a time series against a threshold "
  default = [{
    threshold_value = 0.5
    denominator_filter = null
    comparison =  "COMPARISON_GT"
    duration = "60s"
    filter = "metric.type=\"compute.googleapis.com/instance/disk/write_bytes_count\" AND resource.type=\"gce_instance\""
    evaluation_missing_data = ""

    denominator_aggregations = [ {
      alignment_period = "60s"
      cross_series_reducer = null
      group_by_fields = []
      per_series_aligner = "ALIGN_RATE"
    } ]

    forecast_options = [ {
      forecast_horizon = "3600s"
    } ]

    trigger = [ {
      count = 1
     # percent = ""
    } ]

    aggregations = [ {
      alignment_period = "60s"
      cross_series_reducer = null
      group_by_fields = []
      per_series_aligner = "ALIGN_RATE"
    } ] 
  }]
}
variable "condition_matched_log" {
  type                      = list(object(
    {
      filter            =  string
      label_extractors   =  string
  }))
  description = "(Optional) A condition that checks for log messages matching given constraints. If set, no other conditions can be present."
  default = [{
    filter = "metric.type=\"compute.googleapis.com/instance/disk/write_bytes_count\" AND resource.type=\"gce_instance\""
    label_extractors = null
  }]
}   
variable "condition_prometheus_query_language" {
  type                      = list(object(
    {
      query                 =  string
      duration              =  string
      evaluation_interval   = string
      labels                = map(string)
      rule_group            = string
      alert_rule            = string
          }))
  description = "(Optional) A condition type that allows alert policies to be defined using Prometheus Query Language (PromQL) "
  default = [{
    alert_rule     = "AlwaysOn"
    duration       = "60s"
    evaluation_interval = "60s"
    labels         = {
      "env"   = "non-prod"
    }
    query          = "compute_googleapis_com:instance_cpu_usage_time > 0"
    rule_group     = "a test"
  }]
}

variable "alert_strategy" {
  
  type = list(object({
    auto_close = string
    notification_rate_limit = list(object(
      {
        period = string
        }))
    notification_channel_strategy = list(object(
      {
        notification_channel_names = list(string)
        renotify_interval =string 
        })) 
  }))
  description = "hello"
  default = [ {
    auto_close = ""
    notification_rate_limit = [ {
      period    = ""
    } ]
    notification_channel_strategy = [ {
      notification_channel_names  = ["grtclick@gmail.com"]
      renotify_interval           = ""
    } ]
  } ]
}

variable "documentation" {
  type = list(object({
    mime_type = string
    content   = string
    subject   = string
  }))
  description = ""
  default = [ {
    mime_type = "text/markdown"
    content = ""
    subject = ""
  } ]
}


