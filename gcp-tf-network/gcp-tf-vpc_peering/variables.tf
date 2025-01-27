variable "prefix" {
  description = "Name prefix for the network peerings"
  type        = string
  default     = "peering"
}
variable "local_network" {
  description = "Resource link of the network to add a peering to."
  type        = string
}
variable "peer_network" {
  description = "Resource link of the peer network."
  type        = string
}
variable "export_peer_custom_routes" {
  description = "Export custom routes to local network from peer network."
  type        = bool
  default     = false
}
variable "export_local_custom_routes" {
  description = "Export custom routes to peer network from local network."
  type        = bool
  default     = false
}
variable "export_subnet_routes_with_public_ip" {
  description = "(Optional) Whether subnet routes with public IP range are exported. The default value is true, all subnet routes are exported. "
  type        = bool
  default     = true
}
variable "import_subnet_routes_with_public_ip" {
  description = " (Optional) Whether subnet routes with public IP range are imported.The default value is false."
  type        = bool
  default     = false
}
variable "export_subnet_routes_with_public_ip" {
  description = "Whether subnet routes with public IP range are exported"
  type        = bool
  default     = null
}

variable "import_subnet_routes_with_public_ip" {
  description = "Whether subnet routes with public IP range are imported."
  type        = bool
  default     = null
}

variable "stack_type" {
  description = "(Optional) Which IP version(s) of traffic and routes are allowed to be imported or exported between peer networks. The default value is IPV4_ONLY. Possible values: ['IPV4_ONLY', 'IPV4_IPV6']."
  type        = string 
}

variable "module_depends_on" {
  description = "List of modules or resources this module depends on."
  type        = list(any)
  default     = []
}
