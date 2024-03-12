resource "google_storage_bucket" "bucket635" {
  name = "Pavan_55"
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