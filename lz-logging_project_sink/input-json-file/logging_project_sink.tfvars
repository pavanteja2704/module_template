logging_project_sink = [
 {
    name                          = "sinkname1"
    destination                   = "pubsub.googleapi.com/projects/hardy-binder-411706/topics/topic1"
    filter                        = "resource.type = gce_instance AND severity >= WARNING"
    description                   = "description--01"
    # disabled                      = "disabled"
    # project_id                      = "hardy-binder-411706"
    # unique_writer_identity        = "unique_writer_identity"
    # custom_writer_identity        = "custom_writer_identity"
    # include_children                = "true"

#    bigquery_options               = [
#     /* {
#       use_partitioned_tables  = bool
#     } */
#   ]
#     exclusions =[ 
#     # {
#     #   name                      =  "name"
#     #   description               =  "description"
#     #   filter                    =  "filter"
#     #   disabled                  =  "disabled"
#     # }
# ]
}
]
