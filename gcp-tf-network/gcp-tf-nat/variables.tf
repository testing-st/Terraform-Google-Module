/* variable "create_nat" {
  type        = bool
  description = "Create NAT or not"
  default     = false
} */
variable "project_id" {
  type        = string
  description = "The project ID to deploy to"
}

variable "region" {
  type        = string
  description = "The region to deploy to"
}

variable "nat_name" {
  type        = string
  description = "Name of the NAT service"
}

variable "router_name" {
  type        = string
  description = "The name of the Cloud Router"
}

variable "nat_ip_allocate_option" {
  type        = string
  description = "How external IPs should be allocated for this NAT. Possible values are MANUAL_ONLY and AUTO_ONLY"
}
variable "initial_nat_ips" {
  type = string
  description = "(Optional) Self-links of NAT IPs to be used as initial value for creation alongside a RouterNatAddress resource. Conflicts with natIps and drainNatIps. Only valid if natIpAllocateOption is set to MANUAL_ONLY."
}

variable "icmp_idle_timeout_sec" {
  type        = string
  description = "Timeout (in seconds) for ICMP connections. Defaults to 30s if not set. Changing this forces a new NAT to be created."
  default     = "30"
}

variable "min_ports_per_vm" {
  type        = string
  description = "Minimum number of ports allocated to a VM from this NAT config. Defaults to 64 if not set. Changing this forces a new NAT to be created."
  default     = "64"
}
variable "max_ports_per_vm" {
  description = "(Optional) Maximum number of ports allocated to a VM from this NAT. This field can only be set when enableDynamicPortAllocation is enabled."
  type = string
}
variable "enable_dynamic_port_allocation" {
  description = " (Optional) Enable Dynamic Port Allocation. If minPortsPerVm is set, minPortsPerVm must be set to a power of two greater than or equal to 32. If minPortsPerVm is not set, a minimum of 32 ports will be allocated to a VM from this NAT config. If maxPortsPerVm is set, maxPortsPerVm must be set to a power of two greater than minPortsPerVm. If maxPortsPerVm is not set, a maximum of 65536 ports will be allocated to a VM from this NAT config. Mutually exclusive with enableEndpointIndependentMapping."
  type = string
}
variable "type" {
  description = " (Optional, Beta) Indicates whether this NAT is used for public or private IP translation. If unspecified, it defaults to PUBLIC. If PUBLIC NAT used for public IP translation. If PRIVATE NAT used for private IP translation. Default value is PUBLIC. Possible values are: PUBLIC, PRIVATE."
  type = string
}


variable "nat_ips" {
  type        = list(string)
  description = "List of self_links of external IPs. Changing this forces a new NAT to be created."
}
variable "drain_nat_ips" {
  description = "(Optional) A list of URLs of the IP resources to be drained. These IPs must be valid static external IPs that have been assigned to the NAT."
  type = string
}
variable "source_subnetwork_ip_ranges_to_nat" {
  type        = string
  description = "Defaults to ALL_SUBNETWORKS_ALL_IP_RANGES. How NAT should be configured per Subnetwork. Valid values include: ALL_SUBNETWORKS_ALL_IP_RANGES, ALL_SUBNETWORKS_ALL_PRIMARY_IP_RANGES, LIST_OF_SUBNETWORKS. Changing this forces a new NAT to be created."
  default     = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}

variable "tcp_established_idle_timeout_sec" {
  type        = string
  description = "Timeout (in seconds) for TCP established connections. Defaults to 1200s if not set. Changing this forces a new NAT to be created."
  default     = "1200"
}

variable "tcp_transitory_idle_timeout_sec" {
  type        = string
  description = "Timeout (in seconds) for TCP transitory connections. Defaults to 30s if not set. Changing this forces a new NAT to be created."
  default     = "30"
}
variable "tcp_time_wait_timeout_sec" {
  description = "(Optional) Timeout (in seconds) for TCP connections that are in TIME_WAIT state. Defaults to 120s if not set."
  type = string
}

variable "udp_idle_timeout_sec" {
  type        = string
  description = "Timeout (in seconds) for UDP connections. Defaults to 30s if not set. Changing this forces a new NAT to be created."
  default     = "30"
}

variable "subnetworks" {
  type = list(object({
    name                     = string,
    source_ip_ranges_to_nat  = list(string)
    secondary_ip_range_names = list(string)
  }))
  default = []
}

variable "log_config_enable" {
  type        = bool
  description = "Indicates whether or not to export logs"
  default     = false
}
variable "log_config_filter" {
  type        = string
  description = "Specifies the desired filtering of logs on this NAT. Valid values are: \"ERRORS_ONLY\", \"TRANSLATIONS_ONLY\", \"ALL\""
  default     = "ALL"
}

variable "enable_endpoint_independent_mapping" {
  type        = bool
  description = "Specifies if endpoint independent mapping is enabled."
  default     = null
}
variable "endpoint_types" {
  description = "Optional) Specifies the endpoint Types supported by the NAT Gateway. Supported values include: ENDPOINT_TYPE_VM, ENDPOINT_TYPE_SWG, ENDPOINT_TYPE_MANAGED_PROXY_LB."
  type = string 
}
variable "rules" {
  description = "A list of rules associated with this NAT."
  type = list(object({
    rule_number = string
    description = string
    match       = string
    action      = list(object({
      source_nat_active_ips   = string
      source_nat_drain_ips    = string
      source_nat_active_range = string
      source_nat_drain_ranges = string
    }))
  }))
}
variable "auto_network_tier" {
  description = "(Optional) The network tier to use when automatically reserving NAT IP addresses. Must be one of: PREMIUM, STANDARD. If not specified, then the current project-level default tier is used. Possible values are: PREMIUM, STANDARD."
  type = string
}