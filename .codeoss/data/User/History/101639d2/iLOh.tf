module "monitoring_alert_policy" {
    for_each = {
      for k, v in try(var.monitoring_alert_policy,{}): k => v if v.delete != true
      }
  source                    = "/home/yellaboyina_pavan/rogers/google_monitoring_alert_policy"
  display_name              = each.value.display_name
  monitoring_project_id     = each.value.monitoring_project_id
  notification_channels     = each.value.notification_channels
  enabled                   = each.value.enabled
  severity                  = each.value.severity
  user_labels               = each.value.user_labels
  combiner                  = each.value.combiner
  
  auto_close                = each.value.auto_close
  period                    = each.value.period
  notification_channel_names  = each.value.notification_channel_names
  renotify_interval           = each.value.renotify_interval

  mime_type                 = each.value.mime_type
  content                   = each.value.content
  subject                   = each.value.subject

  name_display              = each.value.name_display

  filter                    =  each.value.filter
  duration                  =  each.value.duration

  alignment_period          =  each.value.alignment_period
  per_series_aligner        =  each.value.per_series_aligner
  group_by_fields           =  each.value.group_by_fields
  cross_series_reducer      =  each.value.cross_series_reducer
  
  count                     = each.value.count
  percent                   = each.value.percent
  
  filter                    = each.value.filter

  duration                  = each.value.duration
  evaluation_missing_data   = each.value.evaluation_missing_data
  query                     = each.value.query

  count                     = each.value.count
  percent                   = each.value.percent
  
  alert_rule                = each.value.alert_rule
  duration                  = each.value.duration
  evaluation_interval       = each.value.evaluation_interval
  labels                    = each.value.labels
  query                     = each.value.query
  rule_group                = each.value.rule_group

  alignment_period = each.value.
  cross_series_reducer = each.value.
  group_by_fields = each.value.
  per_series_aligner = each.value.
  
  comparison = each.value.

  alignment_period = each.value.
  cross_series_reducer = each.value.
  group_by_fields = each.value.
  per_series_aligner = each.value.

  denominator_filter = each.value.
  duration = each.value.
  evaluation_missing_data = each.value.
  filter = each.value.

  forecast_horizon = each.value.

  count = each.value.
  percent = each.value.

  
  
   
}