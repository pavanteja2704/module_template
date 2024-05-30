resource "google_monitoring_alert_policy" "policy" {
  display_name                       = var.display_name
  combiner                           = var.combiner
  project                            = var.monitoring_project_id
  enabled                            = var.enabled
  notification_channels              = var.notification_channels  
  severity                           = var.severity
  user_labels                        = var.user_labels
  dynamic "conditions" {  
    for_each                       = var.conditions[*]
    content {
      display_name                     = lookup(conditions.value, "display_name", "")      
      dynamic "condition_absent" {
         for_each                       =  lookup(conditions.value,"condition_absent", [])
         content {
           duration                     = lookup(condition_absent.value, "duration", null)
           filter                       = lookup(condition_absent.value, "filter", null)
           dynamic "aggregations" {
            for_each                   = lookup(condition_absent.value, "aggregations", [])
              content {
               per_series_aligner       = lookup(aggregations.value, "per_series_aligner", null)
               group_by_fields          = lookup(aggregations.value, "group_by_fields", [])
               alignment_period         = lookup(aggregations.value, "alignment_period", null)
               cross_series_reducer     = lookup(aggregations.value, "cross_series_reducer", null)
              }
           }
           dynamic "trigger" {
            for_each                   = condition_absent.value.trigger == null ? [] : condition_absent.value.trigger[*]
             content {
               # percent                  = lookup(trigger.value, "percent","")
               count                    = lookup(trigger.value, "count", null)
             }
           }
          }
      }
      dynamic "condition_monitoring_query_language" {
       for_each                        =  lookup(conditions.value,"condition_monitoring_query_language", [])
       content {
         query                        = lookup(condition_monitoring_query_language.value, "query", null)
         duration                     = lookup(condition_monitoring_query_language.value, "duration", null)
         evaluation_missing_data      = lookup(condition_monitoring_query_language.value, "evaluation_missing_data", null)
         dynamic "trigger" {
             for_each                   = condition_monitoring_query_language.value.trigger == null ? [] : condition_monitoring_query_language.value.trigger[*]
             content {
               percent                 = lookup(trigger.value, "percent", "")
               count                     = lookup(trigger.value, "count", null)
              }
          }
        }
      }
      dynamic "condition_threshold" {
        for_each                       =  lookup(conditions.value,"condition_threshold", [])
        content {
          threshold_value              = lookup(condition_threshold.value, "threshold_value", "")
          denominator_filter           = lookup(condition_threshold.value, "denominator_filter", "")
          duration                     = lookup(condition_threshold.value, "duration", "")
          filter                       = lookup(condition_threshold.value, "filter", "")
          evaluation_missing_data      = lookup(condition_threshold.value, "evaluation_missing_data", "")
          comparison                   = lookup(condition_threshold.value, "comparison", "")
         dynamic "denominator_aggregations" {
           for_each                    = lookup(condition_threshold.value, "denominator_aggregations", [])
           content {
             per_series_aligner       = lookup(denominator_aggregations.value, "per_series_aligner", null)
             group_by_fields          = lookup(denominator_aggregations.value, "group_by_fields", [])
             alignment_period         = lookup(denominator_aggregations.value, "alignment_period", null)
             cross_series_reducer     = lookup(denominator_aggregations.value, "cross_series_reducer", null)
             
            }
          }
          dynamic "forecast_options" {
           for_each                   = lookup(condition_threshold.value, "forecast_options", []) 
            content {
             forecast_horizon         = lookup(forecast_options.value, "forecast_horizon", "")
            }
          }
          dynamic "trigger" {
           for_each                   = condition_threshold.value.trigger == null ? [] : condition_threshold.value.trigger[*] 
           content {
            #  percent                  = lookup(trigger.value, "percent", "")
             count                    = lookup(trigger.value, "count", null)
            }
          }
          dynamic "aggregations" {
            for_each                   = lookup(condition_threshold.value, "aggregations", [])
            content {
             alignment_period         = lookup(aggregations.value, "alignment_period", null)
             per_series_aligner       = lookup(aggregations.value, "per_series_aligner", null)
             cross_series_reducer     = lookup(aggregations.value, "cross_series_reducer", null)
             group_by_fields          = lookup(aggregations.value, "group_by_fields", [])
            }
          }
        }
      }
      dynamic "condition_matched_log" {
        for_each                   =  lookup(conditions.value,"condition_matched_log", [])
        content {
          filter                    = lookup(condition_matched_log.value, "filter", "")
          label_extractors          = lookup(condition_matched_log.value, "label_extractors", [])
        }
      }
      dynamic "condition_prometheus_query_language" {
        for_each                       = conditions.value.condition_absent == null ? conditions.value.condition_prometheus_query_language[*] : []
        content{
          query                      = lookup(condition_prometheus_query_language.value, "query", "")
          duration                   = lookup(condition_prometheus_query_language.value, "duration", "" )
          evaluation_interval        = lookup(condition_prometheus_query_language.value, "evaluation_interval", "")
          labels                     = lookup(condition_prometheus_query_language.value, "labels", [])
          rule_group                 = lookup(condition_prometheus_query_language.value, "rule_group", "")
          alert_rule                 = lookup(condition_prometheus_query_language.value, "alert_rule ", "")          
        } 
      }
    }
  }

  dynamic "alert_strategy" {
     for_each                      = var.alert_strategy[*]
     content {
          auto_close                   = lookup(alert_strategy.value,"auto_close", {})
          dynamic "notification_rate_limit" {
              for_each                    = lookup(alert_strategy.value, "notification_rate_limit", [])
               content {
                 period                   =    lookup(notification_rate_limit.value, "period", [])
                }
            }
          dynamic "notification_channel_strategy" {
             for_each                          = lookup(alert_strategy.value, "notification_channel_strategy", [])
              content {
                  notification_channel_names   =   lookup(notification_channel_strategy.value, "notification_channel_names", "")
                  renotify_interval            =  lookup(notification_channel_strategy.value, "renotify_interval", "")
               }
            }
        }
    } 
    dynamic "documentation" {
     for_each                        = var.documentation[*]
      content {
         mime_type                    = lookup(documentation.value, "mime_type", "")
         content                      = lookup(documentation.value, "content", "")
         subject                      = lookup(documentation.value, "subject", "")
        }
    }
}