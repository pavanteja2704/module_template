module "monitoring_alert_policy" {
    for_each = {
      for k, v in var.storage_bucket: k => v
      }
  source               = "git::https://source.developers.google.com/p/my-project-amit1-415215/r/Rogers-LZ-Modules//terraform-google-monitoring_alert"
  project_id           = each.value.your-project-id
  region               = each.valueus-central1"
  display_name         = "High CPU Usage Alert"
  notification_channel = "projects/your-project-id/notificationChannels/your-notification-channel"
}
