module "monitoring_alert_policy" {
    for_each = {
      for k, v in var.monitoring_alert_policy: k => v
      }
  source               = "git::https://source.developers.google.com/p/my-project-amit1-415215/r/Rogers-LZ-Modules//terraform-google-monitoring_alert"
  project_id           = each.value.monitoring_project_id
  policies                  = each.value.policies
  user_labels               = each.value.user_labels
  notification_channels     = each.value.notification_channels
}
