project_id = "your_project_id"
sink_name = "your_sink_name"
destination = "bigquery.googleapis.com/projects/your_project_id/datasets/your_dataset_id"
filter = "logName:projects/your_project_id/logs/*"
unique_writer_identity = true

storage_bucket = [
 {
     project_id =	"hardy-binder-411706"
     bucket_name = "teja-name"
     location = "us-central1"
     storage_class = "STANDARD"
     force_destroy = false
  }
]