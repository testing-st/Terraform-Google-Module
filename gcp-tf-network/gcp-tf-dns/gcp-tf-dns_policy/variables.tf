

# # ###################################
# # /*google dns ploice started there*/
# # ###################################

variable "policy_name" {
  description = "The name of the DNS policy."
  type        = string
  
}

variable "description" {
  description = "A description for the DNS policy."
  type        = string
  
}

variable "enable_inbound_forwarding" {
  description = "Enable inbound forwarding."
  type        = bool
  
}

variable "policy_enable_logging" {
  description = "Enable logging."
  type        = bool
  
}


variable "target_name_servers" {
  description = "List of target name servers."
  type = list(object({
    ipv4_address    = string
    forwarding_path = optional(string)
  }))
  
}

variable "networks" {
  description = "List of networks for private visibility config (takes priority over GKE clusters)."
  type = list(object({
    network_url = string
  }))
  }

variable "project_id" {
  description = "The GCP project ID to create the DNS managed zone in."
  type        = string
  
}

# # #########################################################
# # /* Variables for google_dns_response_policy */
# # #########################################################

# variable "response_policy_name" {
#   description = "The name of the DNS response policy."
#   type        = string
  
# }

# variable "policy_rule_description" {
#   description = "Optional description for the DNS response policy."
#   type        = string
  
# }

# variable "policy_rule_networks" {
#   description = "List of networks associated with the DNS response policy."
#   type = list(object({
#     network_url = string
#   }))
  
# }

# variable "policy_rule_gke_clusters" {
#   description = "List of GKE clusters associated with the DNS response policy."
#   type = list(object({
#     gke_cluster_name = string
#   }))
  
# }

# # #########################################################
# # /* Variables for google_dns_response_policy_rule */
# # #########################################################

# variable "rule_name" {
#   description = "The name of the DNS response policy rule."
#   type        = string
  
# }

# variable "response_policy" {
#   description = "The name of the DNS response policy rule."
#   type        = string
  
# }


# variable "local_data" {
#   description = "Local data configurations for the DNS response policy rule."
#   type = list(object({
#     local_datas = list(object({
#       name    = string
#       type    = string
#       ttl     = optional(number)
#       rrdatas = list(string)
#     }))
#   }))
  
# }
