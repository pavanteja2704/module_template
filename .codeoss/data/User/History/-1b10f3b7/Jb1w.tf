resource "google_storage_bucket" "bucket" {
  name = "Pavan53463635"
  location = "EU"
  storage_class = var.storage_class
  uniform_bucket_level_access = var.access_type
  lifecycle_rule {
    condition {
        age = var.age
    }

    action {
        type = var.action_type
    }
  }
  retention_policy {
    retention_period = var.retention_period
  }
}