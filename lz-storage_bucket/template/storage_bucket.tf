module "bucket" {
  for_each = {
      for k, v in try(var.nat,{}): k => v if v.delete != true
      }
    source                        = "git::https://source.developers.google.com/p/my-project-amit1-415215/r/Rogers-LZ-Modules//terraform-google-cloud-bucket"  
    project_id                    = each.value.project_id
    bucket_name                   = each.value.bucket_name
    gcs_location                  = each.value.gcs_location
    storage_class                 = each.value.storage_class
    force_destroy                 = each.value.force_destroy
    labels                        = each.value.labels
    uniform_bucket_level_access   = each.value.uniform_bucket_level_access
    public_access_prevention      = each.value.public_access_prevention
    enable_versioning             = each.value.enable_versioning
    custom_placement_config       = each.value.custom_placement_config
        
}
