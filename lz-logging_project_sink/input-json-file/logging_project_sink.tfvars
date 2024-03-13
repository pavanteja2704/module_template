logging_project_sink = [
 {
    #  project_id = "your_project_id"
    #  sink_name = "your_sink_name"
    #  destination = "bigquery.googleapis.com/projects/your_project_id/datasets/your_dataset_id"
    #  filter = "logName:projects/your_project_id/logs/*"
    #  unique_writer_identity = "true"

    name                          = "sink name"
    destination                   = "destination"
    filter                        = "'filter'"
    description                   = "description"
    disabled                      = "disabled"
    project                       = "project_id"
    unique_writer_identity        = "unique_writer_identity"
    custom_writer_identity        = "custom_writer_identity"
    include_children              = "include_children"
  }
]