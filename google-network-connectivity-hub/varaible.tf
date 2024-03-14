variable "project_id" {
  description = "The ID of the Google Cloud project where the Network Connectivity Hub will be created."
  default = "test-project-01-rk"
}
 
variable "hub_name" {
  description = "The name of the Network Connectivity Hub."
  default = "pavan-hub"
}

variable "description" {
  description = "Description of the Network Connectivity Hub."
  default = "1st-hub"
}

variable "label-one" {
  description = "Labels to be attached to the network_connectivity_hub"
  type = list(string)
  default = "pavan"
}
