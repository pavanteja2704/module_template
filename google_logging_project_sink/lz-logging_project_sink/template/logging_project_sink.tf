module "logging_project_sink" {
  for_each = {
      for k, v in try(var.logging_project_sink,{}): k => v if v.delete != true
      }
    source                        = "/home/yellaboyina_pavan/Rogers-LZ-Modules/terraform-google-logging-project-sink"  
    name                          = each.value.name
    destination                   = each.value.destination
    filter                        = each.value.filter
    description                   = each.value.description
    # disabled                      = each.value.disabled
    # project_id                       = each.value.project_id
    # unique_writer_identity        = each.value.unique_writer_identity
    # custom_writer_identity        = each.value.custom_writer_identity
    # include_children               = each.value.include_children
     
    # use_partitioned_tables        = each.value.use_partitioned_tables

    # name_exclusions                     =  each.value.name_exclusions
    # description_exclusions              =  each.value.description_exclusions
    # filter_exclusions                   =  each.value.filter_exclusions
    # disabled-exclusions                 =  each.value.disabled-exclusions
}
