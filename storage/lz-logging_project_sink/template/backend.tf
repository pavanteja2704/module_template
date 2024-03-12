terraform {
    backend "gcs" {
    bucket  = "igenie-test-terraform"
    prefix  = "lz-storage_bucket"
  }
}