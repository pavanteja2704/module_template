module "logging_project_sink" {
  for_each = {
      for k, v in var.logging_project_sink: k => v
      }
    source   = "git::https://source.developers.google.com/p/my-project-amit1-415215/r/Rogers-LZ-Modules//terraform-google-logging-project-sink"  
    name                          = each.value.name
    destination                   = each.value.destination
    filter                        = each.value.filter
    description                   = each.value.description
    disabled                      = each.value.disabled
    project                       = each.value.project_id
    unique_writer_identity        = each.value.unique_writer_identity
    custom_writer_identity        = each.value.custom_writer_identity
    include_children              = each.value.include_children
}


# {
#   project          = "your_project_id"
#   name             = "your_sink_name"
#   destination      = "bigquery.googleapis.com/projects/your_project_id/datasets/your_dataset_id"
#   filter           = "logName:projects/your_project_id/logs/*"
#   unique_writer_identity = true
# }