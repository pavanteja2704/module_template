module "network-connectivity-hub" {
  for_each = {
      for k, v in var.network-connectivity-hub: k => v
      }
    source      = "git::https://source.developers.google.com/p/my-project-amit1-415215/r/Rogers-LZ-Modules//terraform-google-network-connectivity-hub"  
    hub_name    = each.value.hub_name
    description = each.value.description
    project_id  = each.value.project_id
    label-one   = each.value.label-one
        
}