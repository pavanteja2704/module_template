

storage_bucket = [
 {
     project_id = "your_project_id"
     sink_name = "your_sink_name"
     destination = "bigquery.googleapis.com/projects/your_project_id/datasets/your_dataset_id"
     filter = "logName:projects/your_project_id/logs/*"
     unique_writer_identity = true
  }
]