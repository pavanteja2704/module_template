module "monitoring_alert_policy" {
    for_each = {
      for k, v in try(var.monitoring_alert_policy,{}): k => v if v.delete != true
      }
  source                    = "/home/yellaboyina_pavan/rogers/google_monitoring_alert_policy"
  display_name              = each.value.display_name
  monitoring_project_id     = each.value.monitoring_project_id
  notification_channels     = each.value.notification_channels
  enabled                   =each.value.
  severity =
  user_labels =
  combiner             = each.value.combiner
  
  auto_close =
  period    =
  notification_channel_names  =
  renotify_interval           =

  mime_type =
  content = 
  subject =

  name_display=

  filter               =  each.value.filter
  duration             =  each.value.duration

  alignment_period     =  each.value.alignment_period
  per_series_aligner   =  each.value.per_series_aligner
  group_by_fields = 
  cross_series_reducer =  each.value.cross_series_reducer
  
  count = 
  percent =
  
  filter =

  duration =
  evaluation_missing_data =
  query =

  count = 
  percent =
  
  comparison           =  each.value.comparison
  threshold_value      =  each.value.threshold_value
  
  
   
}