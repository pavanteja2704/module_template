logging_project_sink = [
 {
    name                          = "sink name"
    destination                   = "destination"
    filter                        = "'filter'"
    description                   = "description"
    disabled                      = "disabled"
    project                       = "project_id"
    unique_writer_identity        = "unique_writer_identity"
    custom_writer_identity        = "custom_writer_identity"
    include_children              = "include_children"

    bigquery_options {
      use_partitioned_tables    = "use_partitioned_tables"
    }
    exclusions {
      name                     =  "name"
      description               =  "description"
      filter                    =  "filter"
      disabled                  =  "disabled"
    }
}
]