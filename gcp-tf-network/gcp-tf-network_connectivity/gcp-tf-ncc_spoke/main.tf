resource "google_network_connectivity_spoke" "name" {
  name                           = var.name
  hub                            = var.hub
  location                       = var.location
  labels                         = var.labels
  description                    = var.description
  dynamic "linked_vpn_tunnels" {
    for_each                     = var.linked_vpn_tunnels
    content {
      uris                       = lookup(linked_vpn_tunnels.value, "uris" ,"")
      site_to_site_data_transfer = lookup(linked_vpn_tunnels.value, "site_to_site_data_transfer" ,"")
      include_import_ranges      = lookup(linked_vpn_tunnels.value, "include_import_ranges" ,"")
    }
  }
  dynamic "linked_interconnect_attachments" {
    for_each                     = var.linked_interconnect_attachments
    content {
      uris                       = lookup(linked_interconnect_attachments.value, "uris" ,"")
      site_to_site_data_transfer = lookup(linked_interconnect_attachments.value, "site_to_site_data_transfer" ,"")
      include_import_ranges      = lookup(linked_interconnect_attachments.value, "include_import_ranges" ,"")
    }
  }
  dynamic "linked_router_appliance_instances" {
    for_each                     = var.linked_router_appliance_instances
    content {
      dynamic "instances" {
        for_each                 = lookup(linked_router_appliance_instances.value, "instances" ,"")
        content {
          virtual_machine        = lookup(instances.value, "virtual_machine" , "")
          ip_address             = lookup(instances.value, "ip_address" ,"") 
        }
      }
      site_to_site_data_transfer = lookup(linked_router_appliance_instances.value, "site_to_site_data_transfer" ,"")
      include_import_ranges      = lookup(linked_router_appliance_instances.value, "include_import_ranges" ,"")
    }
  }
  dynamic "linked_vpc_network" {
    for_each                     = var.linked_vpc_network
    content {
      uri                        = lookup(linked_vpc_network.value, "uri" ,"")
      exclude_export_ranges      = lookup(linked_vpc_network.value, "exclude_export_ranges" ,[])
      include_export_ranges      = lookup(linked_vpc_network.value, "include_export_ranges" ,[])
    }
  }
  dynamic "linked_producer_vpc_network" {
    for_each                     = var.linked_producer_vpc_network
    content {   
        network                  = lookup(linked_producer_vpc_network.value, "network" ,"")
        peering                  = lookup(linked_producer_vpc_network.value, "peering" ,"")
        producer_network         = lookup(linked_producer_vpc_network.value, "producer_network" ,"")
        include_export_ranges    = lookup(linked_producer_vpc_network.value, "include_export_ranges" ,"")
        exclude_export_ranges    = lookup(linked_producer_vpc_network.value, "exclude_export_ranges" ,"")
    }
    
  }
  project = var.project
}