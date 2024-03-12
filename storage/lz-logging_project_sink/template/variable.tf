variable "project_id" {
  description = "The ID of the Google Cloud project where the sink will be created."
}
 
variable "sink_name" {
  description = "The name of the logging sink to create."
}
 
variable "destination" {
description = "The destination where logs should be exported. For example: bigquery.googleapis.com/projects/your_project_id/datasets/your_dataset_id"
}
 
variable "filter" {
  description = "An advanced logs filter. Only log entries matching the filter are exported."
  default = "logName:projects/your_project_id/logs/*"
}
 
variable "unique_writer_identity" {
  description = "Whether or not to create a unique identity associated with this sink. Set to true to allow this sink to export logs."
  default = true
}