output "google_bucket_details" {
  value = module.bucket
}
 
# output "bucket_self_link" {
#   description = "The URI of the created storage bucket."
#   value       = google_storage_bucket.example.self_link
# }