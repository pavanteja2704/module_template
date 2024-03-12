resource "google_logging_project_sink" "sink_name" {
  project          = "your_project_id"
  name             = "your_sink_name"
  destination = "bigquery.googleapis.com/projects/your_project_id/datasets/your_dataset_id"
  filter           = "logName:projects/your_project_id/logs/*"
  unique_writer_identity = true
}