bucket = [
 {
     project_id    = "my-project-amit1-415215"
     bucket_name   = "tej-pt015"
     gcs_location  = "US"
     storage_class = "STANDARD"
     force_destroy = "true"
     labels        = {
        type = "data"
        tf = "true"
     }
     uniform_bucket_level_access  = "true"
     public_access_prevention   = "enforced"
     enable_versioning          = "true"
     custom_placement_config    = {
        data_locations = ["US-CENTRAL1","US-WEST1"]
     }
    
 }
]