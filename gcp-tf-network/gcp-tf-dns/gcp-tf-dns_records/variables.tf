#############################################
/*google dns record set block started there*/
#############################################

variable "dnssec_state" {
  description = "State of DNSSEC ('on', 'off', or 'transfer')."
  type        = string
}


variable "project_id" {
  description = "The GCP project ID to create the DNS managed zone in."
  type        = string
  
}

variable "record_name" {
  description = "The DNS record name."
  type        = string
  
}

variable "managed_zone" {
  description = "The DNS managed zone name."
  type        = string
}

variable "record_type" {
  description = "The DNS record type (e.g., A, CNAME)."
  type        = string
  
}

variable "ttl" {
  description = "Time to live for the DNS record."
  type        = number
  
}

variable "rrdatas" {
  description = "List of data for the DNS record."
  type        = list(string)
  
}



variable "routing_policies" {
  description = "List of routing policies for the DNS record."
  type = list(object({
    wrr = optional(object({
      weight  = number
      rrdatas = list(string)
      health_checked_targets = optional(object({
        internal_load_balancers = list(object({
          load_balancer_type = string
          ip_address         = string
          port               = string
          ip_protocol        = string
          network_url        = string
          project            = string
          region             = optional(string)
        }))
      }))
    }))
    geo = optional(object({
      location = string
      rrdatas  = optional(list(string))
      health_checked_targets = optional(object({
        internal_load_balancers = list(object({
          load_balancer_type = string
          ip_address         = string
          port               = string
          ip_protocol        = string
          network_url        = string
          project            = string
          region             = optional(string)
        }))
      }))
    }))
    primary_backup = optional(object({
      backup_geo = optional(object({
        location = string
        rrdatas  = optional(list(string))
        health_checked_targets = optional(object({
          internal_load_balancers = list(object({
            load_balancer_type = string
            ip_address         = string
            port               = string
            ip_protocol        = string
            network_url        = string
            project            = string
            region             = optional(string)
          }))
        }))
      }))
      enable_geo_fencing_for_backups = optional(bool)
      trickle_ratio                  = optional(number)
      primary = optional(object({
        internal_load_balancers = list(object({
          load_balancer_type = string
          ip_address         = string
          port               = string
          ip_protocol        = string
          network_url        = string
          project            = string
          region             = optional(string)
        }))
      }))
    }))
  }))
  
}

