  resource "google_network_connectivity_hub" "hub" {
  name        = var.hub_name
  description = var.description
  project     = var.project_id
  # lable     = var.labels

  labels      = {
   label-one = "value-one"
  }
  
}