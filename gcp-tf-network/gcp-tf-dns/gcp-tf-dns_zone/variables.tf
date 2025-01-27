variable "zone_visibility" {
  description = "Visibility of the DNS managed zone ('public' or 'private')."
  type        = string
}

variable "name" {
  description = "The name of the DNS managed zone."
  type        = string
}

variable "dns_name" {
  description = "The DNS name suffix for the managed zone (e.g., 'example.com.')."
  type        = string
}

variable "dns_description" {
  description = "A description for the DNS managed zone."
  type        = string
}

variable "labels" {
  description = "Labels to apply to the DNS managed zone."
  type        = map(string)
}

variable "dnssec_kind" {
  description = "DNSSEC configuration kind (typically 'dns#managedZone')."
  type        = string
}

variable "dnssec_state" {
  description = "State of DNSSEC ('on', 'off', or 'transfer')."
  type        = string
}

variable "dnssec_non_existence" {
  description = "The DNSSEC non-existence setting ('nsec' or 'nsec3')."
  type        = string
}

variable "default_key_specs" {
  description = "A list of default key specifications for DNSSEC."
  type = list(object({
    algorithm  = string
    key_length = number
    key_type   = string
    kind       = string
  }))
}

variable "gke_clusters" {
  description = "List of GKE clusters for private visibility config (only used if networks are not provided)."
  type = list(object({
    gke_cluster_name = string
  }))
}

variable "networks" {
  description = "List of networks for private visibility config (takes priority over GKE clusters)."
  type = list(object({
    network_url = string
  }))
  }

variable "forwarding_config" {
  description = "IPv4 address for forwarding config (optional)."
  type        = list(object({
    target_name_servers = list(object({
      ipv4_address = string
      forwarding_path = string
    })) 
  }))
  }

variable "peering_network_url" {
  description = "Network URL for DNS peering config (optional)."
  type        = string
  }

variable "project_id" {
  description = "The GCP project ID to create the DNS managed zone in."
  type        = string
  
}

variable "force_destroy" {
  description = "If true, forces the deletion of the DNS managed zone even if it contains DNS records."
  type        = bool
  
}

variable "enable_logging" {
  description = "Enable Cloud Logging for the DNS managed zone."
  type        = bool
  
}

