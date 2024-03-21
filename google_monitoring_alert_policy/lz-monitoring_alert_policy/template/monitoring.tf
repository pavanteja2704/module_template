module "monitoring_alert_policy" {
    for_each = {
      for k, v in try(var.monitoring_alert_policy,{}): k => v if v.delete != true
      }
  source               = "/home/yellaboyina_pavan/rogers/google_monitoring_alert_policy"
  project_id           = each.value.monitoring_project_id
  display_name         = each.value.display_name
  # notification_channels     = each.value.notification_channels
  # display_name         =  each.value.display_name
  filter               =  each.value.filter
  comparison           =  each.value.comparison
  threshold_value      =  each.value.threshold_value
  duration             =  each.value.duration
  alignment_period     =  each.value.alignment_period
  per_series_aligner   =  each.value.per_series_aligner
  cross_series_reducer =  each.value.cross_series_reducer
  combiner             = each.value.combiner 
}