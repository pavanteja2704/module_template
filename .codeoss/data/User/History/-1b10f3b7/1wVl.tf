resource "google_storage_bucket" "bucket" {
  name = "Pavan53463635"
  location = "EU"
  storage_class = "STANDARD"
  force_destroy = "true"
  lifecycle_rule {
    condition {
        age = "1"
    }

    action {
        type = "DELETE"
    }
  
  }
}