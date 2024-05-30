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
  default = ["projects/hardy-binder-411706/notificationChannels/9156200506378571660"]
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
  type                      = list(object({
      display_name    = string
      condition_absent = list(object({
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
      condition_monitoring_query_languag = list(object({
        query      =  string
        duration   =  string
        evaluation_missing_data = string
        trigger    =  list(object({
         percent      = number
         count        = number
        }))
      }))
      condition_threshold = list(object({
        threshold_value     =  number
        denominator_filter  =  string
        duration            =string
        comparison          = string
        filter              = string
        evaluation_missing_data = string
        denominator_aggregations =  list(object({
          per_series_aligner        = string
          group_by_fields           = list(string)
          alignment_period          = string
          cross_series_reducer      = string
        }))
        forecast_options =list(object({
          forecast_horizon = string
        }))
        trigger =  list(object({
          percent       = number
          count          = number
        }))
        aggregations =  list(object({
          per_series_aligner       = string
          group_by_fields          = list(string)
          alignment_period         = string
          cross_series_reducer     = string 
        }))
      }))
      condition_matched_log = list(object({
        filter            =  string
        label_extractors   =  string
      }))
      condition_prometheus_query_language = list(object({
        query                 =  string
        duration              =  string
        evaluation_interval   = string
        labels                = map(string)
        rule_group            = string
        alert_rule            = string
      }))
  }))
  default =[ {
    condition_absent = [ {
      aggregations = [ {
        alignment_period = "60s"
        cross_series_reducer = null
        group_by_fields = [ ]
        per_series_aligner = "ALIGN_RATE"
      } ]
      duration = "120s"
      filter = "metric.type=\"compute.googleapis.com/instance/disk/write_bytes_count\" AND resource.type=\"gce_instance\""
      trigger = [ {
        count = 1
        percent = 70
      } ]
    }  ]
    condition_matched_log = [ {
      filter = "metric.type=\"compute.googleapis.com/instance/disk/write_bytes_count\" AND resource.type=\"gce_instance\""
      label_extractors = null
    } ]
    condition_monitoring_query_languag = [ {
      duration = "120s"
      evaluation_missing_data = "EVALUATION_MISSING_DATA_INACTIVE"
      query = "compute_googleapis_com:instance_cpu_usage_time > 0"
      trigger = [ {
        count = 1
        percent = 70
      } ]
    } ]
    condition_prometheus_query_language = [ {
      alert_rule = "AlwaysOn"
      duration = "60s"
      evaluation_interval = "60s"
      labels = {
        "env"   = "non-prod"
      }
      query = ""
      rule_group = "a test"
    } ]
    condition_threshold = [ {
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
    } ]
    display_name = "pavan"
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
    auto_close = "1800s"
    notification_rate_limit = [ {
      period    = ""
    } ]
    notification_channel_strategy = [ {
      notification_channel_names  = ["projects/hardy-binder-411706/notificationChannels/9156200506378571660"]
      renotify_interval           = "1800s"
    } ]
  }  ]
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
    content = "hai please add some data"
    subject = "best"
  } ]
}