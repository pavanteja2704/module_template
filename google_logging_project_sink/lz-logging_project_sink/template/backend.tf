terraform {
    backend "gcs" {
    bucket  = "pavan-test-terraform"
    prefix  = "lz-log-sink"
  }
}