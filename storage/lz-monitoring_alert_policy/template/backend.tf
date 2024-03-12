#.................................... Terraform Backend ....................................#

terraform {
    backend "gcs" {
    bucket  = "igenie-test-terraform"
    prefix  = "lz-org"
  }
}