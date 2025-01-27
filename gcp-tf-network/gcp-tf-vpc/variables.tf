variable "network_name" {
  type        = string
  description = "Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression [a-z]([-a-z0-9]*[a-z0-9])"
}
variable "description" {
  type        = string
  description = "An optional description of this resource. The resource must be recreated to modify this field."
}
variable "auto_create_subnetworks" {
  type        = bool
  description = "When set to true, the network is created in 'auto subnet mode' and it will create a subnet for each region automatically across the 10.128.0.0/9 address range. When set to false, the network is created in 'custom subnet mode' so the user can explicitly connect subnetwork resources."
  default     = false
}
variable "routing_mode" {
  type        = string
  default     = "GLOBAL"
  description = "The network routing mode (default 'GLOBAL')"
}
/* variable "bgp_best_path_selection_mode" {
  description = " (Optional, Beta) The BGP best selection algorithm to be employed. MODE can be LEGACY or STANDARD."
  type        = string
}
variable "bgp_always_compare_med" {
  description = "(Optional, Beta) Enables/disables the comparison of MED across routes with different Neighbor ASNs. This value can only be set if the --bgp-best-path-selection-mode is STANDARD"
  type = string
}
variable "bgp_inter_region_cost" {
  description = "(Optional, Beta) Choice of the behavior of inter-regional cost and MED in the BPS algorithm. Possible values are: DEFAULT, ADD_COST_TO_MED."
  type = string
} */
variable "mtu" {
  type        = number
  description = "The network MTU (If set to 0, meaning MTU is unset - defaults to '1460'). Recommended values: 1460 (default for historic reasons), 1500 (Internet default), or 8896 (for Jumbo packets). Allowed are all values in the range 1300 to 8896, inclusively."
  default     = 0
}
variable "enable_ula_internal_ipv6" {
  description = "(Optional) Enable ULA internal ipv6 on this network. Enabling this feature will assign a /48 from google defined ULA prefix fd20::/20."
  type = string
}
variable "internal_ipv6_range" {
  description = "(Optional) When enabling ula internal ipv6, caller optionally can specify the /48 range they want from the google defined ULA prefix fd20::/20. The input must be a valid /48 ULA IPv6 address and must be within the fd20::/20. Operation will fail if the speficied /48 is already in used by another resource. If the field is not speficied, then a /48 range will be randomly allocated from fd20::/20 and returned via this field."
  type = string
}
variable "network_firewall_policy_enforcement_order" {
  description = "(Optional) Set the order that Firewall Rules and Firewall Policies are evaluated. Default value is AFTER_CLASSIC_FIREWALL"
  type = string 
}
variable "project_id" {
  type        = string
  description = "The ID of the project where this VPC will be created"
}
variable "delete_default_internet_gateway_routes" {
  type        = bool
  description = "If set, ensure that all routes within the network specified whose names begin with 'default-route' and with a next hop of 'default-internet-gateway' are deleted"
  default     = false
}