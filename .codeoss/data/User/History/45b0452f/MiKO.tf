module "monitoring_alert_policy" {
  source               = "./monitoring_alert_policy"
  credentials_file     = "path/to/your/credentials.json"
  project_id           = "your-project-id"
  region               = "us-central1"
  display_name         = "High CPU Usage Alert"
  notification_channel = "projects/your-project-id/notificationChannels/your-notification-channel"
}