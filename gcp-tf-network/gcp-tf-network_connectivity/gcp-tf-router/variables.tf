variable "project_id" {
  type        = string
  description = "The project ID to deploy to"
}

variable "region" {
  type        = string
  description = "The region to deploy to"
}

variable "network" {
  type        = string
  description = "VPN name, only if router is not passed in and is created by the module."
  default     = ""
}

/* variable "create_router" {
  type        = bool
  description = "Create router instead of using an existing one, uses 'router' variable for new resource name."
  default     = false
} */
variable "router_name" {
  description               = "(Required) Name of the resource. "
  type                      = string
}
variable "router_description" {
  description               = "(Optional) An optional description of this resource."
  type                      = string
}
variable "bgp" {
  description               = "(Optional) BGP information specific to this router."
  type                      = list(object({
    asn                     = string
    advertise_mode          = string
    advertised_groups       = string
    advertised_ip_ranges    = list(object({
      range                 = string
      description           = sring
    }))
    keepalive_interval      = string
    identifier_range        = string
  }))
}
variable "encrypted_interconnect_router" {
  description               = "(Optional) Indicates if a router is dedicated for use with encrypted VLAN attachments (interconnectAttachments)."
  type                      = string
}
