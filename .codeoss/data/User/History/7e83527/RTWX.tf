variable "bucket_name" {
  description = "The name of the storage bucket."
  type        = string
}
 
variable "location" {
  description = "The location for the storage bucket."
  type        = string
}
 
variable "storage_class" {
  description = "The storage class for the storage bucket."
  type        = string
  default     = "STANDARD"
}
 
variable "force_destroy" {
  description = "Set to true to allow Terraform to destroy the bucket."
  type        = bool
  default     = false
}