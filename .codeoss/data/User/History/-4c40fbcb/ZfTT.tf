variable "monitoring_project_id" {
  type        = string
  description = "Project ID to create monitoring resources in"
  default     = "hiiretail-monitoring-prod-6500"
}
# variable "policies" {
#   type        = any
#   description = "List of configs for alert policies"
# }

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
variable "condition_absent" {
  type        = list(string)
  description = "List of notificaton channel IDs"
  default     = []
}
variable " name" {
  type        = string
  description = "name"
  default     = []
}
variable "condition_monitoring_query_language" {
  type        = list(string)
  description = ""
  default     = []
}
variable "condition_threshold" {
  type        = list(string)
  description = ""
  default     = []
}
variable "condition_prometheus_query_language" {
  type        = list(string)
  description = ""
  default     = []
}
variable "severity" {
  type        = list(string)
  description = ""
  default     = []
}
variable " enabled" {
  type        = list(string)
  description = ""
  default     = []
}
variable "alert_strategy" {
  type        = list(string)
  description = ""
  default     = []
}
variable "documentation" {
  type        = list(string)
  description = ""
  default     = []
}




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
    aggregations = [ {
      alignment_period = 1
      cross_series_reducer = "value"
      group_by_fields = "value"
      per_series_aligner = "value"
      url = "value"
    } ]
    comparison = "value"
    denominator_aggregations = [ {
      alignment_period = 1
      cross_series_reducer = "value"
      group_by_fields = "value"
      per_series_aligner = "value"
    } ]
    denominator_filter = "value"
    duration = "value"
    forecast_options = [ {
      forecast_horizon = "value"
    } ]
    threshold_value = "value"
    trigger = [ {
      count = 1
      percent = "value"
    } ]
  }]
  
    
 


