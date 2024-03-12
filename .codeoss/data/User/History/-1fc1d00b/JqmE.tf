module "storage_bucket" {
  for_each = {
      for k, v in var.storage_bucket: k => v
      }
    source                                = "git::https://source.developers.google.com/p/my-project-amit1-415215/r/Rogers-LZ-Modules//terraform-google_storage_bucket"  
    name     = each.value.bucket_name
    location = each.value.location
    storage_class = each.value.storage_class
    force_destroy = each.value.force_destroy
}