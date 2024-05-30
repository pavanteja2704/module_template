variable "monitoring_project_id" {
  type        = string
  description = "Project ID to create monitoring resources in"
  default     = "hiiretail-monitoring-prod-6500"
}

variable "user_labels" {
  type        = map(any)
  description = "Project ID to create monitoring resources in"
  default     = {}
}

variable "notification_channels" {
  type        = list(any)
  description = "List of notificaton channel IDs"
  default     = []
}

variable "display_name" {
  type        = string
  description = "enter a name to display"
  default     = []
}

# variable "policies" {
#   type        = any
#   description = "List of configs for alert policies"
# }


variable "condition_absent" {
  type                      = list(object(
    {
      duration =  string
      filter   =  string
    aggregations =  list(object(
      {
      per_series_aligner       = string
      group_by_fields          = string
      alignment_period         = number
      cross_series_reducer     = string
      url                     = string  
  }))
   trigger   = list(object(
    {
      percent  = string
      count  = number
    }
    ))
    }))
  description = "we need ----- "
  default = [
    {
      duration =  string
      filter   =  string
      aggregations =[{
        alignment_period = 1
        cross_series_reducer = "value"
        group_by_fields = "value"
        per_series_aligner = "value"
        url = "value"
      }]
      trigger  =[{
        count = 1
        percent = "value"
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
      percent       = string
      count          = number
     }
    ))
  }))
  description = "we need ----- "
  default = [{
    duration = "value"
    evaluation_missing_data = "value"
    query = "value"
    
    trigger = [ {
      count = 1
      percent = "value"
    } ]
    }]
  }
  
  variable "condition_threshold" {
  type                      = list(object(
    {
      threshold_value    =  string
      denominator_filter  =  string
      duration            =string
      comparison         = string

    denominator_aggregations =  list(object(
      {
      per_series_aligner        = string
      group_by_fields           = string
      alignment_period          = number
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
      percent       = string
      count          = number
     }
    ))
      aggregations =  list(object(
      {
      per_series_aligner       = string
      group_by_fields          = string
      alignment_period         = number
      cross_series_reducer     = string
      url                     = string  
  }))
  }))
  }
  description = "we need ----- "
  default = [{
    threshold_value = "value"
    denominator_filter = "value"
    comparison = "value"
    duration = "value"

    denominator_aggregations = [ {
      alignment_period = 1
      cross_series_reducer = "value"
      group_by_fields = "value"
      per_series_aligner = "value"
    } ]

    forecast_options = [ {
      forecast_horizon = "value"
    } ]

    trigger = [ {
      count = 1
      percent = "value"
    } ]

    aggregations = [ {
      alignment_period = 1
      cross_series_reducer = "value"
      group_by_fields = "value"
      per_series_aligner = "value"
      url = "value"
    } ] 
  }]

  variable "condition_matched_log" {
  type                      = list(object(
    {
      filter       =  string
      label_extractors   =  string
  }))
  description = "we need ----- "
  default = [{
    filter = "value"
    label_extractors = "value"
  }]
  }
    
variable "condition_prometheus_query_language" {
  type                      = list(object(
    {
      query        =  string
      duration     =  string
      evaluation_interval = string
      labels       = string
      rule_group   = string
      alert_rule   = string
  }))
  description = "we need ----- "
  default = [{
    alert_rule     = "value"
    duration       = "value"
    evaluation_interval = "value"
    labels         = "value"
    query          = "value"
    rule_group     = "value"
  }]
}

variable "alert_strategy" {
  type                      = list(object(
    {
   auto_close = string
    notification_rate_limit =[
      {
        period = string
      }
    ]
    notification_channel_strategy =[
      {
        notification_channel_names = string
        renotify_interval =string 
      }
    ]
  }))
  description = "we need ----- "
  default = [{
    auto_close = "value"
  }]
}

