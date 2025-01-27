###############################################
/*google dns managed zone block started there*/
###############################################

resource "google_dns_managed_zone" "dns_zone" {
  visibility  = var.zone_visibility
  name        = var.name
  dns_name    = var.dns_name
  description = var.dns_description
  labels      = var.labels

  dynamic "dnssec_config" {
    for_each = var.zone_visibility == "public" ? [1] : []
    content {
    kind  = var.dnssec_kind
    state = var.dnssec_state
    non_existence = var.dnssec_state == "off" ? var.dnssec_non_existence : null
    dynamic "default_key_specs" {
      for_each = var.default_key_specs != null && var.dnssec_state == "off" ? var.default_key_specs : []
      content {
        algorithm  = default_key_specs.value.algorithm
        key_length = default_key_specs.value.key_length
        key_type   = default_key_specs.value.key_type
        kind       = default_key_specs.value.kind
      }
    }
  }
  }


  dynamic "private_visibility_config" {
    for_each = (var.networks != null && length(var.networks) > 0) || (var.gke_clusters != null && length(var.gke_clusters) > 0) ? [1] : []
    content {
      dynamic "networks" {
        for_each = var.networks != null && length(var.networks) > 0 ? var.networks : []
        content {
          network_url = networks.value.network_url
        }
      }

      dynamic "gke_clusters" {
        for_each = (var.networks == null || length(var.networks) == 0) && var.gke_clusters != null ? var.gke_clusters : []
        content {
          gke_cluster_name = gke_clusters.value.gke_cluster_name

        }
      }
    }
  }

  dynamic "forwarding_config" {
    for_each = var.forwarding_config[*]
    content {
     dynamic "target_name_servers" {
      for_each = lookup(forwarding_config.value,"target_name_servers",[])
      #var.forwarding_ipv4_address != null ? [1] : []
      content{
          ipv4_address    = lookup(target_name_servers.value,"ipv4_address")
          forwarding_path = lookup(target_name_servers.value,"forwarding_path")
      }
      }
    }
  }

  dynamic "peering_config" {
    for_each = var.peering_network_url != null ? [1] : []
    content {
      target_network {
        network_url = var.peering_network_url
      }
    }
  }

  project       = var.project_id
  force_destroy = var.force_destroy

  cloud_logging_config {
    enable_logging = var.enable_logging
  }
}



