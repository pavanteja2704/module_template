terraform {
    backend "gcs" {
    bucket  = "igenie-test-terraform"
    prefix  = "lz-net-hub"
  }
}