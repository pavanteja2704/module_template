resource "google_storage_bucket" "example" {
  name     = var.bucket_name
  location = var.location
  storage_class = var.storage_class
  force_destroy = var.force_destroy
}


module "folder_iam_binding" {
  for_each = {
      for k, v in var.folders: k => v
      }
  folder_id = each.value.folder_id
  role      = each.value.role
  members   = each.value.members
}