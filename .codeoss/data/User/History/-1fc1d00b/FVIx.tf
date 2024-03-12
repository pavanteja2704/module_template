resource "google_storage_bucket" "example" {
  name     = var.bucket_name
  location = var.location
  storage_class = var.storage_class
  force_destroy = var.force_destroy
}


module "storage_bucket" {
  for_each = {
      for k, v in var.folders: k => v
      }
    name     = each.value.bucket_name
    location = each.value.location
    storage_class = each.value.storage_class
    force_destroy = each.value.force_destroy
}