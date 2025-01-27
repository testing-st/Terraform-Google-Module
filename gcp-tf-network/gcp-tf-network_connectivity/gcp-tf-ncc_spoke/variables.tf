variable "name" {
  description                   = "(Required) Immutable. The name of the spoke. Spoke names must be unique."
  type                          = string
}
variable "hub" {
  description                   = "(Required) Immutable. The URI of the hub that this spoke is attached to."
  type                          = string
}
variable "location" {
  description                   = "(Required) The location for the resource"
  type                          = string
}
variable "labels" {
  description                   = "(Optional) Optional labels in key:value format. For more information about labels, see Requirements for labels. Note: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field effective_labels for all of the labels present on the resource."
  type                          = map(string)
}
variable "description" {
  description                   = " (Optional) An optional description of the spoke."
  type                          = string
}
variable "linked_vpn_tunnels" {
  description                   = "(Optional) The URIs of linked VPN tunnel resources Structure"
  type                          = list(object({
    uris                        = string
    site_to_site_data_transfer  = list(string)
    include_import_ranges       = list(string)
  }))
}
variable "linked_interconnect_attachments" {
  description                   = " (Optional) A collection of VLAN attachment resources. These resources should be redundant attachments that all advertise the same prefixes to Google Cloud. Alternatively, in active/passive configurations, all attachments should be capable of advertising the same prefixes."
  type                          = list(object({
    uris                        = string
    site_to_site_data_transfer  = string
    include_import_ranges       = string 
  }))
}
variable "linked_router_appliance_instances" {
  description                   = "(Optional) The URIs of linked Router appliance resources"
  type                          = list(object({
    instances                   = list(object({
      virtual_machine           = string
      ip_address                = string
    })) 
    site_to_site_data_transfer  = string
    include_import_ranges       = string
  }))
}
variable "linked_vpc_network" {
    description                 = " (Optional) VPC network that is associated with the spoke."
    type                        = list(object({
      uri                       = string
      exclude_export_ranges     = list(string)
      include_export_ranges     = list(string)
    })) 
}
variable "linked_producer_vpc_network" {
  description                   = "(Optional) Producer VPC network that is associated with the spoke. "
  type                          = list(object({
    network                     = string
    peering                     = string
    producer_network            = string
    include_export_ranges       = string
    exclude_export_ranges       = string
  }))
}
variable "project" {
  description                   = "(Optional) The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
  type                          = string
}
