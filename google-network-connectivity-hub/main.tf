  resource "google_network_connectivity_hub" "hub" {
  name        = var.hub_name
  description = var.description
  project     = var.project_id
  labels      = {
   label = var.label-one
  }
  
}