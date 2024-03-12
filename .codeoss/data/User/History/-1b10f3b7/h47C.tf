resource "google_storage_bucket" "bucket" {
  name = "Pavan53463635"
  location = "EU"
  storage_class = "STANDARD"
  uniform_bucket_level_access ="TRUE"
  lifecycle_rule {
    condition {
        age = "1"
    }

    action {
        type = "DELETE"
    }
  }
  retention_policy {
    retention_period = ""
  }
}