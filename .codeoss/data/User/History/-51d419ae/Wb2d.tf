#.................................... Terraform Backend ....................................#

terraform {
    backend "gcs" {
    bucket  = "pavan-test-terraform"
    prefix  = "lz-mon"
  }
}