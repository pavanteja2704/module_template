variable "project_id" {
  description = "The ID of the Google Cloud project where the Network Connectivity Hub will be created." 
}
 
variable "hub_name" {
  description = "The name of the Network Connectivity Hub."
}

variable "description" {
  description = "Description of the Network Connectivity Hub."
}

# variable "labels_one" {
#   description = "Labels to be attached to the network_connectivity_hub"
#   type = list(string)
# }
variable "labels" {
  description = "Labels to be attached to the buckets"
  type        = map(string)
}
