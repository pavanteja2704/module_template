output "bucket_name" {
  description = "The name of the created storage bucket."
value = google_storage_bucket.example.name
}
 
output "bucket_self_link" {
  description = "The URI of the created storage bucket."
  value       = google_storage_bucket.example.self_link
}