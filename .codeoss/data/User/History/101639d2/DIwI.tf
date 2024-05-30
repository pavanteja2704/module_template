module "monitoring_alert_policy" {
    for_each = {
      for k, v in try(var.monitoring_alert_policy,{}): k => v if v.delete != true
      }
  source                    = "/home/yellaboyinapavanteja/rogers/google_monitoring_alert_policy"
  display_name              = each.value.display_name
  monitoring_project_id     = each.value.monitoring_project_id
  notification_channels     = each.value.notification_channels
  enabled                   = each.value.enabled
  severity                  = each.value.severity
  user_labels               = each.value.user_labels
  combiner                  = each.value.combiner
  # conditions                = each.value.conditions
  # condition_absent          = each.value.condition_absent
  # aggregations              = each.value.aggregations
  # trigger                   = each.value.trigger
  # condition_monitoring_query_language = each.value.condition_monitoring_query_language
  # condition_threshold           = each.value.condition_threshold
  # denominator_aggregations      = each.value.denominator_aggregations
  # forecast_options              = each.value.forecast_options
  # condition_matched_log         = each.value.condition_matched_log
  # condition_prometheus_query_language = each.value.condition_prometheus_query_language
  # alert_strategy                = each.value.alert_strategy
  # notification_rate_limit       = each.value.notification_rate_limit
  # notification_channel_strategy = each.value.notification_channel_strategy
  # documentation                 = each.value.documentation
}