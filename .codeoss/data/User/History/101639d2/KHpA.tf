module "monitoring_alert_policy" {
    for_each = {
      for k, v in try(var.monitoring_alert_policy,{}): k => v if v.delete != true
      }
  source                    = "/home/yellaboyina_pavan/rogers/google_monitoring_alert_policy"
  display_name              = each.value.display_name
  monitoring_project_id     = each.value.monitoring_project_id
  notification_channels     = each.value.notification_channels
  enabled                   =each.value.
  severity =   each.value.
  user_labels = each.value.
  combiner             = each.value.combiner
  
  auto_close =each.value.
  period    = each.value.
  notification_channel_names  =each.value.
  renotify_interval           =each.value.

  mime_type =each.value.
  content = each.value.
  subject =each.value.

  name_display= each.value.

  filter               =  each.value.filter
  duration             =  each.value.duration

  alignment_period     =  each.value.alignment_period
  per_series_aligner   =  each.value.per_series_aligner
  group_by_fields = 
  cross_series_reducer =  each.value.cross_series_reducer
  
  count = each.value.
  percent = each.value.
  
  filter = each.value.

  duration = each.value.
  evaluation_missing_data = each.value.
  query = each.value.

  count = each.value.
  percent = each.value.
  
  alert_rule = each.value.
  duration= each.value.
  evaluation_interval = each.value.
  labels = each.value.
  query = each.value.
  rule_group = each.value.

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