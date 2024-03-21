module "network-hub" {
  for_each = {
      for k, v in try(var.nat,{}): k => v if v.delete != true
      }
     source      = "/home/yellaboyina_pavan/rogers/google-network-connectivity-hub" 
     hub_name    = each.value.hub_name
     description = each.value.description
     project_id  = each.value.project_id
     labels      = each.value.labels
#  "git::https://source.developers.google.com/p/my-project-amit1-415215/r/Rogers-LZ-Modules//terraform-google-network-connectivity-hub"       
}
