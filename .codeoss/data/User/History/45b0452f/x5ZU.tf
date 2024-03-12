module "monitoring_alert_policy" {
    for_each = {
      for k, v in var.storage_bucket: k => v
      }
  source               = "./monitoring_alert_policy"
  credentials_file     = "path/to/your/credentials.json"
  project_id           = "your-project-id"
  region               = "us-central1"
  display_name         = "High CPU Usage Alert"
  notification_channel = "projects/your-project-id/notificationChannels/your-notification-channel"
}

module "storage_bucket" {
  
    source   = "git::https://source.developers.google.com/p/my-project-amit1-415215/r/Rogers-LZ-Modules//terraform-google_storage_bucket"  
    name     = each.value.bucket_name
    location = each.value.location
    storage_class = each.value.storage_class
    force_destroy = each.value.force_destroy
}